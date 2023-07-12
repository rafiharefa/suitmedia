import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../data/variables.dart';
import '../../controllers/first_page_controller.dart';

class Forms extends StatelessWidget {
  const Forms({
    super.key,
    required this.controller,
  });

  final FirstPageController controller;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formKey,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: FormBuilderTextField(
              cursorColor: Vars.cyan,
              key: controller.nameKey,
              validator: FormBuilderValidators.required(),
              name: 'name',
              decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                errorStyle: TextStyle(fontSize: 10),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: FormBuilderTextField(
              cursorColor: Vars.cyan,
              key: controller.palindromeKey,
              validator: FormBuilderValidators.required(),
              name: 'palindrome',
              decoration: InputDecoration(
                  hintText: 'Palindrome',
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  errorStyle: TextStyle(fontSize: 10)),
            ),
          ),
        ],
      ),
    );
  }
}
