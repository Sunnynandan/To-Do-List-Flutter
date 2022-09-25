import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data.dart';

class Crud with ChangeNotifier {
  Future<List> getData() async {
    return await Data.getData();
  }

  Future<void> deleteAll() async {
    await Data.deleteAll();
    notifyListeners();
  }

  Future<void> insertData(String txt) async {
    await Data.insertData(txt, false);
    notifyListeners();
  }

  Future<void> delete(String text) async {
    await Data.delete(text);
    notifyListeners();
  }

  Future<void> update(String newText, String oldText) async {
    await Data.update(newText, oldText);
    notifyListeners();
  }
}
