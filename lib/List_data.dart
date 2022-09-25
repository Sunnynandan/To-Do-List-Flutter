import 'package:flutter/material.dart';
import 'package:flutter_application_1/CRUD.dart';
import 'package:provider/provider.dart';

class ListData extends StatefulWidget {
  final String content;
  static const String listpate = '/listpage';
  final TextEditingController _controller = TextEditingController();

  ListData({
    required this.content,
  });

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(4),
        child: ListTile(
          iconColor: Colors.blueGrey[900],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          tileColor: Colors.white,
          title: Text(
            widget.content,
            style: TextStyle(fontSize: 20, color: Colors.blueGrey[900]),
          ),
          leading: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  title: TextField(
                      controller: widget._controller,
                      decoration: InputDecoration(
                        label: const Text("Enter Text Here"),
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Enter text to Update',
                      )),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Provider.of<Crud>(context, listen: false)
                              .update(widget._controller.text, widget.content);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Update",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ))
                  ],
                ),
              );
            },
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              Provider.of<Crud>(context, listen: false).delete(widget.content);
            },
          ),
        ));
  }
}
