import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:start_up_workspace/models/Post_model.dart';
import 'dart:convert';

import '../../../resources/helpers/all_imports.dart';

class HomeController extends GetxController {
  final selectedTabIndex = 0.obs;
  final searchController = TextEditingController();
  final posts = <PostModel>[].obs;
  final filteredPosts = <PostModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPostsFromApi();
  }

  void changeTabIndex(int index) {
    selectedTabIndex.value = index;
  }

  Future<void> fetchPostsFromApi() async {
    isLoading(true);
    try {
      final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/1/comments'));

      final data = Components().bodyDecode(response.bodyBytes);
      final List list = data as List;
      List<PostModel> result = [];
      for (var element in list) {
        result.add(PostModel.fromJson(element));
      }
      posts.value = result;
      log(result.toString());
      if (response.statusCode != 200) {
        throw Exception();
      }
    } catch (e) {
      rethrow;
      Get.snackbar('Error', 'Failed to load posts');
    } finally {
      isLoading(false);
    }
  }

  void filterPosts(String? query) {
    if (query == null || query.isEmpty) {
      filteredPosts.value = [];
    } else {
      final String lowerCaseQuery = query.toLowerCase();
      filteredPosts.value = posts.where((post) {
        return post.name.toString().toLowerCase().contains(lowerCaseQuery) ||
            post.email.toString().toLowerCase().contains(lowerCaseQuery) ||
            post.body.toString().toLowerCase().contains(lowerCaseQuery);
      }).toList();
    }
  }
}
