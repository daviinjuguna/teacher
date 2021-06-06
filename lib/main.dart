import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/util/parse_date.dart';
import 'core/util/simple_bloc_observer.dart';
import 'di/injection.dart';
import 'package:logging/logging.dart';

import 'features/presentation/pages/core/eshule.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  _setUpLogging();
  await configureInjection();
  runApp(Eshule());
}

void _setUpLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    print(
      ' ${event.level.name}: ${parseUniqueDate(event.time.millisecondsSinceEpoch ~/ 1000)}: ${event.message}',
    );
  });
}
