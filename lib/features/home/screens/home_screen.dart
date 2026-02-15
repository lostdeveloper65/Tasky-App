import 'package:flutter/material.dart';
import 'package:taskyapp/core/constants/assets_class.dart';
import 'package:taskyapp/core/network/result.dart';
import 'package:taskyapp/core/utils/app_dialog.dart';
// import 'package:taskyapp/core/utils/app_dialog.dart';
import 'package:taskyapp/features/auth/data/firebase/auth_firebase_database.dart';
import 'package:taskyapp/features/auth/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = 'HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.symmetric(horizontal: 20),
        leading: Image.asset(AssetsConstants.taskyIcon),
        actions: [
          GestureDetector(
            onTap: () async {
              AppDialog.showLoading(context);
              var result = await AuthFunctions.signOutUser();
              switch (result) {
                case Success<void>():
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(LoginScreen.routeName);
                case ErrorState<void>():
              }
            },
            child: Row(
              children: [
                Image.asset(AssetsConstants.logOutIcon),
                SizedBox(width: 10),

                Text(
                  'Log out',
                  style: TextStyle(
                    color: Color(0xffFF4949),
                    fontSize: 16,
                    fontWeight: .w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            spacing: 20,
            children: [
              // AppDialog(),
              Image.asset(AssetsConstants.emptyHomeScreen),
              Text(
                'What do you want to do today?',
                style: TextStyle(fontSize: 20, fontWeight: .w400),
              ),
              Text(
                'Tap + to add your tasks',
                style: TextStyle(fontSize: 16, fontWeight: .w400),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xff24252C),
        foregroundColor: Color(0xff5F33E1),
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
