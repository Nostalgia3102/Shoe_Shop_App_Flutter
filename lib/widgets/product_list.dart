import 'package:flutter/material.dart';
import 'package:shop_app_flutter/utils/glovbal_variables.dart';
import 'package:shop_app_flutter/widgets/poduct_cart.dart';
import 'package:shop_app_flutter/pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters  = const ["All", "Adidas", "Nike", "Bata"];
  late String selectedFilter;
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Shoes\nCollection",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize : 35
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                )
              ]
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index){
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0
                  ),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter ? Theme.of(context).colorScheme.primary : const Color.fromRGBO(245, 247, 249, 1),
                      label: Text(filter),
                      labelStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1)
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index)
                {   final product = products[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return ProductDetailsPage(product: product);
                    }));
                  },
                  child: ProductCard(
                    title: product["title"] as String,
                    price: product["price"] as double,
                    image: product['imageUrl'] as String,
                    backGroundColor: index.isEven ? const Color.fromRGBO(216, 240, 253, 1) : const Color.fromRGBO(245, 247, 249, 1),
                  ),
                );
                }),
          )
        ],
      ),
    );
  }
}
