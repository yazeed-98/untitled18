import 'package:flutter/material.dart';
import 'package:untitled18/clases/bootm.dart';
import 'package:untitled18/screens/pharmice.dart';
import 'package:untitled18/screens/support.dart';

import '../clases/Color.dart';
import 'Alarm.dart';
import 'midical.dart';


class Screen1 extends StatefulWidget {
  

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int indix=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_circle, size: 40),
            Text("Pill", style: TextStyle(fontSize: 40, color: Colors.red)),
            Text("Point", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40)),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size(0, 40),
          child: Container(
            height: 40,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              children: [
                Icon(Icons.add_circle, size: 40, color: Colors.red),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text('Pharmacy', style: TextStyle(fontSize: 25)),
                ),
                Text('App', style: TextStyle(fontSize: 15, color: Colors.red,
                    fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(left: 37),
                  child: Icon(Icons.add_circle, size: 40, color: Colors.red),
                ),
              ],
            ),

          ),
        ),
      ),
      backgroundColor: ScafeldColor,
      body:

      Column(
        children: [
          Container(
            width: double.infinity,
            height: 230,
            child: Image.asset('assets/images/body.png', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildElevatedButton(
                  icon: Icons.local_pharmacy,
                  label: 'Pharmacy',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PharmacyListScreen()));
                  },
                ),
                _buildElevatedButton(
                  icon: Icons.medication,
                  label: 'Medication',
                  onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => MedicineScreen()));
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildElevatedButton(
                  icon: Icons.alarm,
                  label: 'pillAlarm',

                  onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Alarm()));
                  },
                ),
                _buildElevatedButton(
                  icon: Icons.support_agent,
                  label: 'Support',
                  onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Support()));
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: _buildElevatedButton(
              icon: Icons.logout,
              label: 'Log OUT',
              onPressed: () {
                //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ),






        ],
      ),


    );
  }
}



Widget _buildElevatedButton({required IconData icon,
  required String label,
  required VoidCallback onPressed}) {
  return SizedBox(
    width: 120,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: elivitedldColor,

        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(vertical: 10),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28, color: Colors.red),
          SizedBox(width: 5),
          Text(label, style: TextStyle(
              fontWeight: FontWeight.w900, color: Colors.red, fontSize: 17)),
        ],
      ),
    ),
  );
}
