import 'dart:convert';
import 'dart:io';

import 'package:ai_barcode/ai_barcode.dart';
import 'package:b13_flutter/data/models/patient_code.dart';
import 'package:b13_flutter/features/find_patient/screen/patient_manual_input/patient_manual_input.dart';
import 'package:b13_flutter/features/patient_detail/screen/patient_detail.dart';
import 'package:b13_flutter/features/welcome/screen/welcome.dart';
import 'package:b13_flutter/shared/themes/app_theme.dart';
import 'package:b13_flutter/shared/utils/screen_utils.dart';
import 'package:b13_flutter/shared/widgets/custom_dialog.dart';
import 'package:b13_flutter/shared/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'package:b13_flutter/localizations/localization_constants.dart';
import 'package:b13_flutter/shared/themes/colors.dart';
import 'package:b13_flutter/shared/widgets/rounded_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:tekartik_qrscan_flutter_web/qrscan_flutter_web.dart';

class ScanBarcodeScreen extends StatefulWidget {
  static const String route = '/barcode';

  @override
  _ScanBarcodePageState createState() => _ScanBarcodePageState();
}

class _ScanBarcodePageState extends State<ScanBarcodeScreen>
    with WidgetsBindingObserver {
  ScannerController _scannerController;
  PermissionStatus _permissionStatusCamera;
  bool isDenied = false;
  bool isWeb = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    _scannerController = ScannerController(
      scannerResult: (String result) {
        setState(() {
          _checkQrCode(result);
        });
      },
      scannerViewCreated: () {
        _checkPermission();
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _restartCameraPreview();
    } else if (state == AppLifecycleState.paused) {
      _stopCameraPreview();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void deactivate() {
    super.deactivate();
    _toggleCameraPreview();
  }

  _toggleCameraPreview() {
    if (_cameraGranted()) {
      if (_scannerController.isStartCameraPreview) {
        _scannerController.stopCameraPreview();
      } else {
        _scannerController.startCameraPreview();
      }
    }
  }

  @override
  void dispose() {
    _stopCameraPreview();
    _stopCamera();
    _scannerController = null;
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  _checkQrCode(String result) {
    try {
      PatientCode patientCode =
          PatientCodeSerializer().fromMap(jsonDecode(result));
      Fluttertoast.showToast(
        msg: getTranslated(context, 'home.scanSuccessfully'),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        backgroundColor: AppColor.grey,
      );
      Navigator.of(context).pushReplacementNamed(PatientDetailScreen.route,
          arguments: {'patientCode': patientCode});
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => CustomDialog(
          message: getTranslated(context, 'home.scanErrored'),
          onClose: () => _restartCameraPreview(),
        ),
      );
    }
  }

  bool _cameraGranted() {
    return _permissionStatusCamera == null
        ? false
        : _permissionStatusCamera == PermissionStatus.granted;
  }

  _checkPermission() async {
    _permissionStatusCamera =
        await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
    if (_cameraGranted()) {
      _startCameraPreview();
    } else {
      _requestPermission();
    }
  }

  _requestPermission() async {
    PermissionGroup cameraPermission = PermissionGroup.camera;
    List<PermissionGroup> permissions = [
      cameraPermission,
    ];
    Map<PermissionGroup, PermissionStatus> result =
        await PermissionHandler().requestPermissions(permissions);
    _permissionStatusCamera = result[cameraPermission];
    if (_cameraGranted()) {
      _startCameraPreview();
    } else {
      setState(() {
        isDenied = true;
      });
    }
  }

  _startCameraPreview() {
    if (Platform.isIOS) {
      Future.delayed(Duration(seconds: 1), () {
        _scannerController?.startCamera();
        _scannerController?.startCameraPreview();
      });
    } else if (Platform.isAndroid) {
      {
        _scannerController?.startCamera();
        _scannerController?.startCameraPreview();
      }
    }
  }

  _restartCameraPreview() {
    if (_cameraGranted()) {
      _scannerController?.startCameraPreview();
    }
  }

  _stopCameraPreview() {
    if (_cameraGranted()) {
      _scannerController?.stopCameraPreview();
    }
  }

  _stopCamera() {
    if (_cameraGranted()) {
      _scannerController?.stopCamera();
    }
  }

  String _qrCodeData;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future _scanQrCode() async {
    if (kIsWeb) {
      var data = await scanQrCode(context);
      setState(() {
        _qrCodeData = data;
        _checkQrCode(_qrCodeData);
      });
    } else {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('Only supported on the web')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PageFrameWidget(
      onCancel: () =>
          Navigator.of(context).pushReplacementNamed(WelcomeScreen.route),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Text(
                  getTranslated(context, 'home.findPatient'),
                  style: headerStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Text(
                  getTranslated(context, 'home.scanCameraPosition'),
                  style: regularStyle,
                ),
              ),
              kIsWeb
                  ? FloatingActionButton(
                      onPressed: _scanQrCode,
                      tooltip: 'Increment',
                      child: Icon(Icons.camera),
                    )
                  : Container(
                      width: size.width,
                      height: size.width * 9 / 16,
                      child: isDenied
                          ? Center(
                              child: Text(
                                getTranslated(
                                    context, 'home.permissionSetting'),
                                style: TextStyle(
                                    fontSize: 19.sp, color: Colors.white),
                              ),
                            )
                          : ClipRect(
                              child: OverflowBox(
                                alignment: Alignment.center,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Container(
                                    width: ScreenUtil.screenWidth /
                                        ScreenUtil.pixelRatio,
                                    height: ScreenUtil.screenHeight /
                                        ScreenUtil.pixelRatio,
                                    child: PlatformAiBarcodeScannerWidget(
                                      platformScannerController:
                                          _scannerController,
                                      unsupportedDescription:
                                          "Hello this is your custom text about unsupported platform tip",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 19.h),
                child: Text(
                  getTranslated(context, 'home.unableScan'),
                  style: regularStyle,
                ),
              ),
              RoundedButton(
                text: getTranslated(context, 'home.enterManually'),
                backgroundColor: AppColor.primaryColor,
                margin: EdgeInsets.only(bottom: 32.h),
                onPressed: () async {
                  _stopCameraPreview();
                  await Navigator.of(context)
                      .pushNamed(PatientManualInputScreen.route);
                  _restartCameraPreview();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
