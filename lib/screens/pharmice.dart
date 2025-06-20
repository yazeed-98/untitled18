import 'package:flutter/material.dart';

import '../clases/Color.dart';
import '../clases/formFaild.dart';
import 'location.dart';


class PharmacyListScreen extends StatefulWidget {
  @override
  State<PharmacyListScreen> createState() => _PharmacyListScreenState();
}

class _PharmacyListScreenState extends State<PharmacyListScreen> {
  final List<Map<String, String>> pharmacies = [
    {'name': 'Green Health Pharmacy', 'address': '123 Main St, Irbid', 'phone': '+962 7 9012 3456'},
    {'name': 'Al Shifa Pharmacy', 'address': '456 King Abdullah St, Irbid', 'phone': '+962 7 5678 9012'},
    {'name': 'Irbid Care Pharmacy', 'address': '789 University Rd, Irbid', 'phone': '+962 7 3456 7890'},
    {'name': 'City Life Pharmacy', 'address': '321 Garden St, Irbid', 'phone': '+962 7 2233 4455'},
    {'name': 'Wellness Pharmacy', 'address': '654 Downtown Ave, Irbid', 'phone': '+962 7 1122 3344'},
  ];


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ScafeldColor,
      appBar: AppBar(

        backgroundColor: appBarColor,

        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 120,
              top: 20),
          child: PreferredSize(preferredSize: Size(0, 20), child: Text('Pharmacy',

            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27
            ),)),
        ),



        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Formfaild(
              label: 'Search pharmice',
              hint: 'Enter medicine name',
              preIcon: Icons.search,
              border: Colors.white30,
              borderRades: 20,
            ),
          ),
        ),


      ),
        
floatingActionButton: FloatingActionButton(onPressed: (){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LocationPage(),));
},child: Icon(Icons.location_on_outlined,
color: Colors.red,
  size: 35,
),
backgroundColor: appBarColor,),

        body:
        ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: pharmacies.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.blue.shade100,
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: ListTile(
              leading: Icon(Icons.local_pharmacy, color: Colors.red, size: 40),
              title: Text(
                pharmacies[index]['name']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                pharmacies[index]['address']!,
                style: TextStyle(fontSize: 15, color: Colors.red),
              ),
              trailing: IconButton(
                icon: Icon(Icons.call, color: Colors.blue),
                onPressed: () {
                  print('Calling ${pharmacies[index]['phone']}');
                },
              ),
            ),
          );
        },
      )
    );


  }
}
