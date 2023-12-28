import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testsuitmedia/data/data.dart';
import 'package:testsuitmedia/modules/modules.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          RepositoryProvider<UserRepository>(
            create: (_) => UserRepositoryImpl(ReqresInApiService()),
            child: MultiBlocProvider(
              providers: [
                BlocProvider<NameBloc>(create: (context) => NameBloc()),
                BlocProvider<UsersBloc>(
                  create: (context) => UsersBloc(
                    context.read<UserRepository>(),
                  ),
                ),
              ],
              child: await builder(),
            ),
          ),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
