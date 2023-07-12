// ignore_for_file: unused_element

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ThirdPageController extends GetxController {
  final scrollController = ScrollController();

  RxList users = [].obs;

  RxInt totalUsers = 0.obs;

  int pages = 1;

  // ignore: annotate_overrides
  Future<void> refresh() async {
    users.clear();
    pages = 1;
    await fetchUser(pages)
        .then((value) => Future.delayed(const Duration(seconds: 1)));
  }

  Future fetchUser(int page) async {
    try {
      final response =
          await Dio().get('https://reqres.in/api/users?page=$page&per_page=10');

      if (response.statusCode == 200) {
        totalUsers.value = response.data['total'];

        if (users.length < totalUsers.value) {
          users.addAll(response.data['data']);
        }
      }

      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        pages++;
        fetchUser(pages);
      }
    });

    @override
    void dispose() {
      scrollController.dispose();
      super.dispose();
    }
  }
}
