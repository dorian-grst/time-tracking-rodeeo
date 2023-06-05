extension ValidatorExtensions on String {
  String? get validateTimeFormat {
    String pattern = r'^([0-9]{1,3}|[01]?[0-9]{2}|2[0-3]{1,2})h([0-5][0-9])?$';
    RegExp regExp = RegExp(pattern);
    if (isEmpty || !regExp.hasMatch(this)) {
      return 'Heure au format 22h30 et/ou 220h';
    }
    return null;
  }

  String? get validateDateFormat {
    String pattern = r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/[0-9]{2}$';
    RegExp regExp = RegExp(pattern);
    if (isEmpty || !regExp.hasMatch(this)) {
      return 'Date au format 22/03/23';
    }
    return null;
  }

  static bool isLetterDetailBox(String string) {
    String pattern = r'[a-zA-Z]';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }
}
