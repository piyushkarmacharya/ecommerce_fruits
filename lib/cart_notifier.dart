import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<Map>> {
  CartNotifier(super.key);
  void addProduct(Map p) {
    state = [...state, p];
  }
}
