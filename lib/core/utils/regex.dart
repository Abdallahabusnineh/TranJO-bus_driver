bool isValidEmail(String email) {
  final RegExp emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

bool isValidPassword(String password) {
  final RegExp passwordRegex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#$&*~]).{8,}$');
  return passwordRegex.hasMatch(password);
}

bool isValidPhoneNumber(String number) {
  final RegExp emailRegex = RegExp(r'^07[789]\d{7}$');
  return emailRegex.hasMatch(number);
}
