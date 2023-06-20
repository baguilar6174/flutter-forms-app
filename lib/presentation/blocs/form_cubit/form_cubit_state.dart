part of 'form_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class FormCubitState extends Equatable {
  final FormStatus status;
  final bool isValid;
  final Username username;
  final Email email;
  final Password password;

  const FormCubitState({
    this.status = FormStatus.invalid,
    this.isValid = false,
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  FormCubitState copyWith({
    FormStatus? status,
    bool? isValid,
    Username? username,
    Email? email,
    Password? password,
  }) {
    return FormCubitState(
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, isValid, username, email, password];
}
