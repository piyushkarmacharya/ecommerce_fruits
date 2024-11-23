import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<String> {
  UserNotifier(super.key);
  void updateName(String str) {
    state = str;
  }
}
