import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  Widget maleOrfemale({required String gender, required String path}) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff101322),
        ),
        height: 180,
        width: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(path),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              gender,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ));
  }

  double height = 140;
  int weight = 60;
  int age = 25;
  void increaseWeight() {
    setState(() {
      weight++;
    });
  }

  void decreaseWeight() {
    setState(() {
      weight--;
    });
  }

  void decreaseAge() {
    setState(() {
      age--;
    });
  }

  void increaseAge() {
    setState(() {
      age++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double currentSliderValue = 150;
    return Scaffold(
        backgroundColor: const Color(0xff090f1d),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("BMI CALCULATOR"),
          backgroundColor: const Color(0xff090f1d), //Hex
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  maleOrfemale(gender: "MALE", path: "assets/images/male.png"),
                  maleOrfemale(
                      gender: "FEMALE", path: "assets/images/female.png"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff1a1b2d)),
                  width: 350,
                  height: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "HEIGHT",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "${height.round()}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Slider(
                        activeColor: Colors.purple,
                          value: height,
                          min: 80,
                          max: 220,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          })
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xff1a1b2d),
                      ),
                      height: 180,
                      width: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "$weight",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                child: Icon(Icons.add),
                                onPressed: increaseWeight,
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    minimumSize: Size(40, 40),
                                    backgroundColor: Color(0xff454551)),
                              ),
                              ElevatedButton(
                                child: Icon(Icons.remove),
                                onPressed: decreaseWeight,
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(40, 40),
                                    shape: CircleBorder(),
                                    backgroundColor: Color(0xff454551)),
                              )
                            ],
                          )
                        ],
                      )),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xff1a1b2d),
                      ),
                      height: 180,
                      width: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "$age",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                child: Icon(Icons.add),
                                onPressed: increaseAge,
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    minimumSize: Size(40, 40),
                                    backgroundColor: Color(0xff454551)),
                              ),
                              ElevatedButton(
                                child: Icon(Icons.remove),
                                onPressed: decreaseAge,
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(40, 40),
                                    shape: CircleBorder(),
                                    backgroundColor: Color(0xff454551)),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text("CALCULATE"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        minimumSize: Size(320, 50))),
              )
            ],
          ),
        ));
  }
}
