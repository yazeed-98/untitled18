import 'package:flutter/material.dart';

import 'loginScreen.dart';




class Support extends StatefulWidget {
  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Support',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            SizedBox(width: 8), // مسافة بين النص والأيقونة
            Icon(Icons.support_agent, color: Colors.red, size: 30),
          ],
        ),
        centerTitle: true, // لجعل العنوان في الوسط
      ),
      backgroundColor: Colors.orange.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // لتوسيط المحتوى
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildElevatedButton(
              context: context,
              icon: Icons.support_agent,
              label: 'Contact Pharmacist on duty',
              onPressed: () {},
            ),

            SizedBox(height: 20),

            _buildElevatedButton(
              context: context,
              icon: Icons.support_agent,
              label: 'Contact to application support',
              onPressed: () {},
            ),

            SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade100,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Loginscreen()),
                );
              },
              child: Text(
                'Log out',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildElevatedButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 280, // تكبير الزر ليكون مناسبًا أكثر
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade100,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: Colors.red.shade900),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 16, // تكبير حجم الخط ليكون واضحًا
              ),
            ),
          ],
        ),
      ),
    );
  }
}
