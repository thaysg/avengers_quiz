import 'package:avengers_quiz/class/quiz_brain.dart';
import 'package:avengers_quiz/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

class IronManScreen extends StatefulWidget {
  @override
  _IronManScreenState createState() => _IronManScreenState();
}

class _IronManScreenState extends State<IronManScreen> {
  int rightAnswer = 0;
  int wrongAnswer = 0;

  String message;

  void checkAnswer(bool userPickerAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswerI();

    setState(() {
      if (quizBrain.isFinishedI() == true) {
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
        quizBrain.nextQuestionI();
      }
    });
  }

  score() {
    if (rightAnswer >= 7) {
      return 'Amazing, two genius working together';
    } else if (rightAnswer >= 5 && rightAnswer <= 6) {
      return 'Don\'t give up, you are almost there';
    } else {
      return 'Sorry, Tony Stark only works with the best';
    }
  }

  _onAlertButtonsPressed(context) {
    Alert(
      context: context,
      image: Image.asset('images/ironman.png'),
      title: "YOUR SCORE",
      desc: score(),
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
      backgroundColor: Colors.grey.shade900,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xffAB002F),
              Color(0xffE0A43A),
              Color(0xffAB002F),
              Color(0xffEB1515),
              Color(0xffE0A43A),
              Color(0xffDE003B),
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
                            color: Colors.black,
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
                                color: Colors.green.shade900,
                                size: 32,
                              ),
                              Text(
                                '$rightAnswer',
                                style: TextStyle(
                                  color: Colors.black,
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
                                color: Colors.red.shade900,
                                size: 32,
                              ),
                              Text(
                                '$wrongAnswer',
                                style: TextStyle(
                                  color: Colors.black,
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
                      quizBrain.getQuestionsI(),
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
                          color: Colors.green.shade900,
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
                          color: Colors.red.shade900,
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
