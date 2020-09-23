// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class _$LoginUserValidator implements Validator<LoginUser> {
  static String emailNotEmptyMessage(Object validatedValue) {
    return 'Please enter your email';
  }

  static String emailInvalidMessage(String regexp, Object validatedValue) {
    return 'The email is incorrect. The email domain must be nhs.net';
  }

  static String passwordNotEmptyMessage(Object validatedValue) {
    return 'Please enter your password';
  }

  static String passwordInvalidMessage(String regexp, Object validatedValue) {
    return 'The password is incorrect';
  }

  @override
  List<FieldValidator> getFieldValidators() {
    return [
      FieldValidator<String>(name: 'email', validators: [
        NotEmptyValidator()..message = emailNotEmptyMessage,
        PatternValidator(regexp: r'^[a-zA-Z0-9]+@nhs.net$')..message = emailInvalidMessage
      ]),
      FieldValidator<String>(name: 'password', validators: [
        NotEmptyValidator()..message = passwordNotEmptyMessage,
        PatternValidator(regexp: r'^[a-zA-Z0-9.! @#$%^&(){}\[\]:;<>,.?\/~_+-=|]*$')
          ..message = passwordInvalidMessage
      ])
    ];
  }

  String validateEmail(Object value) => errorCheck('email', value);
  String validatePassword(Object value) => errorCheck('password', value);
  @override
  PropertyMap<LoginUser> props(LoginUser instance) {
    return PropertyMap<LoginUser>({'email': instance.email, 'password': instance.password});
  }
}
