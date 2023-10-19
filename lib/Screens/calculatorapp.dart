import 'package:calculatorapp/model/buttonmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

var input = '';
var result = '';

class _CalculatorAppState extends State<CalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8e8e8),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      input,
                      style: TextStyle(fontSize: 40),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      result,
                      style: TextStyle(fontSize: 30, color: Colors.black26),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.45,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return ButtonModel(
                          buttonColor: Colors.white,
                          buttonText: buttons[index],
                          buttonTextColor: Colors.orange,
                          onTap: () {
                            setState(() {
                              input = '';
                              result = '';
                            });
                          },
                        );
                      } else if (index == 1) {
                        return ButtonModel(
                            buttonColor: Colors.white,
                            buttonText: buttons[index],
                            buttonTextColor: Colors.orange,
                            onTap: () {
                              setState(() {
                                input = input.substring(0, input.length - 1);
                              });
                            });
                      } else if (index == 19) {
                        return ButtonModel(
                          buttonColor: Colors.orange,
                          buttonText: buttons[index],
                          buttonTextColor: Colors.white,
                          onTap: () {
                            setState(() {
                              mainCaulation();
                            });
                          },
                        );
                      } else {
                        return ButtonModel(
                          buttonColor: Color(0xffffffff),
                          buttonText: buttons[index],
                          buttonTextColor: isOperator(buttons[index])
                              ? Colors.orange
                              : Colors.black,
                          onTap: () {
                            setState(() {
                              input += buttons[index];
                            });

                            print(buttons[index]);
                          },
                        );
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

bool isOperator(String operator) {
  if (operator == "+" ||
      operator == "/" ||
      operator == "-" ||
      operator == "X" ||
      operator == "%") {
    return true;
  } else {
    return false;
  }
}

List buttons = [
  "C",
  "DEL",
  "%",
  "/",
  "7",
  "8",
  "9",
  "X",
  "4",
  "5",
  "6",
  "-",
  "1",
  "2",
  "3",
  "+",
  "0",
  ".",
  "+/-",
  "="
];

void mainCaulation() {
  input = input.replaceAll("X", "*");
  Parser p = Parser();
  Expression expression = p.parse(input);
  ContextModel contextModel = ContextModel();
  double evaluate = expression.evaluate(EvaluationType.REAL, contextModel);
  result = evaluate.toString();
}
