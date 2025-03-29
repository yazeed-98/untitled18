import 'package:flutter/material.dart';


class Formfaild extends StatelessWidget {
  String label;
  String hint;
  IconData preIcon;
  IconData? sufixIcon;
  Color border;
  double  borderRades;
  String? Function(String?)? value;

  Formfaild ({
    required this.label,
  required this.hint,
  required this.preIcon,
    this.sufixIcon,
    required this .border,
    required   this.borderRades,
this.value,
    final TextEditingController? controller
});

  @override

  Widget build(BuildContext context) {
    return TextFormField(
      validator: value,


      decoration: InputDecoration(
        label: Text(label),
        hintText: hint,
        prefix: Icon(preIcon),
        suffix: Icon(sufixIcon),
        filled: true,
        fillColor: border,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRades)
        )
      ),
      
    );
  }
}
