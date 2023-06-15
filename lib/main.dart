import 'package:allesc/pages/pages.dart';
import 'package:allesc/providers/navigation_bar_provider.dart';
import 'package:allesc/services/services.dart';
import 'package:allesc/themes/esc_color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => RankingGlobalService()),
        ChangeNotifierProvider(create: (_) => NavigationBarProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'comprobar',
      routes: {
        'comprobar': (BuildContext context) => const ComprobarAuthPage(),
        'register': (BuildContext context) => const RegisterPage(),
        'login': (BuildContext context) => const LoginPage(),
        'main': (BuildContext context) => const MainPage(),
      },
      scaffoldMessengerKey: NotificacionesService.messenserKey,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: ThemeMode.system,
    );
  }
}
