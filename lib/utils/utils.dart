mixin Utils {
  static bool isPalindrome(String value) {
    final _value = value.replaceAll(' ', '');
    for (var i = 0; i < _value.length / 2; i++) {
      if (_value.codeUnitAt(i) != _value.codeUnitAt(_value.length - i - 1)) {
        return false;
      }
    }
    return true;
  }
}
