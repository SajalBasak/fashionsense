import 'dart:async';

import 'package:fashionsense/const/app_colors.dart';
import 'package:fashionsense/ui/bottom_nav_common.dart';
import 'package:fashionsense/ui/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 4),
      () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (_) => const BottomNavCommmon(),
          // builder: (_) => const LoginScreen(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.network(
            //     "https://firebasestorage.googleapis.com/v0/b/fashionsense-645f2.appspot.com/o/logo%2Flogo.png?alt=media&token=fd911382-35be-4ba9-a32f-5dc3ee935dcb"),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Fashion Sense",
                style: TextStyle(
                  fontSize: 44.sp,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const CircularProgressIndicator(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
