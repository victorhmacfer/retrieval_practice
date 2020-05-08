import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'styles/my_styles.dart';
import 'blocs/main_bloc.dart';
import 'package:retrieval_practice/screens/first_screen_picker.dart';

import 'utils/app_i18n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MainBloc _mainBloc = MainBloc();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'Spaced',
      theme: appTheme,
      localizationsDelegates: [
        SpacedAppLocalizationsDelegate()
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('pt')
      ],
      home: FirstScreenPicker(_mainBloc),
      debugShowCheckedModeBanner: false,
    );
  }
}
