String? strongPswdValidator(String value) {
  RegExp strongPwsdRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value.isEmpty) {
    return 'Password field must not be empty';
  } else {
    if (!strongPwsdRegex.hasMatch(value)) {
      return 'Not Strong Enough. Must contain: \n- lowercase letter\n- uppercase letter\n- number\n- special character\n- Be atleast 8 characters long';
    } else {
      return null;
    }
  }
}
