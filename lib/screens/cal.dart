import 'package:flutter/material.dart';

class Cal extends StatefulWidget {
  Cal({super.key});

  @override
  State<Cal> createState() => _CalState();
}

class _CalState extends State<Cal> {
  double result = 0.0;
  final TextEditingController firstNum = TextEditingController();
  final TextEditingController secondNum = TextEditingController();
  void calculator(String sign) {
    double f = double.tryParse(firstNum.text) ?? 0;
    double s = double.tryParse(secondNum.text) ?? 0;
    setState(() {
      switch (sign) {
        case '+':
          result = f + s;
          break;
        case '-':
          result = f - s;
          break;
        case 'x':
          result = f * s;
          break;
        case '/':
          result = f / s;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red[200],),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: screenHeight*.4,
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: firstNum,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: secondNum,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.red[200],
                  ),
                ),
                Text(
                  'result = $result',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(
                  height: 20,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.red[200],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: screenHeight*.4,
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                           calculator('+');
                        },
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 20),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          calculator('-');
                        },
                        child: Text(
                          '-',
                          style: TextStyle(fontSize: 20),
                        )),
                    ElevatedButton(
                        onPressed: () {
                           calculator('x');
                        },
                        child: Text(
                          'x',
                          style: TextStyle(fontSize: 20),
                        )),
                    ElevatedButton(
                        onPressed: () {
                           calculator('/');
                        },
                        child: Text(
                          '/',
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
