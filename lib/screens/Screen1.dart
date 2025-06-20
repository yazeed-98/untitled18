import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled18/screens/loginScreen.dart';
import 'package:untitled18/screens/pharmice.dart';
import 'package:untitled18/screens/support.dart';
import '../clases/Color.dart'; // تأكد أن الألوان الجديدة موجودة هنا
import 'Alarm.dart';
import 'midical.dart';

class Screen1 extends StatefulWidget {
  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScafeldColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_pharmacy, size: 35, color: Colors.red),
            SizedBox(width: 8),
            Text("Pill", style: TextStyle(fontSize: 28, color: Colors.red)),
            Text("Point", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28)),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size(0, 45),
          child: Container(
            height: 45,
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.local_hospital, size: 28, color: Colors.red),
                Text('Pharmacy App',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black)),
                Icon(Icons.medical_services, size: 28, color: Colors.red),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 220,
            child: Image.asset('assets/images/body.png', fit: BoxFit.cover),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildElevatedButton(
                icon: Icons.local_pharmacy,
                label: 'Pharmacy',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PharmacyListScreen()));
                },
              ),
              _buildElevatedButton(
                icon: Icons.medication,
                label: 'Medication',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineScreen()));
                },
              ),
              _buildElevatedButton(
                icon: Icons.alarm,
                label: 'Pill Alarm',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Alarm()));
                },
              ),
              _buildElevatedButton(
                icon: Icons.support_agent,
                label: 'Support',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));
                },
              ),
              _buildElevatedButton(
                icon: Icons.logout,
                label: 'Log Out',
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildElevatedButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 140,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: elivitedldColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(vertical: 10),
          elevation: 2,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 22, color: Colors.red),
            SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
