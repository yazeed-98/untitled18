import 'package:flutter/material.dart';

class Formfaild extends StatelessWidget {
  final String label;
  final String hint;
  final IconData preIcon;
  final IconData? sufixIcon;
  final Color border;
  final double borderRades;
  final String? Function(String?)? value;
  final TextEditingController? controller;
  final bool obscure;

  Formfaild({
    required this.label,
    required this.hint,
    required this.preIcon,
    this.sufixIcon,
    required this.border,
    required this.borderRades,
    this.value,
    this.controller,
    this.obscure = false, // default false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        validator: value,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(preIcon),
          suffixIcon: sufixIcon != null ? Icon(sufixIcon) : null,
          filled: true,
          fillColor: border,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRades),
          ),
        ),
      ),
    );
  }
}
