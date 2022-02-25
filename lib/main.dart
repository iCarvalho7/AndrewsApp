import 'package:andrews_app/data/di/di.dart';
import 'package:flutter/material.dart';
import 'package:andrews_app/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependenciesInjection().start();
  runApp(const AndrewsApp());
}

class AndrewsApp extends StatefulWidget {
  const AndrewsApp({Key? key}) : super(key: key);

  @override
  _AndrewsAppState createState() => _AndrewsAppState();
}

class _AndrewsAppState extends State<AndrewsApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      routes: RoutesController.routes,
      initialRoute: Routes.main.tag,
    );
  }
}
