// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_patient.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class _$SearchPatientValidator implements Validator<SearchPatient> {
  static String firstNameNotEmptyMessage(Object validatedValue) {
    return 'First name is required';
  }

  static String firstNameInvalidMessage(String regexp, Object validatedValue) {
    return 'First name is invalid';
  }

  static String surnameNotEmptyMessage(Object validatedValue) {
    return 'Surname is required';
  }

  static String surnameInvalidMessage(String regexp, Object validatedValue) {
    return 'Surname is invalid';
  }

  static String dayNotEmptyMessage(Object validatedValue) {
    return 'Required';
  }

  static String monthNotEmptyMessage(Object validatedValue) {
    return 'Required';
  }

  static String yearNotEmptyMessage(Object validatedValue) {
    return 'Required';
  }

  static String invalidMessage(String regexp, Object validatedValue) {
    return 'Invalid';
  }

  @override
  List<FieldValidator> getFieldValidators() {
    return [
      FieldValidator<String>(name: 'firstName', validators: [
        NotEmptyValidator()..message = firstNameNotEmptyMessage,
        PatternValidator(regexp: r'^[a-zA-Z ]*$')..message = firstNameInvalidMessage,
      ]),
      FieldValidator<String>(name: 'surname', validators: [
        NotEmptyValidator()..message = surnameNotEmptyMessage,
        PatternValidator(regexp: r'^[a-zA-Z -]*$')..message = surnameInvalidMessage,
      ]),
      FieldValidator<String>(name: 'day', validators: [
        NotEmptyValidator()..message = dayNotEmptyMessage,
        PatternValidator(regexp: r'^(0?[1-9]|1[0-9]|2[0-9]|3[01])$')..message = invalidMessage,
      ]),
      FieldValidator<String>(name: 'month', validators: [
        NotEmptyValidator()..message = monthNotEmptyMessage,
        PatternValidator(regexp: r'^(0?[1-9]|1[012])$')..message = invalidMessage,
      ]),
      FieldValidator<String>(name: 'year', validators: [
        NotEmptyValidator()..message = yearNotEmptyMessage,
        PatternValidator(regexp: r'\d{4}$')..message = invalidMessage,
      ]),
      FieldValidator<String>(name: 'odsCode', validators: [NotEmptyValidator()]),
      FieldValidator<String>(name: 'gpPractice', validators: [NotEmptyValidator()])
    ];
  }

  String validateFirstName(Object value) => errorCheck('firstName', value);
  String validateSurname(Object value) => errorCheck('surname', value);
  String validateDay(Object value) => errorCheck('day', value);
  String validateMonth(Object value) => errorCheck('month', value);
  String validateYear(Object value) => errorCheck('year', value);
  String validateOdsCode(Object value) => errorCheck('odsCode', value);
  String validateGpPractice(Object value) => errorCheck('gpPractice', value);
  @override
  PropertyMap<SearchPatient> props(SearchPatient instance) {
    return PropertyMap<SearchPatient>({
      'firstName': instance.firstName,
      'surname': instance.surname,
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
      'orgCode': instance.orgCode,
      'gpPractice': instance.gpPractice
    });
  }
}
