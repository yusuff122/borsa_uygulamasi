
import 'helper.dart' as helper;

class Altin {
  Altin({
    required this.key,
    required this.buying,
    required this.selling,
    required this.type,
    required this.name,
  });

  String key;
  double buying;
  double selling;
  String type;
  String name;

  factory Altin.fromJson(String key, Map<String, dynamic> map) => Altin(
    key : key,
    buying: helper.stringToDouble(map["Buying"]),
    selling: helper.stringToDouble(map["Selling"]),
    type: map["Type"].toString(),
    name: map["name"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "Buying": helper.doubleToString(buying),
    "Selling": helper.doubleToString(selling),
    "Type": type,
    "ame": name,
  };
}
 late List<Altin> filteredList = [];