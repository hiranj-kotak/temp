import 'package:flutter/material.dart';
import 'package:temp_app/home.dart';

class ResultPage extends StatelessWidget {
  static const routeName = "/result";
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final score = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(children: [
        const SizedBox(
          height: 100,
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      "Congratulations",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "You got $score/5  correct",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.of(context).pushReplacementNamed(Home.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    maximumSize: Size(width * 0.7, 70),
                    minimumSize: Size(width * 0.7, 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text(
                    "Go to Home",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
