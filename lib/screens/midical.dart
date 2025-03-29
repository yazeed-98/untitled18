import 'package:flutter/material.dart';
import 'package:untitled18/clases/Color.dart';
import 'package:untitled18/clases/formFaild.dart';
import 'package:untitled18/screens/shopScreen.dart';
import 'mad.dart';

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

  List<Map<String, dynamic>> cartItems = [];

  void addToCart(Map<String, dynamic> item) {
    setState(() {
      cartItems.add(item);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${item['name']} added to cart"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          'Medicines',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
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
                MaterialPageRoute(builder: (context) => Shopscreen(cartItems: cartItems)),
              );
            },
          ),
        ],
      ),
      backgroundColor: ScafeldColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Shopscreen(cartItems: cartItems)),
          );
        },
        backgroundColor: ScafeldColor,
        child: Icon(Icons.shopping_cart_outlined, color: Colors.red, size: 35),
      ),
      body: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: elivitedldColor,

              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            ),
            onPressed: () {
              addToCart({
                'name': medicines[index]['name'],
                'description': medicines[index]['description'],
                'price': medicines[index]['price'],
              });
            },
            child: Mad(
              name: medicines[index]['name'] ?? 'Unknown',
              description: medicines[index]['description'] ?? 'No description available',
              price: medicines[index]['price'] ?? '\$0',
            ),
          );
        },
      ),
    );
  }
}
