import 'package:flutter/material.dart';
import 'package:midterm_app/logic/car_helper.dart';
import 'package:midterm_app/logic/car_model.dart';

class AddCar extends StatefulWidget {
  const AddCar({Key? key}) : super(key: key);

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final _form = GlobalKey<FormState>();
  TextEditingController carId = TextEditingController();
  TextEditingController photoUrl = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Add"),
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
                          CarRepository().addCar(car);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("ADD"),
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
