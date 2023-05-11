import 'dart:ui';

// extension DiacriticsAwareString on String {
//   static const diacritics =
//       'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
//   static const nonDiacritics =
//       'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

//   String get withoutDiacriticalMarks => this.splitMapJoin('',
//       onNonMatch: (char) => char.isNotEmpty && diacritics.contains(char)
//           ? nonDiacritics[diacritics.indexOf(char)]
//           : char);
// }

extension ColorExtension on String {
  Color get hexColor {
    var hexColor = replaceAll("#", "");
    return hexColor.length == 6
        ? Color(int.parse("0xFF$hexColor"))
        : const Color.fromARGB(255, 0, 0, 255);
  }
}

class HexaColor {
  static Color fromString(String hexaString) {
    var hexColor = hexaString.replaceAll("#", "");
    return hexColor.length == 6
        ? Color(int.parse("0xFF$hexColor"))
        : const Color.fromARGB(255, 0, 0, 255);
  }
}
