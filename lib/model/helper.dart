import 'altin_model.dart';

double stringToDouble(String text) {
  try {
    text = text.replaceAll('', '');
    text = text.replaceAll(',', '.');
  } catch (e) {
    text = '1';
  }

  double a;
  try {
    return a = double.parse(text);
  } catch (e) {
    return a = 0.0;
  }
}

String doubleToString(double value) {
  String text = value.toString();

  if (text.contains('.')) {
    List<String> split = text.split('.');

    // text = '${_comaFormat(split[0])}.${split[1]}';
  } else {
    // text = _comaFormat(text);
  }

  return text;
}

/* String _comaFormat(String text) {
  String formatted = "";
  int counter = 0;
  for (int i = (text.length - 1); i >= 0; i--) {
    counter++;
    String str = text[i];
    if ((counter % 3) != 0 && i != 0) {
      formatted = "$str$formatted";
    } else if (i == 0) {
      formatted = "$str$formatted";
    } else {
      formatted = ",$str$formatted";
    }
  }
  return formatted.trim(); */

