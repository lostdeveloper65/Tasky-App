import 'package:flutter/material.dart';
import 'package:taskyapp/core/helper/validator.dart';
import 'package:taskyapp/core/network/result.dart';
import 'package:taskyapp/core/utils/app_dialog.dart';
import 'package:taskyapp/features/auth/data/firebase/auth_firebase_database.dart';
import 'package:taskyapp/features/auth/screens/register_sceen.dart';
import 'package:taskyapp/features/auth/widgets/custom_text_form_field.dart';
import 'package:taskyapp/features/home/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController(
    text: 'gadomar712@gmail.com',
  );
  final TextEditingController passwordController = TextEditingController(
    text: 'O.m.a.r.65',
  );
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100, right: 24, left: 24),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: .start,
            spacing: 20,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: .w700,
                  color: Color(0xff404147),
                ),
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                title: 'Email',
                hintText: 'enter email...',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: CustomValidator.validateEmail,
              ),
              CustomTextFormField(
                title: 'Password',
                hintText: 'enter password...',
                controller: passwordController,
                isPassword: true,
                validator: CustomValidator.validatePassword,
              ),
              SizedBox(height: 40),
              MaterialButton(
                minWidth: double.infinity,
                color: Color(0xff5F33E1),
                height: 48,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                onPressed: _login,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: .w700,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
        },
        child: Row(
          spacing: 3,
          mainAxisAlignment: .center,
          children: [
            Text(
              'Don’t have an account? ',
              style: TextStyle(
                color: Color(0xff6E6A7C),
                fontWeight: .w400,
                fontSize: 12,
              ),
            ),
            Text(
              'Register',
              style: TextStyle(
                color: Color(0xff5F33E1),
                fontWeight: .w400,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    if (formKey.currentState!.validate()) {
      AppDialog.showLoading(context);
      final result = await AuthFunctions.loginUser(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.of(context).pop();
      switch (result) {
        case Success<String>():
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          break;
        case ErrorState<String>():
          AppDialog.showError(context, result.error);
          break;
      }
    }
  }
}
