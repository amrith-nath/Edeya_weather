import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'presentation/constants/colors/colors.dart';
import 'presentation/splash/screen_splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: kWhite,
    statusBarColor: kWhite,
  ));

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return const MaterialApp(
          title: 'Edeya Weather',
          debugShowCheckedModeBanner: false,
          home: ScreenSplash(),
        );
      },
    );
  }
}
