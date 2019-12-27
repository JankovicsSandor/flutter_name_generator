import 'package:flutter/material.dart';
import 'package:namegenerator/database/list_stream.dart';
import 'package:namegenerator/models/bussiness_name.dart';
import 'package:namegenerator/widgets/bussiness_row.dart';

class SavedList extends StatefulWidget {
  SavedList({Key key}) : super(key: key);

  @override
  _SavedListState createState() => _SavedListState();
}

class _SavedListState extends State<SavedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved instances"),
      ),
      body: StreamBuilder<List<BussinessName>>(
        stream: ListStream.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(16.0),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return BussinessRow(index, snapshot.data[index], (index) {});
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
