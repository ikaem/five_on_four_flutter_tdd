import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO this could probably be replaced with riverpod somehting
// class AppBlocObserver extends BlocObserver {
//   const AppBlocObserver();

//   @override
//   void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
//     super.onChange(bloc, change);
//     log('onChange(${bloc.runtimeType}, $change)');
//   }

//   @override
//   void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
//     log('onError(${bloc.runtimeType}, $error, $stackTrace)');
//     super.onError(bloc, error, stackTrace);
//   }
// }

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

// TODO we can do this eventually with provider scope
  // Bloc.observer = const AppBlocObserver();

  await runZonedGuarded(
    () async {
      //
      runApp(
        ProviderScope(
          child: await builder(),
        ),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
