import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'numberlistprovider.dart';

class Second_page extends StatefulWidget {

   Second_page({super.key,});

  @override
  State<Second_page> createState() => _Second_pageState();
}

class _Second_pageState extends State<Second_page> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<NumberListProvider>(
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
          leading:  IconButton(onPressed:() {
            Navigator.pop(context);
            
          },

            
           icon:Icon(Icons.arrow_back))
          ,
          
          title: Text("State management demo",
              style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          color: Colors.lightBlue,
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