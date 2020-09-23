import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:validations/annotations.dart';
import 'package:validations/validations.dart';

part 'login_user.g.dart';
part 'login_user.jser.dart';

class LoginUser {
  @Alias('email', isNullable: false)
  @NotEmpty(message: 'Please enter your email')
  @Pattern(
      regexp: r'^[a-zA-Z0-9]+@nhs.net$',
      message: 'The email is incorrect. The email domain must be nhs.net')
  String email;

  @Alias('password', isNullable: false)
  @NotEmpty(message: 'Please enter your password')
  @Pattern(
      regexp: r'^[a-zA-Z0-9.! @#$%^&(){}\[\]:;<>,.?\/~_+-=|]*$',
      message: 'The password is incorrect')
  String password;

  LoginUser({
    this.email,
    this.password,
  });
}

@GenSerializer(nullableFields: true)
class LoginUserSerializer extends Serializer<LoginUser> with _$LoginUserSerializer {}

@GenValidator()
class LoginUserValidator extends Validator<LoginUser> with _$LoginUserValidator {}
