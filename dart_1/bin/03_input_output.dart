import 'dart:io';

void main(List<String> args) {
  // Aufgabe:
  // Findet ein passendes Package um Consolen Eingaben vom Nuzter einzulesen
  // Lest zwei zahlen vom Nutzer ein (int.parse / int.tryParse)
  // diese zahlen sollen miteinander multipliziert werden
  // gebt das ergebnis aus
  print('Bitte gebe die erste Zahl ein:');
  final numberOneInput = stdin.readLineSync() ?? '';
  print('Bitte gebe die zweite Zahl ein:');
  final numberTwoInput = stdin.readLineSync() ?? '';

  final parsedNumberOne = int.tryParse(numberOneInput);
  final parsedNumberTwo = int.tryParse(numberTwoInput);

  if (parsedNumberOne == null || parsedNumberTwo == null) {
    print('Bitte gebe nur valide Zahlen ein.');
    return;
  }

  final product = parsedNumberOne * parsedNumberTwo;

  print('Ergebnis: $product');
}
