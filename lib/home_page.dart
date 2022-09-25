import 'package:flutter/material.dart';
import 'package:flutter_application_1/CRUD.dart';
import 'package:flutter_application_1/List_data.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _controller = TextEditingController();

  var input_text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.delete_forever),
            color: Colors.black,
            splashColor: Colors.black12,
            onPressed: () {
              Provider.of<Crud>(context, listen: false).deleteAll();
            },
          ),
          title: const Text(
            'To Do List',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 26,
            ),
          ),
        ),
        body: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        label: const Text("Enter Text Here"),
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Enter text to Insert',
                      ),
                    ),
                  ),
                  IconButton(
                      iconSize: 40,
                      color: Colors.black,
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          Provider.of<Crud>(context, listen: false)
                              .insertData(_controller.text);
                        }
                        _controller.clear();
                      },
                      icon: const Icon(Icons.add_circle))
                ]),
                FutureBuilder(
                    future: Provider.of<Crud>(context).getData(),
                    builder: (context, snapshot) => (snapshot.connectionState ==
                            ConnectionState.waiting)
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Colors.black,
                          ))
                        : (snapshot.data == null)
                            ? const Center(child: Text("No Data Found"))
                            : Expanded(
                                child: ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: ((context, index) => ListData(
                                          content: snapshot.data![index]['txt'],
                                        ))),
                              ))
              ],
            )));
  }
}
