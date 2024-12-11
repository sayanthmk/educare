import 'package:flutter/material.dart';

class FieldEmail extends StatelessWidget {
  const FieldEmail({
    super.key,
    required this.title,
    required this.controller,
    required this.hintText,
  });

  final String title;
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        border: const OutlineInputBorder(),
        labelText: title,
        labelStyle: const TextStyle(color: Colors.black54),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black12,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a Username';
        }
        return null;
      },
    );
  }
}

class FieldPassword extends StatefulWidget {
  const FieldPassword({
    super.key,
    required this.title,
    required this.controller,
    required this.hintText,
  });

  final String title;
  final TextEditingController controller;
  final String hintText;

  @override
  State<FieldPassword> createState() => _FieldPasswordState();
}

class _FieldPasswordState extends State<FieldPassword> {
  bool _passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock_outline),
        border: const OutlineInputBorder(),
        labelText: widget.title,
        labelStyle: const TextStyle(color: Colors.black54),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.black12,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisibility = !_passwordVisibility;
            });
          },
          icon: Icon(
            _passwordVisibility ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      obscureText: _passwordVisibility,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a Password';
        }
        return null;
      },
    );
  }
}
