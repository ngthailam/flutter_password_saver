class PasswordStrengthChecker {
  // 0: Nothing
  // 1: Weak
  // 2: Medium
  // 3: Strong
  // 4: Excellent
  static int check(String password) {
    int strengthIndex = 0;

    if (password.isEmpty) return strengthIndex;

    if (password.contains(RegExp(r'[a-z]'))) {
      strengthIndex++;
    }

    if (password.contains(RegExp(r'[A-Z]'))) {
      strengthIndex++;
    }

    if (password.contains(RegExp(r'[0-9]'))) {
      strengthIndex++;
    }

    if (password.contains(RegExp(r'[\-_!?@]'))) {
      strengthIndex++;
    }

    return strengthIndex;
  }
}
