import 'package:flutter/material.dart';
import 'package:number_trivia_app/pages/search_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchPage();
  }
}