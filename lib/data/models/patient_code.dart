import 'package:equatable/equatable.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'patient_code.jser.dart';

class PatientCode extends Equatable {
  @Alias('orgId', isNullable: false)
  final String orgId;

  @Alias('nhsId', isNullable: false)
  final String nhsId;
  PatientCode({
    this.orgId,
    this.nhsId,
  });

  @override
  List<Object> get props => [
        nhsId,
        orgId,
      ];
}

@GenSerializer(nullableFields: true)
class PatientCodeSerializer extends Serializer<PatientCode> with _$PatientCodeSerializer {}
