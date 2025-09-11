void main() {
  //variables
  var filter = 'company';
  String key = 'company';
  var price = 124.00;
  print(price);

  String combine = '''
  hello
  how are you''';
  print(combine);

  //List

  List contacts = [];
  contacts = ['umer', 'haider', 123];
  print(contacts);

  //For each Loop

  contacts.forEach((filter) {
    print('filter: $filter');
  });

  // Maps

  Map mapoffilters = {'id': 'company', 'id2': 'Company', 'id3': 'states'};
  mapoffilters['id3'] = 'my filter';
  print('Get filter with id3: ${mapoffilters['id3']}');

  mapoffilters.forEach((key, value) {
    print('$key : $value');
  });

  //emoji
  Runes myEmoji = Runes('\u{1f607}');
  print(String.fromCharCodes(myEmoji));

  //if else condition

  bool check = false;

  if (check) {
    print('store is closed');
  } else if (check) {
    print('store is Open');
  } else if (check) {
    print('Item is out of Stock');
  } else {
    print('Nothing Matched');
  }

  // For loop
  for (var values in contacts) {
    print('values :  $values');
  }

  //function
  //  void OrderEspresso(int HowManyCups){
  //   print('Cups : $HowManyCups');
  //  }
  //  OrderEspresso(50);

  bool OrderEspresso([int? HowManyCups]) {
    print('Cups : $HowManyCups');
    bool order = false;
    if (HowManyCups != null) {
      order = true;
    }
    return true;
  }

  bool isOrderDone = OrderEspresso(46);
  print('Order Done : $isOrderDone');
}
