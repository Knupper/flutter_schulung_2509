void main(List<String> args) {
  // Variable kann nur einmal zugewiesen werden
  final int magicNumber = 42;

  // Normale variable, mehrfache Zuweisung möglich
  int outputInt = 2;

  outputInt = 4;

  var output = '123';
  output = 23;

  var otherOutput;
  otherOutput = '42';
  otherOutput = 32;
  otherOutput = null;

  dynamic dynamicOuput = 32;
  dynamicOuput = '32';

  // nullables
  int? nullableInt = null;

  // nullableInt ??= 0;

  int sum = 42 + (nullableInt ?? 0);

  late int lateSum;

  lateSum = 21;

  print('test $lateSum');
}
