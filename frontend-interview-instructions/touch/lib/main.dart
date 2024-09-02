import 'package:flutter/material.dart';
import 'package:touch/constant/constant.dart';
import 'package:touch/screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Touch Interview',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      // initialRoute: '/splash',
      // routes: {
      //   '/spash': (context) => SplashScreen(),
      //   //more routes
      // },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _containerSize = 100.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _containerSize = 300.0;
    });

    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Welcome(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                color: Colors.grey.shade100,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     fit: BoxFit.cover,
                //     image: AssetImage(ConstanceData.splashBg),
                //   ),
                // ),
                child: Center(
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: _containerSize,
                    height: _containerSize,
                    child: ClipOval(child: Image.asset(ConstanceData.logo)),
                  ),
                ))));
  }
}
