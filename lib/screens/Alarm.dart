import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled18/clases/Color.dart'; // ✅ استيراد الألوان من ملف مخصص

class Alarm extends StatefulWidget {
  const Alarm({super.key});

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController addNameMid = TextEditingController();
  final TextEditingController addClock = TextEditingController();
  final TextEditingController addQuantity = TextEditingController();

  // نافذة التعديل
  void _showEditDialog(BuildContext context, String docId, Map<String, dynamic> data) {
    final _editFormKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController(text: data['nameMidical']);
    final TextEditingController clockController = TextEditingController(text: data['clock']);
    final TextEditingController quantityController = TextEditingController(text: data['quantity']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit alarm'),
          content: Form(
            key: _editFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Medicine name'),
                  validator: (value) => value!.isEmpty ? 'Enter medicine name' : null,
                ),
                TextFormField(
                  controller: clockController,
                  decoration: InputDecoration(labelText: 'Time'),
                  validator: (value) => value!.isEmpty ? 'Enter time' : null,
                ),
                TextFormField(
                  controller: quantityController,
                  decoration: InputDecoration(labelText: 'Quantity'),
                  validator: (value) => value!.isEmpty ? 'Enter quantity' : null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                if (_editFormKey.currentState!.validate()) {
                  await FirebaseFirestore.instance.collection('reminders').doc(docId).update({
                    'nameMidical': nameController.text,
                    'clock': clockController.text,
                    'quantity': quantityController.text,
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showAddDialog() {
    addNameMid.clear();
    addClock.clear();
    addQuantity.clear();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add a new alarm'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: addNameMid,
                    decoration: InputDecoration(labelText: 'Medicine name (e.g., Revanin)'),
                    validator: (value) => value!.isEmpty ? 'Enter medicine name' : null,
                  ),
                  TextFormField(
                    controller: addClock,
                    decoration: InputDecoration(labelText: 'Time (e.g., 2:00 PM)'),
                    validator: (value) => value!.isEmpty ? 'Enter time' : null,
                  ),
                  TextFormField(
                    controller: addQuantity,
                    decoration: InputDecoration(labelText: 'Quantity (e.g., 100 pills)'),
                    validator: (value) => value!.isEmpty ? 'Enter quantity' : null,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await FirebaseFirestore.instance.collection('reminders').add({
                    'nameMidical': addNameMid.text,
                    'clock': addClock.text,
                    'quantity': addQuantity.text,
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScafeldColor,
      appBar: AppBar(
        title: Text("Medicine Reminders"),
        backgroundColor: appBarColor, // ✅ جاي من Color.dart
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(0, 30),
          child: Icon(
            Icons.alarm,
            color: Colors.red,
            size: 50,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('reminders').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          final docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return Center(child: Text('No reminders yet. Add one!'));
          }

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              var data = docs[index].data()! as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: appBarColor,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('${data['nameMidical']} - ${data['quantity']}'),
                    subtitle: Text('Time: ${data['clock']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            _showEditDialog(context, docs[index].id, data);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            await FirebaseFirestore.instance.collection('reminders').doc(docs[index].id).delete();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Reminder deleted'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.red,
        ),
        backgroundColor: appBarColor, // ✅ جاي من Color.dart
      ),





    );
  }
}
