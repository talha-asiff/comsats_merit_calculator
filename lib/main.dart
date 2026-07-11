import 'package:flutter/material.dart';

double? totalMarksSSC;
double? marksSSC;
double? totalMarksInter;
double? marksInter;
double? nts;
double? aggregate;
void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _pages = [MeritCalc(), GPACalc(), CGPACalc()];
  int _index = 0;
  void _nextPage(int i) {
    setState(() {
      _index = i;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "Merit Calc",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: "GPA Calc",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph_rounded),
              label: "CGPA Calc",
            ),
          ],
          onTap: _nextPage,
        ),
        body: _pages[_index],
      ),
    );
  }
}

class MeritCalc extends StatefulWidget {
  @override
  State<MeritCalc> createState() => _MeritCalcState();
}

class _MeritCalcState extends State<MeritCalc> {
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
        body: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                label: Text("Total SSC Marks"),
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                prefixIcon: Icon(
                  Icons.school_outlined,
                  color: Colors.blueAccent,
                ),
              ),
              onChanged: (x) {
                setState(() {
                  totalMarksSSC = double.tryParse(x)!;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                label: Text("Obtained SSC Marks"),
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                prefixIcon: Icon(Icons.school, color: Colors.blueAccent),
              ),
              onChanged: (x) {
                setState(() {
                  marksSSC = double.tryParse(x)!;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                label: Text("Total HSSC Marks"),
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                prefixIcon: Icon(
                  Icons.school_outlined,
                  color: Colors.blueAccent,
                ),
              ),
              onChanged: (x) {
                setState(() {
                  totalMarksInter = double.tryParse(x)!;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                label: Text("Obtained HSSC Marks"),
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                prefixIcon: Icon(Icons.school, color: Colors.blueAccent),
              ),
              onChanged: (x) {
                setState(() {
                  marksInter = double.tryParse(x)!;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                label: Text("NTS Marks out of 100"),
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                prefixIcon: Icon(Icons.calculate, color: Colors.blueAccent),
              ),
              onChanged: (x) {
                setState(() {
                  nts = double.tryParse(x)!;
                  aggregate =
                      (((marksSSC! / totalMarksSSC!) * 100) * 0.1 +
                      ((marksInter! / totalMarksInter!) * 100) * 0.4 +
                      ((nts! / 100!) * 100) * 0.5);
                });
              },
            ),

            Text("${aggregate ?? 0.0}", style: TextStyle(fontSize: 40)),
            Text("${predict(aggregate ?? 0)}"),
          ],
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

class GPACalc extends StatefulWidget {
  const GPACalc({super.key});

  @override
  State<GPACalc> createState() => _GPACalcState();
}

class _GPACalcState extends State<GPACalc> {
  int courses = 0;
  bool nocourse = true;
  int ch = 0;
  List<int> credits = [];
  List<double> gp = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'img/COMSATS-University-logo.png',
                width: 50,
                height: 50,
              ),
              Text("   COMSATS GPA Calculator"),
            ],
          ),
        ),
        body: nocourse
            ? Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Enter number of courses : "),
                      fillColor: const Color.fromARGB(255, 55, 55, 55),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                    onChanged: (x) {
                      setState(() {
                        courses = int.tryParse(x) ?? 1;
                      });
                    },
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          nocourse = false;
                        });
                      },
                      child: Text("Next"),
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: courses,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 118,
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                  label: Text("course name: "),
                                  fillColor: const Color.fromARGB(255, 55, 55, 55),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 16,
                                  ),
                                ),
                                onChanged: (x) {
                                  setState(() {
                        
                        
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 118,
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                  label: Text("Credit hours: "),
                                  fillColor: const Color.fromARGB(255, 55, 55, 55),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 16,
                                  ),
                                ),
                                onChanged: (x) {
                                  setState(() {
                                    ch = ch + int.parse(x);
                                    credits.add(int.parse(x));
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 118,
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                  label: Text("GPA: "),
                                  fillColor: const Color.fromARGB(255, 55, 55, 55),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 16,
                                  ),
                                ),
                                onChanged: (x) {
                                  setState(() {
                                    gp.add(((credits[index])/ch) + double.parse(x));
                                  });
                                },
                              ),
                            ),
                            
                          ],
                        ),
                        Text(totalGPA(gp).toString(), style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
double totalGPA(List<double> n){
  double total = 0;
  for(var x in n){
    total += x;
  }
  return total;
}

class CGPACalc extends StatefulWidget {
  const CGPACalc({super.key});

  @override
  State<CGPACalc> createState() => _CGPACalcState();
}

class _CGPACalcState extends State<CGPACalc> {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'img/COMSATS-University-logo.png',
                width: 50,
                height: 50,
              ),
              Text("   COMSATS CGPA Calculator"),
            ],
          ),
        ),
      ),
    );
  }
}
