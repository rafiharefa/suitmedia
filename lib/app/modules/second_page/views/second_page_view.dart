import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/variables.dart';
import '../controllers/second_page_controller.dart';

class SecondPageView extends GetView<SecondPageController> {
  const SecondPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  const Text('Second Screen'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new), onPressed: () => Get.back(),),
      ),
      body: Padding(padding: EdgeInsets.all(30), child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome'),
                  Text(Get.arguments, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ],
              ),
            ],
          ),

          Obx(() => 
              controller.userName.value == '' ?
              Text('Selected User Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),) :
                  Text(controller.userName.value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
          ),


        FilledButton(onPressed: (){
          Get.toNamed('/third-page');
        },
          style: FilledButton.styleFrom(
              backgroundColor: Vars.cyan,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              maximumSize: Size(double.infinity, 60)
          ),
          child: SizedBox(width:double.infinity,child: Center(child: Text('Choose a User')))),

          ],
      ),)
    );
  }
}
