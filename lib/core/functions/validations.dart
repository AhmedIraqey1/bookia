bool isEmailValid(String email) {
  return RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  ).hasMatch(email);
}

bool isEgyptianPhone(String number) {
  return RegExp(r'^01[0125][0-9]{8}$').hasMatch(number);
}

bool isPasswordvalid(String password) {
  return RegExp(
    r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$',
  ).hasMatch(password);
}
