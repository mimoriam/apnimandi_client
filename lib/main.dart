import 'package:apnimandi_client/constants/constants.dart';
import 'package:flutter/material.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:
import 'package:form_builder_validators/form_builder_validators.dart';

/// State:
import 'package:provider/provider.dart';
import 'state/root_state.dart';
import 'state/theme_state.dart';

/// Utils/Helpers:
import 'utils/app_routes.dart';
// import 'package:device_preview/device_preview.dart';

/// Entry Point:
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => RootStateProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => ThemeStateProvider()),
      ],
      // child: DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => MyApp(),
      // ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      supportedLocales: const [
        Locale('en'),
      ],
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(primary: const Color(kPrimaryGreenColor)),
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
    );
  }
}
