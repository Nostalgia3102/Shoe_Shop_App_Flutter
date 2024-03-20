import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';
import 'package:shop_app_flutter/utils/glovbal_variables.dart';

class ProductDetailsPage extends StatefulWidget {

  final Map<String, Object> product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;

  void onTap(){
    if(selectedSize!=0){
      Provider.of<CartProvider>(context, listen: false).addProduct(
          {
            'id': widget.product['id'],
            'title': widget.product['title'],
            'price': widget.product['price'],
            'imageUrl': widget.product['imageUrl'],
            'company': widget.product['company'],
            'sizes': selectedSize,
          },
    );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Product added successfully")));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please select a size")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.product['title'] as String,
          style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize : 35
      ),),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(widget.product['imageUrl'] as String, height: 322,),
          ),
          const Spacer(flex: 2,),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('\$${widget.product['price']}', style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize : 35
            ),),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: (widget.product["sizes"] as List<int>).length,
                      itemBuilder: (context, index){
                        final size = (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                              label: Text(size.toString()),
                              backgroundColor: selectedSize == size ? Theme.of(context).colorScheme.primary : null ,
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                    onPressed: (){
                      onTap();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text("Add to Cart", style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ))
                ),
              )
              ],
            ),
          )
        ],
      ),
    );
  }
}
