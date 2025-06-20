import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text(
          'Location',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // صورة الخريطة (تمثيلية فقط)
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Loca.png'), // حط صورة تمثيلية لخريطة
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
          
              // معلومات الموقع
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.red, width: 1),
                ),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.red),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Current Location:\nIrbid, University Street',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
          
              // زر مشاركة موقعي
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade100,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.share_location, color: Colors.red),
                  label: Text('Share My Location', style: TextStyle(color: Colors.red, fontSize: 18)),
                ),
              ),
              SizedBox(height: 15),
          
              // زر العثور على أقرب صيدلية
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade100,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.local_pharmacy, color: Colors.red),
                  label: Text('Find Nearest Pharmacy', style: TextStyle(color: Colors.red, fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


