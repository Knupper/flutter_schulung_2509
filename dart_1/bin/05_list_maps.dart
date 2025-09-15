void main() {
  List<dynamic> exampleList = [1, "string", 3.5, 4];
  print(exampleList);
  print(exampleList[1]);
  print(exampleList[0]);
  print(exampleList.length);
  print(exampleList);
  exampleList.add("value");
  print(exampleList);

  int? a = 1;
  int? b = 2;
  int? c;

  List<int> mydummyData = [if (a != null) a, if (b != null) b, if (c != null) c];
  List<int> mydummyData2 = [?a, ?b, ?c];
  print('myDummyData1: ${mydummyData.length}');
  print('myDummyData2: ${mydummyData2.length}');

  Map<String, dynamic> exampleMap = {"key1": 3, "key2": "value2"};

  print(exampleMap);
  print(exampleMap["key1"]);
  print(exampleMap.length);
  print(exampleMap.keys);
}
