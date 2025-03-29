import 'package:flutter/material.dart';
import 'package:untitled18/clases/Color.dart';

class MedicineReminderCard extends StatelessWidget {
  final String nameMidical;
  final String clock;
  final String quantity;
  final VoidCallback? onDelete; // دالة للحذف

  MedicineReminderCard({
    required this.nameMidical,
    required this.clock,
    required this.quantity,
     this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(10),
      color: cardldColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameMidical,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Time: $clock",
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                ),
                SizedBox(height: 8),
                Text(
                  "Remaining: $quantity pills",
                  style: TextStyle(fontSize: 16, color: Colors.redAccent),
                ),
              ],
            ),
            // الأزرار على اليمين
            Column(
              children: [
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // تنفيذ عند التأكيد
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Confirm"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
