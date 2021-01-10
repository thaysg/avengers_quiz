import 'package:avengers_quiz/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:avengers_quiz/class/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

class CaptainAmericaScreen extends StatefulWidget {
  @override
  _CaptainAmericaScreenState createState() => _CaptainAmericaScreenState();
}

class _CaptainAmericaScreenState extends State<CaptainAmericaScreen> {
  int rightAnswer = 0;
  int wrongAnswer = 0;

  void checkAnswer(bool userPickerAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswerC();

    setState(() {
      if (quizBrain.isFinishedC() == true) {
        _onAlertButtonsPressed(context);

        quizBrain.reset();

        rightAnswer = 0;
        wrongAnswer = 0;
      } else {
        if (userPickerAnswer == correctAnswer) {
          rightAnswer += 1;
        } else {
          wrongAnswer += 1;
        }
        quizBrain.nextQuestionC();
      }
    });
  }

  _onAlertButtonsPressed(context) {
    Alert(
      context: context,
      image: Image.asset('images/captainamerica.png'),
      title: "YOUR SCORE",
      buttons: [
        DialogButton(
          child: Text(
            "$rightAnswer",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "$wrongAnswer",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(255, 0, 0, 1.0),
            Color.fromRGBO(255, 0, 0, 1.0)
          ]),
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.indigo[900],
              Color(0xff1C1CFF),
              Color(0xffAB002F),
              Colors.grey[500],
              Colors.indigo[900],
              Color(0xff1C1CFF),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                //Score
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Score',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 32,
                              ),
                              Text(
                                '$rightAnswer',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 32,
                              ),
                              Text(
                                '$wrongAnswer',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                //Text
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      quizBrain.getQuestionsC(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ),
                //True or False
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FlatButton(
                          onPressed: () {
                            checkAnswer(true);
                          },
                          color: Colors.green,
                          height: 100,
                          textColor: Colors.white,
                          child: Text(
                            'True',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FlatButton(
                          onPressed: () {
                            checkAnswer(false);
                          },
                          color: Colors.red,
                          height: 100,
                          textColor: Colors.white,
                          child: Text(
                            'False',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
