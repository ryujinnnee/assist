import 'package:chat/log/data.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  // const ItemWidget({Key? key}) : super(key: key);

  final Item item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 0.0,
      child: ListTile(
        onTap: () {},
        leading: Image.asset(item.image),
        title: Text(item.assigment),
        subtitle: Text(item.desc),
        trailing: const Icon(Icons.delete),
      ),
    );
  }
}
