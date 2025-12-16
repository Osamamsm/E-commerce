import 'package:e_commerce/core/despondency_injection/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> setupDependencies() async {
  await getIt.init();
}
