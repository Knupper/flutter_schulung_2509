class Car {
  // _ -> this variable can only be accessed inside this file
  late String _color;

  String get color => this._color;

  set setColor(String color) {
    // check if color is a valid color
    this._color = color;
  }

  @override
  String toString() {
    return 'Car is $color.';
  }
}
