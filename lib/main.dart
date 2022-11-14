import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'application/bloc/weather_bloc.dart';
import 'domine/d_injection/d_injection.dart';
import 'domine/db/db_functions.dart';
import 'domine/db/user/user_model.dart';
import 'domine/db/weather/weather_model.dart';
import 'presentation/core/colors/colors.dart';
import 'presentation/core/keys/messenger_key.dart';
import 'presentation/core/keys/navigator_key.dart';
import 'presentation/screens/splash/screen_splash.dart';
import 'presentation/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(WeatherModelAdapter());
  userBox = await Hive.openBox(boxName);
  weatherBox = await Hive.openBox(weatherBoxName);

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (ctx) => getIt<WeatherBloc>(),
        )
      ],
      child: MaterialApp(
        scaffoldMessengerKey: snackbarKey,
        navigatorKey: navigatorKey,
        title: 'Edeya Weather',
        theme: MyTheme.kTheme,
        debugShowCheckedModeBanner: false,
        home: const ScreenSplash(),
      ),
    );
  }
}
