import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_forms_app/presentation/presentation.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forms')),
      body: BlocProvider(
        create: (context) => FormCubit(),
        child: const _FormView(),
      ),
    );
  }
}

class _FormView extends StatelessWidget {
  const _FormView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _RegisterForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final formCubit = context.watch<FormCubit>();
    final username = formCubit.state.username;
    final password = formCubit.state.password;
    final email = formCubit.state.email;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Username',
            onChanged: formCubit.usernameChanged,
            errorText: username.errorMessage,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Email',
            onChanged: formCubit.emailChanged,
            errorText: email.errorMessage,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            onChanged: formCubit.passwordChanged,
            errorText: password.errorMessage,
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              formCubit.onSubmit();
            },
            icon: const Icon(Icons.save_as_sharp),
            label: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
