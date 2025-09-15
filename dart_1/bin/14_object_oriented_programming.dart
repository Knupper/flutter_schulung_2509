import 'car.dart';

void main(List<String> args) {
  Car car1 = Car();
  car1.setColor = 'blue';

  car1.color;

  print(car1.toString());

  Car2 car2 = Car2();
  car2.color;
}

class Car2 {
  Car2({this.color = 'unknown'});

  String color;

  @override
  String toString() {
    return 'Car is $color.';
  }
}
