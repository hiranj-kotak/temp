import 'package:flutter/material.dart';
import 'package:temp_app/question.dart';
import 'package:temp_app/result_page.dart';

class Quiz extends StatefulWidget {
  static const routeName = "/quiz";
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _score = 0;
  int SelectedIndex = -1;
  bool istappable = true;
  int questionnumber = 0;
  @override
  Widget build(BuildContext context) {
    print(_score);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double toppadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        children: [
          SizedBox(
            height: toppadding + 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              Text(
                "Question ${questionnumber + 1}/${ques.length}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14))),
              child: Column(
                children: [
                  SizedBox(
                    height: toppadding + 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    width: width * 0.90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        ques[questionnumber].question, // [1]
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => options(
                          width: width,
                          option: ques[questionnumber].options[index],
                          currentindex: index,
                          selectedIndex: SelectedIndex),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: 4,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (SelectedIndex == -1) {
                        return;
                      }
                      if (questionnumber < ques.length - 1) {
                        setState(() {
                          questionnumber++;
                          SelectedIndex = -1;
                          istappable = true;
                        });
                      } else {
                        print("Quiz Completed");
                        Navigator.of(context).pushNamed(ResultPage.routeName,
                            arguments: _score.toString());
                      }
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
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  options(
      {required double width,
      required String option,
      required int currentindex,
      required selectedIndex}) {
    return InkWell(
      onTap: () {
        setState(() {
          if (istappable) {
            SelectedIndex = currentindex;
            if (currentindex == ques[questionnumber].answer) {
              _score++;
              setState(() {});
            }
            istappable = false;
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: width * 0.9,
        decoration: BoxDecoration(
          color: selectedIndex == currentindex
              ? currentindex == ques[questionnumber].answer
                  ? Colors.green
                  : Colors.red
              : Colors.white,
          border: Border.all(
            color: selectedIndex == currentindex
                ? currentindex == ques[questionnumber].answer
                    ? Colors.green
                    : Colors.red
                : Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: selectedIndex == currentindex
                      ? currentindex == ques[questionnumber].answer
                          ? Colors.green
                          : Colors.red
                      : Colors.black,
                  width: selectedIndex == currentindex ? 5 : 1,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              option,
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
