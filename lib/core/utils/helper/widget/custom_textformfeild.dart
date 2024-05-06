import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  Function()? onTap;
  Function()? onComplet;
  Function(String val)? onCahange;
  Function(String? val)? onSave;
  Function(String val)? onSubmit;
  TextEditingController? controller;
  bool readOnly;
  CustomTextFormFeild({
    super.key,
    this.onTap,
    this.onCahange,
    this.onComplet,
    this.controller,
    this.onSave,
    this.onSubmit,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 55,
        child: TextFormField(
          controller: controller,
          onTap: onTap,
          onChanged: onCahange,
          onEditingComplete: onComplet,
          onFieldSubmitted: onSubmit,
          onSaved: onSave,
          readOnly: readOnly,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              label: const Text('Search'),
              counterStyle: Theme.of(context).textTheme.bodyMedium,
              floatingLabelStyle: Theme.of(context).textTheme.labelMedium,
              suffixIcon: const Icon(Icons.mic),
              fillColor: Theme.of(context).highlightColor,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
        ),
      ),
    );
  }
}
