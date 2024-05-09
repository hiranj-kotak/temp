import 'package:flutter/material.dart';
import 'package:temp_app/quizpage.dart';

class Home extends StatefulWidget {
  static const routeName = "/home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> categories = [
    {
      "title": "physics",
      "image": "categories[index]['tite']",
    },
    {
      "title": "chemistry",
      "image": "categories[index]['tite']",
    },
    {
      "title": "maths",
      "image": "categories[index]['tite']",
    },
    {
      "title": "biology",
      "image": "categories[index]['tite']",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Quizz App",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14)),
              ),
              child: Column(children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                    itemBuilder: (context, index) =>
                        catagory(categories[index]['title'], () {
                      Navigator.of(context).pushNamed(Quiz.routeName);
                    }),
                    itemCount: 4,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  catagory(String text, VoidCallback ontap) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              const BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                offset: Offset(1.95, 1.95),
                blurRadius: 2.6,
              ),
            ],
          ),
          child: ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            title: Text(
              text,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
