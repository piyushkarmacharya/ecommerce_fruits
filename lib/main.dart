import "package:ecommerce_fruits/cart_notifier.dart";
import "package:ecommerce_fruits/pages/add_to_basket_page/add_to_basket_page.dart";
import "package:ecommerce_fruits/pages/authentication_page/authentication_page.dart";
import "package:ecommerce_fruits/pages/basket_page/basket_page.dart";
import "package:ecommerce_fruits/pages/home_screen/home_screen.dart";
import "package:ecommerce_fruits/pages/order_complete_page.dart/order_complete_page.dart";
import "package:ecommerce_fruits/pages/splash_screen.dart";
import "package:ecommerce_fruits/pages/welcome_page/welcome_page.dart";
import "package:ecommerce_fruits/user_notifier.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final userProvider =
    StateNotifierProvider<UserNotifier, String>((ref) => UserNotifier("User"));
final cartProvider =
    StateNotifierProvider<CartNotifier, List<Map>>((ref) => CartNotifier([]));

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ecommerce Fruits",
      theme: ThemeData(
        fontFamily: 'BricolageGrotesque',
        primaryColor: const Color(0xFFFFA451),
        scaffoldBackgroundColor: const Color(0xFFFFA451),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: const Color(0xFFFFA451),
          ),
        ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        WelcomePage.routeName: (context) => const WelcomePage(),
        AuthenticationPage.routeName: (context) => const AuthenticationPage(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        AddToBasketPage.routeName: (context) => const AddToBasketPage(),
        BasketPage.routeName: (context) => const BasketPage(),
        OrderCompletePage.routeName: (context) => const OrderCompletePage(),
      },
    );
  }
}
