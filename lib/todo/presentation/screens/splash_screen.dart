import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo/todo/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.4,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/splash.png',
              height: 130.0,
              width: 130.0,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Powered by',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black.withOpacity(0.62),
                          fontSize: 10.0,
                        ),
                  ),
                  const Gap(5.0),
                  Image.asset(
                    'assets/images/prosolv.png',
                    width: 80.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
