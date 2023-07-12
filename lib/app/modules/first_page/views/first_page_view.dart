import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:suitmedia/app/data/variables.dart';

import '../controllers/first_page_controller.dart';
import 'components/forms.dart';

class FirstPageView extends GetView<FirstPageController> {
  const FirstPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover ,image: AssetImage('assets/images/background.png'))
        ),

        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person_add_alt_1, color: Colors.white,),
                    backgroundColor: Colors.white.withOpacity(.4),
                  ),

                  SizedBox(height: 50,),

                  Forms(controller: controller),

                  SizedBox(height: 50,),

                  CheckButton(controller: controller),

                  SizedBox(height: 20,),

                  NextButton(controller: controller)
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.controller,

  });
  final FirstPageController controller;
  @override
  Widget build(BuildContext context) {
    return
      FilledButton(onPressed: (){

      final nameField = controller.nameKey.currentState!;

      nameField.validate();

      if(nameField.isValid){
        nameField.save();
        Get.toNamed('/second-page', arguments: nameField.value);
      }


    },
        style: FilledButton.styleFrom(
          backgroundColor: Vars.cyan,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          maximumSize: Size(double.infinity, 60)
        ),
        child: SizedBox(width:double.infinity,child: Center(child: Text('NEXT'))), );
  }
}

class CheckButton extends StatelessWidget {
  const CheckButton({
    super.key,
    required this.controller,

  });

  final FirstPageController controller;


  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: (){

      final palindrome = controller.palindromeKey.currentState!;

      palindrome.validate();

      palindrome.isValid ? controller.isPalindrome(palindrome.value) : null;

    },
        style: FilledButton.styleFrom(
          backgroundColor: Vars.cyan,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          maximumSize: Size(double.infinity, 60)
        ),
        child: SizedBox(width:double.infinity,child: Center(child: Text('CHECK'))), );
  }
}

