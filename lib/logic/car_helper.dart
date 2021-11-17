import 'package:midterm_app/logic/car_data.dart';
import 'package:midterm_app/logic/car_model.dart';

class CarRepository {
  void addCar(Car car) {
    DUMMY_DATA.add(car);
  }

  void removeCar(int id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
  }

  void editCar(Car car, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [car]);
  }
}
