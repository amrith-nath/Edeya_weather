import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'presentation/constants/colors/colors.dart';
import 'presentation/screens/home/screen_home.dart';
import 'presentation/screens/splash/screen_splash.dart';
import 'presentation/theme/themes.dart';

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
        return MaterialApp(
          title: 'Edeya Weather',
          theme: MyTheme.kTheme,
          debugShowCheckedModeBanner: false,
          home: const ScreenSplash(),
        );
      },
    );
  }
}
