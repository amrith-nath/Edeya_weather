import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'd_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async {
  $initGetIt(getIt, environment: Environment.prod);
}
