import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/constants.dart';
import 'package:amazon_clone/constants/global_vaiables.dart';
import 'package:flutter/material.dart';

enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth groupValue = Auth.signUp;
  // form keys
  final _sugnUpFormKey = GlobalKey<FormState>();
  final _sugnInFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            RadioListTile(
              title: const Text("Create Account."),
              tileColor: groupValue == Auth.signUp ? Colors.white : null,
              value: Auth.signUp,
              groupValue: groupValue,
              onChanged: (Auth? value) {
                setState(() {
                  groupValue = value!;
                });
              },
            ),
            if (groupValue == Auth.signUp) _buildSignUpForm(),

            // Sign-In section
            RadioListTile(
              title: const Text("Sign-In."),
              tileColor: groupValue == Auth.signIn ? Colors.white : null,
              value: Auth.signIn,
              groupValue: groupValue,
              onChanged: (Auth? value) {
                setState(() => groupValue = value!);
              },
            ),
            if (groupValue == Auth.signIn) _buildSignInForm(),
          ],
        ),
      )),
    );
  }

  Form _buildSignUpForm() {
    return Form(
      key: _sugnUpFormKey,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomTextField(
              controller: _nameController,
              hintText: "Name",
            ),
            dummyHeight,
            CustomTextField(
              controller: _emailController,
              hintText: "Email",
            ),
            dummyHeight,
            CustomTextField(
              controller: _passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            dummyHeight,
            CustomButton(
              onTap: () {
                _sugnUpFormKey.currentState?.validate();
              },
              label: "Create Account",
            )
          ],
        ),
      ),
    );
  }

  Form _buildSignInForm() {
    return Form(
      key: _sugnInFormKey,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomTextField(
              controller: _emailController,
              hintText: "Email",
            ),
            dummyHeight,
            CustomTextField(
              controller: _passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            dummyHeight,
            CustomButton(
              onTap: () {
                _sugnInFormKey.currentState?.validate();
              },
              label: "Sign In",
            )
          ],
        ),
      ),
    );
  }
}
