import 'package:calculator_design/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _Calculator();
}

class _Calculator extends State<Calculator> {
  double num1 = 0.0;
  double num2 = 0.0;
  var input = "";
  var output = "";
  var operation = "";
  var hideinput = false;
  var outputsize = 34.0;

  onButtonClick(value) {
    if (value == "AC") {
      input = "";
      output = "";
    } else if (value == "<") {
      input = input.substring(0, input.length - 1);
    } else if (value == "=") {
      var userinput = input;
      userinput = input.replaceAll("x", "*");
      Parser p = Parser();
      Expression ex = p.parse(userinput);
      ContextModel cm = ContextModel();
      var finalvalue = ex.evaluate(EvaluationType.REAL, cm);
      output = finalvalue.toString();
      if (output.endsWith(".0")) {
        output = output.substring(0, output.length - 2);
      }
      input = output;
      hideinput = true;
      outputsize = 44;
    } else {
      input = input + value;
      hideinput = false;
      outputsize = 20;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Calculator",
            style: TextStyle(
                color: secondarycolor,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor: primarycolor,
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  hideinput ? '' : input,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  output,
                  style: TextStyle(
                      fontSize: outputsize,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.9)),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          )),
          Row(
            children: [
              button(
                  text: "AC",
                  tcolor: secondarycolor,
                  buttonBgcolor: Colors.black.withOpacity(0.9)),
              button(
                  text: "<",
                  tcolor: secondarycolor,
                  buttonBgcolor: Colors.black.withOpacity(0.9)),
              button(
                  text: "+/-",
                  tcolor: secondarycolor,
                  buttonBgcolor: Colors.black.withOpacity(0.9)),
              button(text: "/", tcolor: hwcolor, buttonBgcolor: secondarycolor),
            ],
          ),
          SizedBox(height: 2),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(text: "x", tcolor: hwcolor, buttonBgcolor: secondarycolor),
            ],
          ),
          SizedBox(height: 2),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "-", tcolor: hwcolor, buttonBgcolor: secondarycolor),
            ],
          ),
          SizedBox(height: 2),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "+", tcolor: hwcolor, buttonBgcolor: secondarycolor),
            ],
          ),
          SizedBox(height: 2),
          Row(
            children: [
              button(text: "%"),
              button(text: "0"),
              button(text: "."),
              button(
                  text: "=",
                  tcolor: secondarycolor,
                  buttonBgcolor: Colors.black.withOpacity(0.9)),
            ],
          ),
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }

//Function to call click on button

  Widget button({
    text,
    tcolor = Colors.black,
    buttonBgcolor = const Color.fromARGB(255, 238, 232, 232),
  }) {
    return Expanded(
      child: Container(
        height: 50,
        margin: EdgeInsets.all(6),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              shadowColor: Color.fromARGB(255, 32, 31, 31),
              elevation: 10,
              backgroundColor: buttonBgcolor,
              padding: EdgeInsets.all(4),
            ),
            onPressed: () => onButtonClick(text),
            child: Text(
              text,
              style: TextStyle(color: tcolor, fontSize: 20),
            )),
      ),
    );
  }
}
