class Questions {
  String question;
  List<String> options;
  int answer;

  Questions({
    required this.question,
    required this.options,
    required this.answer,
  });
}

List<Questions> ques = [
  Questions(
    question: "What is the capital of France?",
    options: ["Berlin", "Madrid", "Paris", "Rome"],
    answer: 2, // Index of the correct option, in this case, "Paris"
  ),
  Questions(
    question: "What is the chemical symbol for gold?",
    options: ["Gd", "Au", "Ag", "Fe"],
    answer: 1, // Index of the correct option, in this case, "Au"
  ),
  Questions(
    question: "What is the result of 15 multiplied by 7?",
    options: ["92", "105", "112", "122"],
    answer: 1, // Index of the correct option, in this case, "105"
  ),
  Questions(
    question: "Which programming language is used for building Flutter apps?",
    options: ["Java", "Swift", "Dart", "Python"],
    answer: 2, // Index of the correct option, in this case, "Dart"
  ),
  Questions(
    question:
        "In which year did Christopher Columbus first reach the Americas?",
    options: ["1492", "1607", "1776", "1498"],
    answer: 0, // Index of the correct option, in this case, "1492"
  )
];
