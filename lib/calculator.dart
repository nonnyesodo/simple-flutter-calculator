import 'package:calculator/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var question = '';
  var answer = '';
  final List buttonlabel = [
    'c',
    'del',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(children: [
        //result display
        Expanded(
          child: Container(
            color: Colors.deepPurple[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      question,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(answer),
                  ),
                )
              ],
            ),
          ),
        ),
        //calculator button
        Expanded(
          flex: 2,
          child: GridView.builder(
              itemCount: buttonlabel.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (BuildContext context, int index) {
                //clear button
                if (index == 0) {
                  return Mybutton(
                    ontap: () {
                      setState(() {
                        question = "";
                        answer = '';
                      });
                    },
                    buttontext: buttonlabel[index],
                    color: Colors.blue,
                    textcolor: Colors.deepPurple,
                  );
                } else {
                  //delete button
                  if (index == 1) {
                    return Mybutton(
                      ontap: () {
                        setState(() {
                          question = question.substring(0, question.length - 1);
                        });
                      },
                      buttontext: buttonlabel[index],
                      color: Colors.red,
                      textcolor: Colors.deepPurple,
                    );
                  } else {
                    //answer or equal to button
                    if (index == 20 - 1) {
                      return Mybutton(
                        ontap: () {
                          setState(() {
                            calculateanswer();
                          });
                        },
                        buttontext: buttonlabel[index],
                        color: Colors.deepPurple,
                        textcolor: Colors.white,
                      );
                    } else {
                      //answer button
                      if (index == 19 - 1) {
                        return Mybutton(
                          ontap: () {
                            setState(() {
                              calculateanswer();
                            });
                          },
                          buttontext: buttonlabel[index],
                          color: Colors.deepPurple,
                          textcolor: Colors.white,
                        );
                      } else {
                        return Mybutton(
                          ontap: () {
                            setState(() {
                              question += buttonlabel[index];
                            });
                          },
                          buttontext: buttonlabel[index],
                          color: isoperatorcolor(buttonlabel[index])
                              ? Colors.deepPurple
                              : Colors.deepPurple[50],
                          textcolor: isoperatorcolor(buttonlabel[index])
                              ? Colors.white
                              : Colors.deepPurple,
                        );
                      }
                    }
                  }
                }
              }),
        ),
      ]),
    );
  }

  bool isoperatorcolor(String x) {
    if (x == '=' || x == '+' || x == '/' || x == 'x' || x == '-' || x == '%') {
      return true;
    }
    return false;
  }

  void calculateanswer() {
    String finalquestion = question;
    finalquestion = finalquestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalquestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
