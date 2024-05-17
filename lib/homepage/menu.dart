import 'package:flutter/material.dart';
import 'package:flutter_application_tic_tac_toe_game/homepage/homepage.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class MenuOfScreen extends StatefulWidget {
  const MenuOfScreen({super.key});

  @override
  _MenuOfScreenState createState() => _MenuOfScreenState();
}

class _MenuOfScreenState extends State<MenuOfScreen> {
  bool bc = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor(bc),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: LiteRollingSwitch(
                          value: true,
                          width: 120,
                          textOn: 'Light',
                          textOff: 'Dark',
                          colorOn: const Color.fromARGB(255, 224, 218, 216),
                          colorOff: const Color.fromARGB(255, 180, 121, 28),
                          iconOn: Icons.light_mode,
                          iconOff: Icons.dark_mode,
                          animationDuration: const Duration(milliseconds: 300),
                          onChanged: (bool state) {
                            setState(() {
                              bc = state;
                            });
                          },
                          onDoubleTap: () {},
                          onSwipe: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePAge(
                                  backgroundColor: Colors.black,
                                ),
                              ),
                            );
                          },
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomePAge(backgroundColor: darkColor(bc)),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 154, 19, 19)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow_rounded,
                          color: Color.fromARGB(153, 28, 27, 27),
                          size: 80,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Play Now",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(179, 48, 44, 44),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color darkColor(bool a) {
    if (a == true) {
      return Colors.red;
    } else {
      return const Color.fromARGB(255, 206, 187, 184);
    }
  }
}
