import 'package:flutter/material.dart';
import 'package:taskyapp/core/network/result.dart';
import 'package:taskyapp/features/auth/data/firebase/auth_firebase_database.dart';
import 'package:taskyapp/features/auth/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                title: 'Username',
                hintText: 'enter username...',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                title: 'Password',
                hintText: 'enter password...',
                controller: passwordController,
                isPassword: true,
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
      // floatingActionButton: ,
    );
  }

  void _login() async {
    if(formKey.currentState!.validate()){
    // showDialog(context: context, builder: )
    final result = await AuthFunctions.loginUser(
      email: emailController.text,
      password: passwordController.text,
    );
    Navigator.of(context).pop();
    switch (result) {
      case Success<String>():
        break;
      case ErrorState<String>():
        break;
    }}
  }
}
