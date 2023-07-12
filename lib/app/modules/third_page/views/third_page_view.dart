import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:suitmedia/app/data/variables.dart';
import 'package:suitmedia/app/modules/second_page/controllers/second_page_controller.dart';

import '../controllers/third_page_controller.dart';

class ThirdPageView extends GetView<ThirdPageController> {
  const ThirdPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {



    

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title:  const Text('Third Screen'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new), onPressed: () => Get.back()),
      ),
      body: RefreshIndicator(
        onRefresh: controller.refresh,
        child: FutureBuilder(
          future: controller.fetchUser(controller.pages),
          builder: (context, snapshot) {
            return Center(
              child: snapshot.connectionState == ConnectionState.waiting ? CircularProgressIndicator() :
                  //checking if the list is empty
              controller.users.length == 0 ? Text('List is empty') :
              Obx(
                  () => ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.users.length + 1,
                    itemBuilder: ( context,  index){

                      if(index < controller.users.length){
                        final email = controller.users[index]['email'];
                        final name = controller.users[index]['first_name'] + ' ' + controller.users[index]['last_name'];
                        final avatar = controller.users[index]['avatar'];
                        return Column(
                          children: [
                            ListTile(
                              minVerticalPadding: 20,
                                onTap: (){
                                  Get.put(SecondPageController()).userName.value = name;
                                  Get.back();
                                },
                                title: Text(name, style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20),),
                              subtitle: Text(email),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(avatar),
                                backgroundColor: Vars.cyan,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Divider(),
                            )
                          ],
                        );
                      }else{
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: controller.users.length == controller.totalUsers.value ? SizedBox() : Center(child: CircularProgressIndicator()),
                        );
                      }
                    }),
              )
            );
          }
        ),
      ),
    );
  }
}
