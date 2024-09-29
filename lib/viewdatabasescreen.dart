import 'package:flutter/material.dart';
import 'package:flutter_new/db_helper/db_helper.dart';

class DataBaseScreen extends StatelessWidget {
  const DataBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                DatabaseHelper.instance
                    .insertdata({DatabaseHelper.columnName: 'hello'});
              },
              child: Text('Create')),
          ElevatedButton(onPressed: () {}, child: Text('update')),
          ElevatedButton(onPressed: () {}, child: Text('delete')),
          ElevatedButton(
              onPressed: () async {
                var dbquery = await DatabaseHelper.instance.queryDatabase();
                print(dbquery);
              },
              child: Text('Read'))
        ],
      ),
    );
  }
}
