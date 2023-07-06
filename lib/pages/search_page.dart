import 'package:flutter/material.dart';
import 'package:number_trivia_app/core/get_number.dart';

import '../models/number_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();

  NumberModel? numberModel;
  Future<NumberModel>? func;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Number Trivia'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                  future: func,
                  builder: (context, snapshot) {
                    print(snapshot.connectionState);
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Builder(builder: (context) {
                        return const CircularProgressIndicator();
                      });
                    }
                    if (snapshot.hasData) {
                      numberModel = snapshot.data;
                    }

                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            numberModel == null ? '' : numberModel!.number.toString(),
                            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            numberModel == null ? 'Start Searching' : numberModel!.text,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }),
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              int n = int.parse(controller.text);
                              Future<NumberModel> son = getNumber(n);
                              setState(() {
                                // numberModel = son;
                                func = son;
                              });
                            },
                            child: const Text('Search')),
                        TextButton(
                            onPressed: () {
                              Future<NumberModel> son = getRandomNumber();
                              setState(() {
                                func = son;
                              });
                            },
                            child: const Text('Get random trivia')),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
