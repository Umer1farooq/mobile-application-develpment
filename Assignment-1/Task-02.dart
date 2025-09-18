import 'dart:io';

void main() {
  stdout.write("Enter Your name: ");
  String? name = stdin.readLineSync();

  stdout.write("Enter Your Age: ");
  int? age = int.tryParse(stdin.readLineSync() ?? '');
  if (age == null) {
    print("Invalid age entered.");
    return;
  }

  if (age < 18) {
    print("Sorry $name, you are not eligible to register.");
    return;
  }

  print("Welcome $name, you are eligible to register!\n");

  stdout.write("How many numbers do you want to enter: ");
  int? n = int.tryParse(stdin.readLineSync() ?? '');
  if (n == null || n <= 0) {
    print("Invalid number of inputs.");
    return;
  }

  List<int> numbers = [];
  for (int i = 1; i <= n; i++) {
    stdout.write("Enter number $i: ");
    int? num = int.tryParse(stdin.readLineSync() ?? '');
    if (num == null) {
      print("Invalid input, try again.");
      i--;
    } else {
      numbers.add(num);
    }
  }

  int evenSum = 0;
  int oddSum = 0;
  int largest = numbers[0];
  int smallest = numbers[0];

  for (int value in numbers) {
    if (value % 2 == 0) {
      evenSum += value;
    } else {
      oddSum += value;
    }
    if (value > largest) largest = value;
    if (value < smallest) smallest = value;
  }

  print("\n===== Results =====");
  print("Numbers entered: $numbers");
  print("EVEN SUM: $evenSum");
  print("ODD SUM: $oddSum");
  print("LARGEST NUMBER: $largest");
  print("SMALLEST NUMBER: $smallest");
}
