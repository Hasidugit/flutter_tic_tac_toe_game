import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_tic_tac_toe_game/homepage/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const HomePAge(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 32, 32),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: <Widget>[
                Text(
                  'TIC TAC TOE \n     game',
                  style: TextStyle(
                    fontSize: 40,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.blue[700]!,
                  ),
                ),
                Text(
                  'TIC TAC TOE \n     game',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const CircularProgressIndicator(
              color: Color.fromARGB(255, 162, 216, 13),
              strokeWidth: 5,
            )
          ],
        ),
      ),
    );
  }
}
