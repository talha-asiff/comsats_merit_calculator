import 'package:flutter/material.dart';


void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MeritCalc(),
      ),
    );
  }
}

class MeritCalc extends StatefulWidget {
  @override
  State<MeritCalc> createState() => _MeritCalcState();
}

class _MeritCalcState extends State<MeritCalc> {
  final inpForm = GlobalKey<FormState>();
  double? totalMarksSSC;
  double? marksSSC;
  double? totalMarksInter;
  double? marksInter;
  double? nts;
  double? aggregate;
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "COMSATS Merit Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'img/COMSATS-University-logo.png',
                width: 50,
                height: 50,
              ),
              Text("   COMSATS Merit Calculator"),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              // TextField(
              //   keyboardType: TextInputType.numberWithOptions(),
              //   decoration: InputDecoration(
              //     label: Text("Total SSC Marks"),
              //     fillColor: Colors.grey[850],
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //       borderSide: BorderSide.none,
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //       borderSide: BorderSide(color: Colors.blueAccent, width: 2),
              //     ),
              //     contentPadding: EdgeInsets.symmetric(
              //       horizontal: 20,
              //       vertical: 16,
              //     ),
              //     prefixIcon: Icon(
              //       Icons.school_outlined,
              //       color: Colors.blueAccent,
              //     ),
              //   ),
              //   onChanged: (x) {
              //     setState(() {
              //       totalMarksSSC = double.tryParse(x)!;
              //     });
              //   },
              // ),
              // TextField(
              //   keyboardType: TextInputType.numberWithOptions(),
              //   decoration: InputDecoration(
              //     label: Text("Obtained SSC Marks"),
              //     fillColor: Colors.grey[850],
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //       borderSide: BorderSide.none,
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //       borderSide: BorderSide(color: Colors.blueAccent, width: 2),
              //     ),
              //     contentPadding: EdgeInsets.symmetric(
              //       horizontal: 20,
              //       vertical: 16,
              //     ),
              //     prefixIcon: Icon(Icons.school, color: Colors.blueAccent),
              //   ),
              //   onChanged: (x) {
              //     setState(() {
              //       marksSSC = double.tryParse(x)!;
              //     });
              //   },
              // ),
              // TextField(
              //   keyboardType: TextInputType.numberWithOptions(),
              //   decoration: InputDecoration(
              //     label: Text("Total HSSC Marks"),
              //     fillColor: Colors.grey[850],
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //       borderSide: BorderSide.none,
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //       borderSide: BorderSide(color: Colors.blueAccent, width: 2),
              //     ),
              //     contentPadding: EdgeInsets.symmetric(
              //       horizontal: 20,
              //       vertical: 16,
              //     ),
              //     prefixIcon: Icon(
              //       Icons.school_outlined,
              //       color: Colors.blueAccent,
              //     ),
              //   ),
              //   onChanged: (x) {
              //     setState(() {
              //       totalMarksInter = double.tryParse(x)!;
              //     });
              //   },
              // ),
              // TextField(
              //   keyboardType: TextInputType.numberWithOptions(),
              //   decoration: InputDecoration(
              //     label: Text("Obtained HSSC Marks"),
              //     fillColor: Colors.grey[850],
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //       borderSide: BorderSide.none,
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //       borderSide: BorderSide(color: Colors.blueAccent, width: 2),
              //     ),
              //     contentPadding: EdgeInsets.symmetric(
              //       horizontal: 20,
              //       vertical: 16,
              //     ),
              //     prefixIcon: Icon(Icons.school, color: Colors.blueAccent),
              //   ),
              //   onChanged: (x) {
              //     setState(() {
              //       marksInter = double.tryParse(x)!;
              //     });
              //   },
              // ),
              // TextField(
              //   keyboardType: TextInputType.numberWithOptions(),
              //   decoration: InputDecoration(
              //     label: Text("NTS Marks out of 100"),
              //     fillColor: Colors.grey[850],
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //       borderSide: BorderSide.none,
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //       borderSide: BorderSide(color: Colors.blueAccent, width: 2),
              //     ),
              //     contentPadding: EdgeInsets.symmetric(
              //       horizontal: 20,
              //       vertical: 16,
              //     ),
              //     prefixIcon: Icon(Icons.calculate, color: Colors.blueAccent),
              //   ),
              //   onChanged: (x) {
              //     setState(() {
              //       nts = double.tryParse(x)!;
              //       aggregate =
              //           (((marksSSC! / totalMarksSSC!) * 100) * 0.1 +
              //           ((marksInter! / totalMarksInter!) * 100) * 0.4 +
              //           ((nts! / 100!) * 100) * 0.5);
              //     });
              //   },
              // ),

              Form(
                key : inpForm,
                child: Container(
                  width: 350 * (MediaQuery.of(context).size.width >= MediaQuery.of(context).size.height ? 2 : 1),
                  height: 500,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbtfmQr-KTl02JJQxiepDT0OevtrzTZI33HcW3M2Hh0A&s=10",),
                      fit: BoxFit.cover
                      ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white
                    )
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                          width: 150 * (MediaQuery.of(context).size.width >= MediaQuery.of(context).size.height ? 2 : 1),
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: Text("Total SSC Marks : ", style: TextStyle(color: Colors.white, fontSize: 10)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: const Color.fromARGB(255, 33, 51, 243),
                                  width: 1
                                )
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1
                                )
                              ),
                            ),
                            validator: (value) {
                              if(value == null || ((double.tryParse(value) ?? 0) < (marksSSC ?? 0) )){
                                return "Obtained marks must be greater than or equal to Total marks";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              totalMarksSSC = double.tryParse(newValue!);
                            },
                          ),
                        ),

                        SizedBox(
                          width: 150 * (MediaQuery.of(context).size.width >= MediaQuery.of(context).size.height ? 2 : 1),
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: Text("SSC Marks : ", style: TextStyle(color: Colors.white, fontSize: 10)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: const Color.fromARGB(255, 33, 51, 243),
                                  width: 1
                                )
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1
                                )
                              ),
                            ),
                            validator: (value) {
                              if(value == null || ((double.tryParse(value) ?? 0) > (totalMarksSSC ?? 0) )){
                                return "Obtained marks must be less than or equal to Total marks";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              marksSSC = double.tryParse(newValue!);
                            },
                          ),
                        ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              
          
              Text("${aggregate ?? 0.0}", style: TextStyle(fontSize: 40)),
              Text("${predict(aggregate ?? 0)}"),
            ],
          ),
        ),
      ),
    );
  }
}

String predict(double x) {
  if (x >= 85) {
    return "CS/SE/AI admission possible in Islamabad, Lahore, Sahiwal, Attock, Vehari, Wah and Abbtabad Campus";
  } else if (x >= 82) {
    return "CS/SE/AI admission possible in Lahore, Sahiwal, Attock, Vehari, Wah and Abbtabad Campus";
  } else if (x >= 75) {
    return "CS/SE/AI admission possible in Sahiwal, Attock, Vehari, Wah and Abbtabad Campus";
  } else if (x >= 60) {
    return "CS/SE/AI admission possible in Attock, Vehari, Wah and Abbtabad Campus";
  } else if (x >= 50) {
    return "CS/SE/AI admission possible in Attock, Vehari and Wah Campus";
  } else {
    return "Sorry admission not possible";
  }
}
