import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/z/navigator/joke_navigator.dart';
import 'package:getx_testing/z/navigator/quote_navigator.dart';
import 'package:getx_testing/z/navigator/riddle_navigator.dart';

class HomeController extends GetxController {
  RxInt currentItem = 0.obs;
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.format_quote_sharp),
      label: "Quotes",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.tag_faces_sharp),
      label: "Jokes",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.question_mark_sharp),
      label: "Riddles",
    ),
  ];

  List<Widget> widgets = [
    const QuoteNavigator(),
    const JokeNavigator(),
    const RiddleNavigator()
  ];

  void onTap(int idx) {
    currentItem.value = idx;
  }
}
