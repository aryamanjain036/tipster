import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        hintColor: Colors.white,
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double billAmount = 0,
      numberOfPeople = 1,
      tipPercentage = 5,
      tipAmount = 0,
      totalAmount = 0;
  void tipDecrement() {
    setState(() {
      tipPercentage--;
    });
  }

  void tipIncrement() {
    setState(() {
      tipPercentage++;
    });
  }

  void peopleDecrement() {
    setState(() {
      numberOfPeople--;
    });
  }

  void peopleIncrement() {
    setState(() {
      numberOfPeople++;
    });
  }

  void calculate() {
    if (numberOfPeople == 1) {
      setState(() {
        tipAmount = billAmount * (tipPercentage / 100);
        totalAmount = billAmount + tipAmount;
      });
    } else {
      setState(() {
        tipAmount = billAmount * (tipPercentage / 100);
        tipAmount = tipAmount / numberOfPeople;
        double billPerPerson = billAmount / numberOfPeople;
        totalAmount = billPerPerson + tipAmount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Tipster",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Quickly calculate the tip amount for your bill",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          textAlign: TextAlign.center,
                          onChanged: (val) {
                            billAmount = double.parse(val);
                          },
                          decoration: InputDecoration(hintText: "Bill Amount"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Tip Percentage",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  //TODO
                                  tipDecrement();
                                },
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.white,
                                )),
                            Spacer(),
                            Text(
                              "$tipPercentage",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                //TODO
                                tipIncrement();
                              },
                              child: Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Number Of Person",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  //TODO
                                  peopleDecrement();
                                },
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.white,
                                )),
                            Spacer(),
                            Text(
                              "$numberOfPeople",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                //TODO
                                peopleIncrement();
                              },
                              child: Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            //TODO
                            _finalDisplay(context);
                            if (billAmount > 0) {
                              calculate();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 18),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Text("Calculate"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _finalDisplay(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(20),  
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Total Bill",
                      style: TextStyle(color: Colors.black),
                    ),
                    Spacer(),
                    Text(
                      "Number Of People",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        });
  }
}
