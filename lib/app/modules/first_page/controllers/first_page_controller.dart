import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class FirstPageController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final nameKey = GlobalKey<FormBuilderFieldState>();
  final palindromeKey = GlobalKey<FormBuilderFieldState>();

  void isPalindrome(String text) {
    String reversedText = '';
    String newText = '';

    for (int i = 0; i <= text.length - 1; i++) {
      if (text[i] != " ") {
        newText += text[i];
      }
    }

    for (int i = newText.length - 1; i >= 0; i--) {
      reversedText += newText[i];
    }

    if (reversedText == newText) {
      Get.defaultDialog(title: 'sentence', content: const Text('isPalindrome'));
    } else {
      Get.defaultDialog(
          title: 'sentence', content: const Text('not Palindrome'));
    }
  }
}
