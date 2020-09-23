import 'package:intl/intl.dart';
import 'package:validations/annotations.dart';
import 'package:validations/validations.dart';
part 'search_patient.g.dart';

class SearchPatient {
  @Pattern(regexp: r'^[a-zA-Z ]*$', message: 'First name is invalid')
  @NotEmpty(message: 'First name is required')
  String firstName;

  @Pattern(regexp: r'^[a-zA-Z -]*$', message: 'Surname is invalid')
  @NotEmpty(message: 'Surname is required')
  String surname;

  @NotEmpty(message: 'Required')
  @Pattern(regexp: r'^(0?[1-9]|1[0-9]|2[0-9]|3[01])$')
  String day;

  @NotEmpty(message: 'Required')
  @Pattern(regexp: r'^(0?[1-9]|1[012])$')
  String month;

  @NotEmpty(message: 'Required')
  @Pattern(regexp: r'\d{4}$')
  String year;

  @NotEmpty()
  String orgCode;

  @NotEmpty()
  String gpPractice;

  String get dateOfBirth =>
      DateFormat('yyyy-mm-dd').format(DateFormat('yyyy-mm-dd').parse('$year-$month-$day'));
}

@GenValidator()
class SearchPatientValidator extends Validator<SearchPatient> with _$SearchPatientValidator {}
