class Validator {
  static String? validaterField({required String value}) {
    if (value.isEmpty) {
      return 'Text filed not empty';
    } else {
      return null;
    }
  }

  static String? userId({required String uid}) {
    if (uid.isEmpty) {
      return 'User Id Not Empty';
    } else if (uid.length <= 5) {
      return "Minmum 5 letters";
    }
    return null;
  }
}
