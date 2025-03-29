import 'package:flutter/material.dart';
import 'package:untitled18/clases/Color.dart';

import '../clases/CARD.dart';

// كلاس الشاشة الرئيسية اللي فيها زر الإضافة وقائمة البطاقات
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


  List<MedicineReminderCard> reminders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicine Reminders"),
        backgroundColor: appBarColor,
        centerTitle: true,
        bottom: PreferredSize(preferredSize: Size(0, 30), child: Icon(Icons.alarm,
        color: Colors.red,
            size: 50,)),
      ),
      body: ListView(
        children: reminders,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
                          decoration: InputDecoration(
                            labelText: 'Medicine name (e.g., Revanin)',
                          ),
                          validator: (value) =>
                          value!.isEmpty ? 'Enter medicine name' : null,
                        ),
                        TextFormField(
                          controller: addClock,
                          decoration: InputDecoration(
                            labelText: 'Time (e.g., 2:00 PM)',
                          ),
                          validator: (value) =>
                          value!.isEmpty ? 'Enter time' : null,
                        ),
                        TextFormField(
                          controller: addQuantity,
                          decoration: InputDecoration(
                            labelText: 'Quantity (e.g., 100 pills)',
                          ),
                          validator: (value) =>
                          value!.isEmpty ? 'Enter quantity' : null,
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          reminders.add(
                            MedicineReminderCard(
                              nameMidical: addNameMid.text,
                              clock: addClock.text,
                              quantity: addQuantity.text,
                              onDelete: () {
                                setState(() {
                                  reminders.removeWhere((card) =>
                                  card.nameMidical == addNameMid.text &&
                                      card.clock == addClock.text &&
                                      card.quantity == addQuantity.text);

                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                    content: Text('Reminder deleted'),
                                backgroundColor: Colors.red));
                                 },
                            ),
                          );
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
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.red,
        ),
        backgroundColor: ScafeldColor,
      ),
    );
  }
}
