import 'dart:io';

void main() {
  stdout.write("Enter a Number : ");
  int? n = int.tryParse(stdin.readLineSync() ?? '');

  if (n == null || n < 0) {
    print("Invalid input.");
    return;
  }
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write("$j ");
    }
    print("");
  }
}
