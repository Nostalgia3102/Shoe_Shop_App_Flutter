import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';
import 'package:shop_app_flutter/pages/home_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   const border = OutlineInputBorder(
      borderSide: BorderSide(
          color: Color.fromRGBO(225, 225, 225, 1)
      ),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );

    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            centerTitle: true
          ),
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(254, 206, 1, 1), primary: const Color.fromRGBO(254, 206, 1, 1)),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            prefixIconColor:Color.fromRGBO(119, 119, 119, 1),
            border: border,
            enabledBorder: border,
            focusedBorder: border
          ),
            textTheme: const TextTheme(
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )
            ),
          useMaterial3: true
        ),
        title: "Shopping App",
        home:const HomePage(),
        //home : Provider(
        //   create: (context) => 'Hello!',
        //   child: const HomePage()
        // ),

      ),
    );
  }
}
