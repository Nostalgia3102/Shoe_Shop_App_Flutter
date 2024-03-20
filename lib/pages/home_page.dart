import 'package:flutter/material.dart';
import 'package:shop_app_flutter/pages/cart_page.dart';
import 'package:shop_app_flutter/widgets/product_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> page = const [ProductList(), CartPage()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body : page[currentPage];
        body: IndexedStack( //the state is maintained & in Stack -> jha pe tha pehele page pe wohi pe wapisi hogi
          index: currentPage,
          children: page,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value){
            setState(() {
              currentPage = value;
            });
          },
          currentIndex : currentPage,
          items: const [
         BottomNavigationBarItem(icon: Icon(Icons.home , size: 32,), label: 'Home'),
         BottomNavigationBarItem(icon: Icon(Icons.shopping_cart, size : 32), label: 'Cart'),
        ],),
      ),
    );
  }
}