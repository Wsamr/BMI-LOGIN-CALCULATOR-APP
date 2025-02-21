import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});
  int age = 0;
  int weight = 50;
  double height = 70;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    void incrementAge() {
      widget.age++;
      setState(() {});
    }

    void decrementAge() {
      widget.age--;
      setState(() {});
    }

    void incrementWeight() {
      widget.weight++;
      setState(() {});
    }

    void decrementWeight() {
      widget.weight--;
      setState(() {});
    }

    double CalBMI() {
      double h = widget.height / 100;
      double w = widget.weight.toDouble();
      return widget.weight / (h * h);
    }

    return Scaffold(
      backgroundColor: const Color(0xff0A0E21),
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xff0A0E21),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 35, horizontal: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CardGenera(icon: Icons.male_rounded, title: 'Male'),
                        const SizedBox(
                          width: 20,
                        ),
                        CardGenera(icon: Icons.female_rounded, title: 'Female'),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Heightper(
                      onHeightChange: (newValue) {
                        widget.height = newValue;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Widgthagecard(
                          name: 'Weight',
                          weight: widget.weight,
                          increment: () => incrementWeight(),
                          decrement: () => decrementWeight(),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Widgthagecard(
                          name: 'Age',
                          weight: widget.age,
                          increment: () => incrementAge(),
                          decrement: () => decrementAge(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Calbutton(
            res: CalBMI(),
          ),
        ],
      ),
    );
  }
}

class Resultpage extends StatelessWidget {
  Resultpage({super.key, required this.res});
  final double res;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0E21),
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xff0A0E21),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Your Result',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ResultContainer(res: res), // Pass the final value.
              ],
            ),
          ),
          Spacer(),
          ReCalButton(),
        ],
      ),
    );
  }
}

Widget BText({required String text}) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontSize: 50,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget IcButton({required IconData icon, required Function() e}) {
  return Card(
    color: Colors.grey.withOpacity(.4),
    shape: CircleBorder(),
    child: IconButton(
      onPressed: e,
      icon: Icon(
        icon,
        size: 30,
      ),
      color: Colors.white,
      hoverColor: Colors.red,
    ),
  );
}

Widget NormalText({required String text}) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w300,
    ),
  );
}

class Calbutton extends StatelessWidget {
  Calbutton({super.key, required this.res});
  final double res;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Resultpage(
              res: double.parse(res.toStringAsFixed(1)),
            ),
          ),
        );
      },
      child: Container(
        child: Center(
          child: Text(
            'Calculate',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        color: Color(0xffEB1555),
        width: double.infinity,
        height: 60,
      ),
    );
  }
}

Widget CardGenera({required IconData icon, required String title}) {
  return Container(
    width: 180,
    height: 180,
    child: Column(
      children: [
        Icon(
          icon,
          size: 130,
          color: Colors.white,
        ),
        NormalText(text: title),
      ],
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color(0xff1D1E33),
    ),
  );
}

class Heightper extends StatefulWidget {
  Heightper({super.key, required this.onHeightChange});
  final Function(double) onHeightChange;

  @override
  State<Heightper> createState() => _HeightperState();
}

class _HeightperState extends State<Heightper> {
  double value = 70;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 180,
      decoration: BoxDecoration(
        color: Color(0xff1D1E33),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            NormalText(text: 'Height'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BText(
                  text: value.toInt().toString(),
                ),
                NormalText(text: 'cm'),
              ],
            ),
            Slider(
              min: 50.0,
              max: 250.0,
              value: value,
              onChanged: (newValue) {
                setState(() {
                  value = newValue;
                });
                widget.onHeightChange(value);
                print(value);
              },
              activeColor: Color(0xffEB1555),
            ),
          ],
        ),
      ),
    );
  }
}

class ReCalButton extends StatelessWidget {
  ReCalButton({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(),
            ));
      },
      child: Container(
        child: Center(
          child: Text(
            'Re-Calculator',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        color: Color(0xffEB1555),
        width: double.infinity,
        height: 60,
      ),
    );
  }
}

Widget ResultContainer({required double res}) {
  return Container(
    width: 380,
    height: 400,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color(0xff1D1E33),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Normal',
          style: TextStyle(
            fontSize: 30,
            color: Color(0xff24CF72),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          res.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 80,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'You Have A Normal Body.',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

class Widgthagecard extends StatefulWidget {
  Widgthagecard(
      {super.key,
      required this.name,
      required this.weight,
      required this.increment,
      required this.decrement});
  int weight;
  final String name;
  final Function() increment;
  final Function() decrement;
  @override
  State<Widgthagecard> createState() => _WidgthagecardState();
}

class _WidgthagecardState extends State<Widgthagecard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff1D1E33),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            NormalText(text: widget.name),
            BText(text: widget.weight.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IcButton(
                  icon: Icons.add,
                  e: widget.increment,
                ),
                SizedBox(
                  width: 20,
                ),
                IcButton(icon: Icons.remove, e: widget.decrement),
              ],
            )
          ],
        ),
      ),
    );
  }
}
