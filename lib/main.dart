import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      tipPercentage = 5,
      numberOfPeople = 1,
      tipAmount = 0,
      totalAmount = 0,
      totalPerPerson=0,
      tipPerPerson=0;

  // var numberOfPeopleString = double.parse(numberOfPeople);
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
        tipPerPerson = tipAmount / numberOfPeople;
        totalAmount = billAmount + tipAmount;
        totalPerPerson = totalAmount / numberOfPeople;
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
                                  tipDecrement();
                                },
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.white,
                                )),
                            Spacer(),
                            Text(
                              "${tipPercentage.toInt()}",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
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
                                  peopleDecrement();
                                },
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.white,
                                )),
                            Spacer(),
                            Text(
                              "${numberOfPeople.toInt()}",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
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
                            
                            if (billAmount > 0) {
                              _finalDisplay(context);
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
// card 
  void _finalDisplay(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              //TODO
              // image: DecorationImage(image: AssetImage("assets/cardbg.png"),
              // fit: BoxFit.cover,
              // ),
              color: Colors.grey[100],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "YOUR BILL",
                      style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.w800 ,fontSize: 13 , letterSpacing: .5,),),
                    ),
                    Spacer(),
                    Text(
                      "NUMBER OF PEOPLE",
                      style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w800 ,fontSize: 13, letterSpacing: .5,),),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "${billAmount.toStringAsFixed(2)}",
                      style: GoogleFonts.roboto(textStyle: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 50,
                          fontWeight: FontWeight.w600),),
                    ),
                    Spacer(),
                    Text(
                      "${numberOfPeople.toInt()}",
                      style: GoogleFonts.roboto(textStyle: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 50,
                          fontWeight: FontWeight.w400),),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
               Row(
                  children: [
                    Text(
                      "TIP %",
                      style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w800 ,fontSize: 13, letterSpacing: .5,),),
                    ),
                    Spacer(),
                    Text(
                      "TOTAL PER PERSON",
                      style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w800 ,fontSize: 13, letterSpacing: .5,),),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text(
                      "${tipPercentage.toInt()}",
                      style: GoogleFonts.roboto(textStyle: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 50,
                          fontWeight: FontWeight.w600),),
                    ),
                    Spacer(),
                    Text(
                      "\$${totalPerPerson.toStringAsFixed(2)}",
                      style: GoogleFonts.roboto(textStyle: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 20,
                          fontWeight: FontWeight.w700),),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Spacer(),
                    Text("TOTAL",
                    style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w800 ,fontSize: 13 , letterSpacing: .5,),),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Spacer(),
                    Text("\$${totalAmount.toStringAsFixed(2)}",
                    style: GoogleFonts.roboto(textStyle: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 60,
                          fontWeight: FontWeight.w600),),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
               Row(
                  children: [
                    Text(
                      "TIP PER PERSON",
                      style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w800 ,fontSize: 13, letterSpacing: .5,),),
                    ),
                    Spacer(),
                    Text(
                      "TOTAL TIP",
                      style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w800 ,fontSize: 13, letterSpacing: .5,),),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
               Row(
                  children: [
                    Text(
                      "\$${tipPerPerson.toStringAsFixed(2)}",
                      style: GoogleFonts.roboto(textStyle: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 25,
                          fontWeight: FontWeight.w400),),
                    ),
                    Spacer(),
                    Text(
                      "\$${tipAmount.toStringAsFixed(2)}",
                      style: GoogleFonts.roboto(textStyle: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 25,
                          fontWeight: FontWeight.w400),),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
