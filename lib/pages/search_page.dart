// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:number_trivia_app/core/get_number.dart';
import 'package:provider/provider.dart';

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
          backgroundColor: Colors.green,
          title: const Text('Number Trivia'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<NumberModel>(
                builder: (context, value, child) {
                  print(value.number);
                  if (value.status == 'loading') {
                    return Builder(builder: (context) {
                      return const CircularProgressIndicator();
                    });
                  }
                  if (value.status == 'loaded') {
                    numberModel = value;
                  }

                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          value.number.toString(),
                          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          value.text,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 19,
                      controller: controller,
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () async {
                            int n = int.parse(controller.text);
                            Future<NumberModel> son = getNumber(n);

                            Provider.of<NumberModel>(context, listen: false).changeStatus('loading');
                            NumberModel mobel = await son;
                            Provider.of<NumberModel>(context, listen: false).changeModel(mobel);
                            Provider.of<NumberModel>(context, listen: false).changeStatus('loaded');
                          },
                          child: Container(
                            color: Colors.green,
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.43,
                            child: const Center(child: Text('Search', style: TextStyle(color: Colors.white))),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            Future<NumberModel> son = getRandomNumber();
                            Provider.of<NumberModel>(context, listen: false).changeStatus('loading');
                            NumberModel mobel = await son;
                            Provider.of<NumberModel>(context, listen: false).changeModel(mobel);
                            Provider.of<NumberModel>(context, listen: false).changeStatus('loaded');
                          },
                          child: Container(
                            color: Colors.grey,
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.43,
                            child: const Center(child: Text('Get random trivia', style: TextStyle(color: Colors.black))),
                          ),
                        ),
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
