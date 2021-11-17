import 'package:flutter/material.dart';

class CarItem extends StatefulWidget {
  const CarItem(
      {Key? key,
      required this.id,
      required this.name,
      required this.year,
      required this.imageUrl})
      : super(key: key);

  final int id;
  final String imageUrl;
  final String name;
  final int year;

  @override
  State<CarItem> createState() => _CarItemState();
}

class _CarItemState extends State<CarItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          FadeInImage(
            placeholder: const AssetImage('assets/images/car_placeholder.png'),
            image: NetworkImage(widget.imageUrl),
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          Text(widget.name),
          Text(widget.year.toString())
        ],
      ),
    );
  }
}
