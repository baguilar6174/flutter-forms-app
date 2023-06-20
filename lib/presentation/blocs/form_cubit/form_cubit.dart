import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:flutter_forms_app/infraestructure/infraestructure.dart';

part 'form_cubit_state.dart';

class FormCubit extends Cubit<FormCubitState> {
  FormCubit() : super(const FormCubitState());

  void onSubmit() {
    emit(
      state.copyWith(
        status: FormStatus.validating,
        username: Username.dirty(state.username.value),
        password: Password.dirty(state.password.value),
        email: Email.dirty(state.email.value),
        isValid: Formz.validate([state.username, state.password, state.email]),
      ),
    );
  }

  void usernameChanged(String value) {
    final Username username = Username.dirty(value);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate(
          [username, state.password, state.email],
        ),
      ),
    );
  }

  void emailChanged(String value) {
    final Email email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate(
          [email, state.password, state.username],
        ),
      ),
    );
  }

  void passwordChanged(String value) {
    final Password password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate(
          [password, state.username, state.email],
        ),
      ),
    );
  }
}
