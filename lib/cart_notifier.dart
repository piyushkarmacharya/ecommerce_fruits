import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<Map>> {
  CartNotifier(super.key);
  void addProduct(Map p) {
    state = [...state, p];
  }

  void deleteProduct(int index) {
    List<Map> temp = [];
    for (int i = 0; i < state.length; i++) {
      if (i != index) {
        temp = [...temp, state[i]];
      }
    }
    state = temp;
  }
}
