import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'patient.jser.dart';

class Patient extends Equatable {
  @Alias('mobilePhoneNumber', isNullable: false)
  final String mobilePhoneNumber;

  @Alias('telephoneNumber', isNullable: false)
  final String telephoneNumber;

  @Alias('firstName', isNullable: false)
  final String firstName;

  @Alias('surName', isNullable: false)
  final String surName;

  @Alias('displayName', isNullable: false)
  final String displayName;

  @Alias('birthDate', isNullable: false)
  final String birthDate;

  @Alias('nhsId', isNullable: false)
  final String nhsId;

  @Alias('emisId', isNullable: false)
  final String emisId;

  @Alias('odsCode', isNullable: false)
  final String odsCode;

  @Alias('gpName', isNullable: false)
  final String gpPractice;

  Patient({
    this.mobilePhoneNumber,
    this.telephoneNumber,
    this.firstName,
    this.surName,
    this.displayName,
    this.birthDate,
    this.nhsId,
    this.emisId,
    this.odsCode,
    this.gpPractice,
  });

  String get birthDateFormatted =>
      DateFormat('dd MMMM yyyy').format(DateFormat('yyyy-MM-dd').parse(birthDate));

  @override
  List<Object> get props => [
        mobilePhoneNumber,
        telephoneNumber,
        firstName,
        surName,
        displayName,
        birthDate,
      ];
}

@GenSerializer(nullableFields: true)
class PatientSerializer extends Serializer<Patient> with _$PatientSerializer {}
