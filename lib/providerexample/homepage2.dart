import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_2_provider/providerexample/numberlistprovider.dart';
import 'package:weather_app_2_provider/providerexample/second_page.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: (context, NumberlistModel, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            NumberlistModel.addNumbers();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.red,
          toolbarHeight: 100,
          leading: const Icon(
            Icons.grid_view,
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Second_page(),
                  ));
                },
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white))
          ],
          title: Text("State management demo",
              style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          color: Colors.lightGreen,
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Text("Total Count is ${NumberlistModel.numbers.last}"),
            Expanded(
              child: ListView.builder(
                itemCount: NumberlistModel.numbers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(NumberlistModel.numbers[index].toString()),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
