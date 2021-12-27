import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet/screens/mycard.dart';
import 'package:wallet/screens/splash.dart';

int? isViwed;
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViwed = prefs.getInt('screen');
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NTU Wallet',
      home: isViwed != 0 ? const SplashScreen() : const MyCardInfos(),
    );
  }
}
