import 'package:flutter/material.dart';
import 'package:midterm_app/logic/car_data.dart';
import 'package:midterm_app/logic/car_helper.dart';
import 'package:midterm_app/logic/car_model.dart';

class EditCar extends StatefulWidget {
  const EditCar({Key? key}) : super(key: key);

  @override
  State<EditCar> createState() => _EditCarState();
}

class _EditCarState extends State<EditCar> {
  final _form = GlobalKey<FormState>();
  TextEditingController carId = TextEditingController();
  TextEditingController photoUrl = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)!.settings.arguments;
    var index = DUMMY_DATA.indexWhere((element) => id == element.id);
    final Car car = DUMMY_DATA.firstWhere((element) => element.id == id);
    carId = TextEditingController(text: car.id.toString());
    photoUrl = TextEditingController(text: car.imageUrl);
    brand = TextEditingController(text: car.brand);
    model = TextEditingController(text: car.model);
    year = TextEditingController(text: car.year.toString());
    description = TextEditingController(text: car.description);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Edit"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _form,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: photoUrl,
                    decoration: const InputDecoration(
                      hintText: 'Please enter Image URL',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Value!";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: TextFormField(
                    controller: carId,
                    decoration: const InputDecoration(
                      hintText: 'Please enter ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Value!";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: brand,
                      decoration: const InputDecoration(
                        hintText: 'Please enter Image Brand',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(0),
                          ),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Value!";
                        }
                        return null;
                      },
                    )),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: model,
                      decoration: const InputDecoration(
                        hintText: 'Please enter Image Model',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(0),
                          ),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Value!";
                        }
                        return null;
                      },
                    )),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: year,
                      decoration: const InputDecoration(
                        hintText: 'Please enter Year',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(0),
                          ),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Value!";
                        }
                        return null;
                      },
                    )),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: description,
                      decoration: const InputDecoration(
                        hintText: 'Please enter Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(0),
                          ),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Value!";
                        }
                        return null;
                      },
                    )),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("BACK"),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 40))),
                    ElevatedButton(
                      onPressed: () {
                        if (_form.currentState!.validate()) {
                          Car car = Car(
                              imageUrl: photoUrl.text,
                              id: int.parse(carId.text),
                              brand: brand.text,
                              model: model.text,
                              year: int.parse(year.text),
                              description: description.text);
                          CarRepository().editCar(car, index);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("EDIT"),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 40)),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
