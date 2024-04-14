import 'package:bmi/constant.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 120;
  int weight = 50;

  String gender = '';

  late double bmi = calculateBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = 'M';
                        });  
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: gender =='M' ? Colors.yellow : Colors.orange,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.male,
                              size: 150,
                            ),
                            Text("Male"),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = 'F';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: gender =='F' ? Colors.yellow : Colors.orange,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.female,
                              size: 150,
                            ),
                            Text("Female"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Height"),
                          Text("$height", style: kInputLableColor),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (height > 50) {
                                      height--;
                                      bmi = calculateBMI(
                                          height: height, weight: weight);
                                    }
                                  });
                                },
                                child: Icon(Icons.remove, size: 40),
                              ),
                              const SizedBox(width: 20),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (height < 200) {
                                      height++;
                                      bmi = calculateBMI(
                                          height: height, weight: weight);
                                    }
                                  });
                                },
                                child: Icon(Icons.add, size: 40),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Weight"),
                          Text("$weight", style: kInputLableColor),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 20) {
                                      weight--;
                                      bmi = calculateBMI(
                                          height: height, weight: weight);
                                    }
                                  });
                                },
                                child: Icon(Icons.remove, size: 40),
                              ),
                              const SizedBox(width: 20),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight < 300) {
                                      weight++;
                                      bmi = calculateBMI(
                                          height: height, weight: weight);
                                    }
                                  });
                                },
                                child: Icon(Icons.add, size: 40),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("BMI"),
                      Text(
                        bmi.toStringAsFixed(2),
                        style: kOutputlablecolor.copyWith(color: Colors.blue),
                      ),
                      Text(getResult(bmi)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  double calculateBMI({required int height, required int weight}) {
    return weight / (height * height) * 10000;
  }

  String getResult(bmi) {
    if (bmi >= 25) {
      return "Overweight";
    } else if (bmi > 18.5) {
      return "Normal";
    } else {
      return " Underweight";
    }
  }
}
