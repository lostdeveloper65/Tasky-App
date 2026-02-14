// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taskyapp/core/constants/assets_class.dart';
import 'package:taskyapp/features/auth/screens/register_sceen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const String routeName = 'OnboardingScreen';
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingData> onboardingList = dataOnBoarding();
  int index = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: .center,
          spacing: 30,
          children: [
            SizedBox(
              height: 260,
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                itemBuilder: (context, index) {
                  return CustomAnimaton(
                    delay: index,
                    index: index,
                    child: Image.asset(onboardingList[index].image),
                  );
                },
                itemCount: 3,
              ),
            ),

            SmoothPageIndicator(
              controller: controller,
              count: onboardingList.length,
              effect: ExpandingDotsEffect(
                spacing: 10,
                dotHeight: 5,
                dotWidth: 24,
                dotColor: Color(0xffAFAFAF),
                activeDotColor: Color(0xff5F33E1),
              ),
            ),

            CustomAnimaton(
              delay: (index + 1) * 200,
              index: index,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 38),
                width: double.infinity,
                child: Column(
                  spacing: 40,
                  children: [
                    Text(
                      onboardingList[index].title,
                      style: TextStyle(
                        color: Color(0xff404147),
                        fontSize: 32,
                        fontWeight: .w700,
                      ),
                    ),
                    Text(
                      onboardingList[index].description,
                      textAlign: .center,
                      style: TextStyle(
                        color: Color(0xff817D8D),
                        fontSize: 16,
                        fontWeight: .w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: AlignmentGeometry.bottomRight,
                child: MaterialButton(
                  onPressed: () {
                    index < onboardingList.length - 1
                        ? controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          )
                        : Navigator.of(
                            context,
                          ).pushReplacementNamed(RegisterScreen.routeName);
                  },
                  height: 48,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  color: Color(0xff5F33E1),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: Text(
                    index < onboardingList.length - 1 ? 'NEXT' : 'Get Started',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      fontWeight: .w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingData {
  OnboardingData({
    required this.title,
    required this.image,
    required this.description,
  });
  final String title;
  final String image;
  final String description;
}

List<OnboardingData> dataOnBoarding() {
  return [
    OnboardingData(
      title: 'Manage your tasks',
      description:
          'You can easily manage all of your daily tasks in DoMe for free',
      image: AssetsConstants.onboarding_1,
    ),
    OnboardingData(
      title: 'Create daily routine',
      description:
          'In Tasky you can create your personalized routine to stay productive',
      image: AssetsConstants.onboarding_2,
    ),
    OnboardingData(
      title: 'Orgonaize your tasks',
      description:
          'You can organize your daily tasks by adding your tasks into separate categories',
      image: AssetsConstants.onboarding_3,
    ),
  ];
}

class CustomAnimaton extends StatelessWidget {
  const CustomAnimaton({
    super.key,
    required this.index,
    required this.delay,
    required this.child,
  });
  final int index;
  final int delay;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (index == 1) {
      return FadeInLeft(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }

    return FadeInRight(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }
}
