import 'package:flutter/material.dart';
import 'package:midterm_app/logic/car_data.dart';
import 'package:midterm_app/logic/car_helper.dart';
import 'package:midterm_app/widgets/car_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/add').then((_) {
                    setState(() {});
                  });
                },
                icon: const Icon(Icons.add))
          ],
          title: const Text(
            'Midterm App',
            style: TextStyle(fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 200, crossAxisCount: 1, mainAxisSpacing: 48),
              itemCount: DUMMY_DATA.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  confirmDismiss: (direction) => showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: const Text("Are you sure?"),
                            content: const Text(
                                "Do you really want to delete this car?"),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("NO")),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      CarRepository()
                                          .removeCar(DUMMY_DATA[index].id);
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: const Text("YES"))
                            ],
                          )),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  background: Container(
                      alignment: Alignment.centerRight,
                      color: Colors.blue[300],
                      child: const Icon(Icons.delete, color: Colors.white)),
                  child: GestureDetector(
                      onLongPress: () {
                        Navigator.pushNamed(context, '/edit',
                                arguments: DUMMY_DATA[index].id)
                            .then((_) {
                          setState(() {});
                        });
                      },
                      child: CarItem(
                        id: DUMMY_DATA[index].id,
                        name: DUMMY_DATA[index].description,
                        year: DUMMY_DATA[index].year,
                        imageUrl: DUMMY_DATA[index].imageUrl,
                      )),
                );
              }),
        ));
  }
}
