// import 'package:flutter/material.dart';

// class BmiCalculator extends StatefulWidget {
//   @override
//   State<BmiCalculator> createState() => _BmiCalculatorState();
// }

// class _BmiCalculatorState extends State<BmiCalculator> {

// var weightController=TextEditingController();
// var fitController=TextEditingController();
// var inchController=TextEditingController();

// // double lengthInFeet = 5.0; // Replace this with your length in feet
// // double lengthInCentimeters = lengthInFeet * 30.48;

// // double lengthInInches = 10.0; // Replace this with your length in inches
// // double lengthInCentimeters = lengthInInches * 2.54;

// double bmi=0;
// double height=0;

//   void bmicalculation(int weight,double fit,double inch){

//     height=fit*30.48 + inch*2.54;
//     bmi=weight/height*height;

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.sports_gymnastics_outlined),
//         title: Text(
//           "Bmi Calculator",
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.cyan,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Text(
//             'Enter your weight (kg):',
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.orange),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             child: TextField(
//               controller: weightController,
//                 decoration: InputDecoration(
//                     labelText: 'Weight',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)))),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Text(
//             'Enter your height (fit):',
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.orange),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             child: TextField(
//               controller: fitController,
//                 decoration: InputDecoration(
//                     labelText: 'height in fit',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)))),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Text(
//             'Enter your height (inch):',
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.orange),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             child: TextField(
//               controller: inchController,
//                 decoration: InputDecoration(
//                     labelText: 'height in inch',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)))),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 int w=int.parse(weightController.text.toString());
//                 double f=double.parse(fitController.text.toString());
//                 double i=double.parse(inchController.text.toString());
//                 bmicalculation(w, f, i);

//                 setState(() {
//                   bmi=bmi;
//                 });
//               },
//               child: Text('Calculate'),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Center(child: Text('Your BMI is: $bmi ')),
//           SizedBox(
//             height: 20,
//           ),
//           Center(child: Text('You are ')),
//         ]),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  var weightController = TextEditingController();
  var fitController = TextEditingController();
  var inchController = TextEditingController();
  double bmi = 0;
  
  String bmiType='';

  var img;


  void getBMI(){
    int w=int.parse(weightController.text.toString());
    int f=int.parse(fitController.text.toString());
    int inch=int.parse(inchController.text.toString());

    var heightinch=f*12 + inch;
    var heightincentimeter=heightinch*2.54;
    double calculatedBMI =
          w / ((heightincentimeter / 100) * (heightincentimeter / 100));

          setState(() {
        bmi = calculatedBMI;
      });


      //check for bmi type

      if(bmi>25){
        bmiType='OverWeight';
        img=Image.asset('assets/images/overweightboy.png');

      }
      else if(bmi<18){
        bmiType='underWeight';
        img=Image.asset('assets/images/slimboy.png');
      }
      else{
        bmiType='Healthy';
        img=Image.asset('assets/images/healthyboy.png');
      }

    
    
  }

  // void calculateBMI(String weight, String fit, String inch) {
  //   if (weight.isNotEmpty && fit.isNotEmpty && inch.isNotEmpty) {
  //     int w = int.parse(weight);
  //     double f = double.parse(fit);
  //     double i = double.parse(inch);
  //     double heightInCentimeters = f * 30.48 + i * 2.54;
  //     double calculatedBMI =
  //         w / ((heightInCentimeters / 100) * (heightInCentimeters / 100));

  //     setState(() {
  //       bmi = calculatedBMI;
  //     });
  //   } else {
  //     setState(() {
  //       bmi = 0; // Set BMI to 0 if any input field is empty
  //     });
  //   }
  // }

  // String getBMICategory(double bmi) {
  //   if (bmi < 18.5) {
  //      //img=Image.asset('assets/images/slimboy.png');
  //     return 'Underweight';
  //   } else if (bmi >= 18.5 && bmi < 24.9) {
  //     img=Image.asset('assets/images/healthyboy.png');
  //     return 'Normal Weight';
  //   } else if (bmi >= 24.9 && bmi < 29.9) {
  //     //img=Image.asset('assets/overweightboy.png');
  //     return 'Overweight';
  //   } else {
  //     Container();
  //     return 'Obese';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.sports_gymnastics_outlined),
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your weight (kg):',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.orange),
              ),
              SizedBox(height: 10),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Weight',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Enter your height (ft and in):',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.orange),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: fitController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Feet',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: inchController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Inches',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                   getBMI();
                  },
                  child: Text('Calculate'),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  height: 100,
                  width: 200,
                  child: img,
                ),
              ),
              SizedBox(height: 20,),
              Center(
                  child: Text(
                'Your BMI is: ${bmi.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(height: 10),
              Center(
                  child: Text(
                'You are $bmiType',
                style: TextStyle(
                  color: Colors.lime,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
