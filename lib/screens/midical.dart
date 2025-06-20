import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled18/clases/Color.dart';
import 'package:untitled18/clases/formFaild.dart';
import 'package:untitled18/screens/shopScreen.dart';

class MedicineScreen extends StatefulWidget {
  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  final List<Map<String, String>> medicines = [
    {'name': 'Paracetamol', 'description': 'Pain reliever', 'price': '\$5'},
    {'name': 'Amoxicillin', 'description': 'Antibiotic', 'price': '\$12'},
    {'name': 'Ibuprofen', 'description': 'Painkiller', 'price': '\$8'},
    {'name': 'Cetirizine', 'description': 'Allergy relief', 'price': '\$6'},
    {'name': 'Omeprazole', 'description': 'Stomach acid reducer', 'price': '\$15'},
  ];

  void addToFirestore(Map<String, String> item) async {
    await FirebaseFirestore.instance.collection('Cart').add(item);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${item['name']} added to cart"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void deleteMedicine(int index) {
    setState(() {
      medicines.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Medicine deleted"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScafeldColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          'Medicines',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Formfaild(
              label: 'Search Medicine',
              hint: 'Enter medicine name',
              preIcon: Icons.search,
              border: Colors.white30,
              borderRades: 10,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.red),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Shopscreen()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Shopscreen()),
          );
        },
        backgroundColor: appBarColor,
        child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: medicines.length,
        padding: EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final item = medicines[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.white,
            elevation: 4,
            margin: EdgeInsets.only(bottom: 15),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'] ?? '',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    item['description'] ?? '',
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['price'] ?? '',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.add_shopping_cart, color: Colors.red),
                            onPressed: () => addToFirestore(item),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => deleteMedicine(index),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
