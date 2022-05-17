extension StringExtensions on String {
  String obscureText(bool isObscure) {
    return isObscure ? '*****' : this;
  }
}
