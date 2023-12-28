import 'package:flutter_test/flutter_test.dart';
import 'package:testsuitmedia/utils/utils.dart';

void main() {
  group('Utils.isPalindrome', () {
    test('should return whether a string is a Palindrome', () {
      expect(Utils.isPalindrome('kasur rusak'), equals(true));
      expect(Utils.isPalindrome('step on no pets'), equals(true));
      expect(Utils.isPalindrome('put it up'), equals(true));
      expect(Utils.isPalindrome('suitmedia'), equals(false));
    });
  });
}
