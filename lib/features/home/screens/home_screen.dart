import 'package:flutter/material.dart';
import 'package:taskyapp/core/constants/assets_class.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.symmetric(horizontal: 20),
        leading: Image.asset(AssetsConstants.taskyIcon),
        actions: [
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

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            spacing: 20,
            children: [
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
