import 'package:avengers_quiz/class/question.dart';

class QuizBrain {
  int _questionNumber = 0;
  int rightAnswer = 0;
  int wrongAnswer = 0;

  List<Question> _questionBankAvenger = [
    Question('The first infinity stone to appear was the Space Stone', true),
    Question('Tony Stark is the richest Marvel character', false),
    Question('The most expensive marvel movie is The Age of Ultron', true),
    Question('Black Widow\'s real name is Natalia Alianovna Romanova', true),
    Question('MJ is played by Zendaya in the recent Spider-Man movies', true),
    Question('Captain America was frozen for 55 years', false),
    Question(
        'Wakanda acquiresd vibranium from one of the infinity stones', false),
    Question('Nick Fury lost his eye, because it was scratched by a cat', true),
    Question(
        'Groot has never said anything else apart from the phrase:“I am Groot”',
        false)
  ];

  List<Question> _questionBankIronMan = [
    Question('First time Iron Man appears in comics was 1963', true),
    Question('Tony Stark is the richest Marvel character', false),
    Question('Pepper is allergic to strawberries', true),
    Question('Tony Stark was kidnapped by Hydra', false),
    Question('Tony Stark address is 10880 Malinu Point', true),
    Question('JARVIS stands for: Just A Rather Very Intelligent Sytem ', true),
    Question('Tony Stark full name os Anthony Edward Stark', true),
    Question('The Sokovia Accords Drove Steve And Tony Apart', true),
  ];

  List<Question> _questionBankCaptainAmerica = [
    Question('Steve Rogers was born in July 4, 1918', true),
    Question('Captain America fought WW1', false),
    Question('Captain America is played by Chris Pratt', false),
    Question(
        'Said ‘Before we get started, does anyone want to get out?’', true),
    Question('Fought Thanos on Titan', false),
    Question('Best friend is named Rhodey', false),
    Question('Full name is Steven Grant Rogers', true),
    Question('Said ‘The truth is a matter of circumstance’', true),
  ];

  void nextQuestionA() {
    if (_questionNumber < _questionBankAvenger.length - 1) {
      _questionNumber++;
    }
  }

  void nextQuestionI() {
    if (_questionNumber < _questionBankIronMan.length - 1) {
      _questionNumber++;
    }
  }

  void nextQuestionC() {
    if (_questionNumber < _questionBankCaptainAmerica.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionsA() {
    return _questionBankAvenger[_questionNumber].questionText;
  }

  bool getCorrectAnswerA() {
    return _questionBankAvenger[_questionNumber].questionAswer;
  }

  String getQuestionsI() {
    return _questionBankIronMan[_questionNumber].questionText;
  }

  bool getCorrectAnswerI() {
    return _questionBankIronMan[_questionNumber].questionAswer;
  }

  String getQuestionsC() {
    return _questionBankCaptainAmerica[_questionNumber].questionText;
  }

  bool getCorrectAnswerC() {
    return _questionBankCaptainAmerica[_questionNumber].questionAswer;
  }

  bool isFinishedA() {
    if (_questionNumber >= _questionBankAvenger.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  bool isFinishedI() {
    if (_questionNumber >= _questionBankIronMan.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  bool isFinishedC() {
    if (_questionNumber >= _questionBankCaptainAmerica.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
/* 
  void scorePercentageI() {
    double getCorrectAnswerI =
        double.parse(_questionBankIronMan.toString()) / 100;
        
  } */

}
