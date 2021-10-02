import 'package:flutter_onsignal/data/remote/onesignal_repository_impl.dart';
import 'package:flutter_onsignal/data/repositories/onesignal_repository.dart';
import 'package:flutter_onsignal/domain/usecases/onesignal_initial_usecase.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
buildRepositories(String apiKey) => [
  RepositoryProvider<OneSignalRepository>(
    create: (_) => OneSignalRepositoryImpl(OneSignal.shared)
  ),

  //Uses Cases
  RepositoryProvider<OneSignalInitialUseCase>(
    create: (context) => OneSignalInitialUseCase(
      context.read<OneSignalRepository>(),
      apiKey
    ),
  ),
];