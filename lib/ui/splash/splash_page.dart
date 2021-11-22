import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:media_dictionary/controller/splash_controller.dart';
import 'package:media_dictionary/core/theme/app_colors.dart';
import 'package:media_dictionary/routes/app_routes.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: InkWell(
          onTap: () {
            Get.offAllNamed(Routes.home);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff3A3287),
                        Color(0xff34519C),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 36,
                        ),
                        child: Text(
                          "O'zbekiston Respublikasi Oliy va O'rta maxsus ta'lim vazirligi"
                              .toUpperCase(),
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Text(
                        "Madaminova D.I",
                        style: TextStyle(color: AppColors.white, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 64),
                      const Text(
                        "XALQARO TASHKILOTLAR NAZARIYASI VA AMALIYOTI",
                        style: TextStyle(color: AppColors.white, fontSize: 36),
                        textAlign: TextAlign.center,
                      ),
                      Expanded(
                        child: Image.asset(
                          "assets/png/img_1.png",
                          color: AppColors.white,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
