import 'package:flutter/material.dart';
import 'package:taskyapp/core/helper/validator.dart';
import 'package:taskyapp/core/network/result.dart';
import 'package:taskyapp/core/utils/app_dialog.dart';
import 'package:taskyapp/features/auth/data/firebase/auth_firebase_database.dart';
import 'package:taskyapp/features/auth/data/model/user_model.dart';
import 'package:taskyapp/features/auth/screens/login_screen.dart';
import 'package:taskyapp/features/auth/widgets/custom_text_form_field.dart';
import 'package:taskyapp/features/home/screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = 'RegisterScreen';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 100, right: 24, left: 24),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 10,
            crossAxisAlignment: .start,
            children: [
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: .w700,
                  color: Color(0xff404147),
                ),
              ),

              CustomTextFormField(
                title: 'Username',
                hintText: 'enter username...',
                controller: userNameController,
                icon: Icons.person_2_outlined,
                validator: CustomValidator.validateName,
              ),
              CustomTextFormField(
                title: 'Email',
                hintText: 'enter Email...',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                icon: Icons.email_outlined,
                validator: CustomValidator.validateEmail,
              ),
              CustomTextFormField(
                title: 'Password',
                hintText: 'enter password...',
                controller: passwordController,
                isPassword: true,
                validator: CustomValidator.validatePassword,
              ),
              CustomTextFormField(
                title: 'Confirm Password',
                hintText: 'confirm password...',
                controller: confirmPasswordController,
                isPassword: true,
                // validator: (){},
              ),
              SizedBox(height: 50),
              MaterialButton(
                minWidth: double.infinity,
                color: Color(0xff5F33E1),
                height: 48,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                onPressed: _registerUser,
                child: Text(
                  'Register',
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
          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        },
        child: Row(
          spacing: 3,
          mainAxisAlignment: .center,
          children: [
            Text(
              'Already have an account? ',
              style: TextStyle(
                color: Color(0xff6E6A7C),
                fontWeight: .w400,
                fontSize: 12,
              ),
            ),
            Text(
              'Login',
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

  void _registerUser() async {
    if (formKey.currentState!.validate()) {
      AppDialog.showLoading(context);
      final result = await AuthFunctions.registerUser(
        user: UserModel(
          email: emailController.text,
          password: passwordController.text,
          userName: userNameController.text,
        ),
      );
      Navigator.of(context).pop();
      switch (result) {
        case Success<UserModel>():
          Navigator.of(context).pushNamed(LoginScreen.routeName);
        case ErrorState<UserModel>():
          AppDialog.showError(context, result.error);
      }
    }
  }
}
