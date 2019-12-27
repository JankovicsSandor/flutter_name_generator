import 'package:flutter/material.dart';
import 'package:namegenerator/models/bussiness_name.dart';

class BussinessRow extends StatelessWidget {
  final int index;
  final BussinessName item;

  final Function(int) itemLikeClicked;
  BussinessRow(this.index, this.item, this.itemLikeClicked);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      trailing: item.isLiked
          ? Icon(
              Icons.favorite,
            )
          : Icon(Icons.favorite_border),
      onTap: () {
        this.itemLikeClicked(index);
      },
    );
  }
}
