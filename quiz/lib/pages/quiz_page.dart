import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';
import '../ui/answer_button.dart';
import '../ui/question_text.dart';
import '../ui/correct_wrong_overlay.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = Quiz([
    Question('True or false', true),
    Question('Flutter is easy', false),
    Question('Im always right', true)
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldInvisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    setState(() {
      overlayShouldInvisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          children: <Widget>[
            AnswerButton(true, () {
              handleAnswer(true);
            }),
            QuestionText(questionText, questionNumber),
            AnswerButton(false, () {
              handleAnswer(false);
            })
          ],
        ),
        overlayShouldInvisible
            ? CorrectWrongOverlay(isCorrect, () {
                if (quiz.length == questionNumber) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ScorePage(quiz.score, quiz.length),
                      ),
                      (Route route) => route == null);
                  return;
                }
                currentQuestion = quiz.nextQuestion;
                setState(() {
                  overlayShouldInvisible = false;
                  questionText = currentQuestion.question;
                  questionNumber = quiz.questionNumber;
                });
              })
            : Container()
      ],
    );
  }
}
