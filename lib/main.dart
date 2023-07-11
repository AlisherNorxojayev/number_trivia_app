import 'package:flutter/material.dart';
import 'package:number_trivia_app/models/number_model.dart';
import 'package:number_trivia_app/pages/search_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NumberModel>(
        create: (context) => NumberModel(number: 12342323, text: 'asASDFASDdf'),
        builder: (context, child) {
          return const SearchPage();
        });
  }
}
