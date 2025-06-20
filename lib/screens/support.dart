import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

import '../clases/Color.dart';
import 'loginScreen.dart';

class Support extends StatefulWidget {
  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
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
            SizedBox(width: 8),
            Icon(Icons.support_agent, color: Colors.red, size: 30),
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: ScafeldColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // معلومات المستخدم
              if (user != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    "You are logged in as: ${user.email}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),

              // وصف بسيط
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "How can we help you today?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              // زر التواصل مع الصيدلي
              _buildElevatedButton(
                context: context,
                icon: Icons.medical_services,

                label: 'Contact Pharmacist on Duty',

                onPressed: () async {
                  final Uri url = Uri.parse("tel:+962790000000"); // رقم وهمي
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
              ),

              SizedBox(height: 20),

              // زر التواصل مع دعم التطبيق
              _buildElevatedButton(

                context: context,
                icon: Icons.email,
                label: 'Contact App Support',
                onPressed: () async {
                  final Uri url = Uri.parse("mailto:support@pillpoint.com");
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
              ),

              SizedBox(height: 30),

              // زر تسجيل الخروج
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: elivitedldColor,
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
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
      ),
    );
  }

  // تصميم زر موحد
  Widget _buildElevatedButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 280,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: elivitedldColor,
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
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
