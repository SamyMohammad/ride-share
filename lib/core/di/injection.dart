import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_share/core/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String? environment) async =>
    getIt.init(environment: environment);
