import 'package:flutter/material.dart';
import 'index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Women Safety App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => WelcomePage2Widget());
          case '/login':
            return MaterialPageRoute(builder: (_) => LoginWidget());
          case '/signup':
            return MaterialPageRoute(builder: (_) => SignUpWidget());
          case '/terms':
            return MaterialPageRoute(builder: (_) => TermsWidget());
          case '/dashboard':
            return MaterialPageRoute(builder: (_) => DashboardMainWidget());
          case '/history':
            return MaterialPageRoute(builder: (_) => HistoryWidget());
          case '/contacts':
            return MaterialPageRoute(builder: (_) => ContactsWidget());
          case '/safetyTips':
            return MaterialPageRoute(builder: (_) => SafetyTipsWidget());
          default:
            return MaterialPageRoute(builder: (_) => WelcomePage2Widget());
        }
      },
    );
  }
}
