import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:multi_vendor_app/Pages/loginpage.dart';
import 'package:multi_vendor_app/Pages/registerpage.dart';
import 'package:multi_vendor_app/mainlogin_screen.dart';
import 'package:multi_vendor_app/provider/cart_provider.dart';
import 'package:multi_vendor_app/provider/product_provider.dart';
import 'package:multi_vendor_app/vendor/views/screens/main_vendor_screen.dart';
import 'package:multi_vendor_app/views/buyers/auth/login_screen.dart';
import 'package:multi_vendor_app/views/buyers/auth/register_screen.dart';
import 'package:multi_vendor_app/views/main_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // home: const MyHomePage(title: 'Winkle'),
      //home: MainScreen(),
      //home: MainVendorScreen(),
      // home: LoginScreen(),
      //home: SplashScreen(),
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: SizedBox(
          width: 100, // Adjust width
          height: 100, // Adjust height
          child: Image.asset('assets/logo.png'), // Replace with your image path
        ),
        nextScreen: MainloginScreen(),
        // MainScreen(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Color.fromARGB(255, 218, 193, 174),
      ),
      builder: EasyLoading.init(),
    );
  }
}
