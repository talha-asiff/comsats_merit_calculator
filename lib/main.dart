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
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "COMSATS Merit Calculator",
      home: Scaffold(
        appBar: AppBar(title: Row(
          children: [
            Image.asset('img/COMSATS-University-logo.png', width: 50, height: 50,),
            Text("   COMSATS Merit Calculator")
          ],
        )),
        body: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                label: Text("Total SSC Marks"),
                fillColor:
                    Colors.grey[850], 
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
                fillColor:
                    Colors.grey[850], 
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
                fillColor:
                    Colors.grey[850], 
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
                fillColor:
                    Colors.grey[850], 
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
                fillColor:
                    Colors.grey[850], 
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
            SizedBox(height: 120,),
            Image.asset("img/image.jpg"),
            Text("Made by Talha Asif")
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
