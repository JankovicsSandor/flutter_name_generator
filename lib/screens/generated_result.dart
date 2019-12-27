import 'package:flutter/material.dart';
import 'package:namegenerator/database/helper.dart';
import 'package:namegenerator/database/list_stream.dart';
import 'package:namegenerator/models/bussiness_name.dart';
import 'package:namegenerator/widgets/bussiness_row.dart';

class GeneratedResult extends StatefulWidget {
  GeneratedResult({Key key}) : super(key: key);

  @override
  GeneratedResultState createState() => GeneratedResultState();
}

class GeneratedResultState extends State<GeneratedResult> {
  List<BussinessName> combinedList;
  GeneratedResultState() {
    // getLikedBussinessNames();
    generateRandomNames();
  }

  void modifyItemLike(int index) {
    ListStream.toggleNewValue(index);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BussinessName>>(
      stream: ListStream.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(16.0),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return BussinessRow(index, snapshot.data[index], (index) {
                modifyItemLike(index);
              });
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
