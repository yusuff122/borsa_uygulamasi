
import 'altin_model.dart';

class AyarAltins {
  AyarAltins({
    required this.updateDate,
    required this.elements,
  });

  final DateTime updateDate;
  final List<Altin> elements;

  factory AyarAltins.fromJson(Map<String, dynamic> json) {
    DateTime updateDate = DateTime.parse(json["Update_Date"]);
    List<Altin> elements = [];

    json.remove('Update_Date');
    json.forEach((key, value) {
    
      elements.add(Altin.fromJson(key, value));
    });

    return AyarAltins(
        updateDate: updateDate,
        elements: elements
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "Update_Date": updateDate.toIso8601String()
    };

    for (var element in elements) {
      map[element.key] = element.toJson();
    }
    return map;
  }
}
