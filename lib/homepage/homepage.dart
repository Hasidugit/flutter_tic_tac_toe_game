import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class HomePAge extends StatefulWidget {
  final Color backgroundColor;

  const HomePAge({super.key, this.backgroundColor = Colors.red});

  @override
  State<HomePAge> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> {
  bool oTurn = true;
  List<String> displayXO = ["", "", "", "", "", "", "", "", ""];
  String resultDeclaration = "";
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  bool winnerFound = false;
  int game = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Expanded(
                child: Center(
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: const BoxDecoration(color: Colors.cyanAccent),
                    child: Row(
                      children: [
                        const BackButton(
                          style: ButtonStyle(),
                          color: Colors.black,
                        ),
                        Center(
                            child: Text(
                          "$game Round",
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                          ),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            )),
            Container(),
            Expanded(
                flex: 1,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "player 'O'",
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Text(
                              xScore.toString(),
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 48,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                              "player 'x'",
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Text(
                              xScore.toString(),
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 48,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 3,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 100,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: Colors.amberAccent),
                          child: Center(
                              child: Text(
                            displayXO[index],
                            style: GoogleFonts.poppins(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          )),
                        ),
                      ),
                    );
                  },
                )),
            Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        resultDeclaration,
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 192, 187, 172)),
                          onPressed: () {
                            game != 3 ? _clearBord() : showAlertDialog(context);
                          },
                          child: Text(
                            game != 3 ? "Next round" : "Try Again",
                            style: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                            ),
                          ))
                    ],
                  ),
                ))
          ],
        ),
      )),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXO[index] == "") {
        displayXO[index] = "O";
        filledBoxes++;
      } else if (!oTurn && displayXO[index] == "") {
        displayXO[index] = "X";
        filledBoxes++;
      }
      oTurn = !oTurn;
      _checkWinner();
      Logger().f(index);
    });
  }

  void _checkWinner() {
//1 row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != "" &&
        winnerFound == false) {
      setState(() {
        resultDeclaration = "player ${displayXO[0]}  win the macth";
        Logger().f("1 okay");
        _updateScore(displayXO[0]);
      });
    }
//2 row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != "" &&
        winnerFound == false) {
      setState(() {
        resultDeclaration = "player ${displayXO[3]}  win the macth";
        Logger().f("2 okay");
        _updateScore(displayXO[3]);
      });
    }
//3 row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != "" &&
        winnerFound == false) {
      setState(() {
        resultDeclaration = "player ${displayXO[6]}  win the macth";
        Logger().f("3 okay");
        _updateScore(displayXO[6]);
      });
    }
//cros\
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != "" &&
        winnerFound == false) {
      setState(() {
        resultDeclaration = "player ${displayXO[0]}  win the macth";
        Logger().f("cross  okay");
        _updateScore(displayXO[0]);
      });
    }
//cross /
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != "" &&
        winnerFound == false) {
      setState(() {
        resultDeclaration = "player ${displayXO[2]}  win the macth";
        Logger().f("cross / okay");
        _updateScore(displayXO[2]);
      });
    }
//1column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != "" &&
        winnerFound == false) {
      setState(() {
        resultDeclaration = "player ${displayXO[0]}  win the macth";
        Logger().f("1c okay");
        _updateScore(displayXO[0]);
      });
    }
    //2column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != "" &&
        winnerFound == false) {
      setState(() {
        resultDeclaration = "player ${displayXO[1]}  win the macth";
        Logger().f("2c okay");
        _updateScore(displayXO[1]);
      });
    }
    //3column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != "" &&
        winnerFound == false) {
      setState(() {
        resultDeclaration = "player ${displayXO[2]}  win the macth";
        Logger().f(" 3c okay");
        _updateScore(displayXO[2]);
      });
    }
    if (!winnerFound && filledBoxes == 9) {
      resultDeclaration = "Nobody wins";
    }
    if (winnerFound) {}
  }

  void _updateScore(String winner) {
    if (winner == "O") {
      oScore++;
    } else if (winner == "X") {
      xScore++;
    }
    winnerFound = true;
  }

  void _clearBord() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = "";
      }
      resultDeclaration = "";
    });
    filledBoxes = 0;
    winnerFound = false;
    game++;
  }

  void _fclearBord() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = "";
      }
      resultDeclaration = "";
    });
    filledBoxes = 0;
    winnerFound = false;
    game = 1;

    // Dismiss the alert dialog
    Navigator.pop(context);
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        _fclearBord();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: xScore > oScore
          ? const Text(
              "'O' Won the whole Match !",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          : const Text(
              "'X' Won the Match !",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
      content: Text(
        "'X' Get : $xScore  \n'O' Get : $oScore ",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
