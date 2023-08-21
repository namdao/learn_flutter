import 'package:flutter/material.dart';

class Product {
  const Product({required this.name});
  final String name;
}

typedef CardItemCallback = Function(Product product, bool isChecked);

class ShoppingItem extends StatelessWidget {
  ShoppingItem(
      {required this.itemProduct,
      required this.isChecked,
      required this.onItemChanged})
      : super(key: ObjectKey(itemProduct));
  final Product itemProduct;
  final bool isChecked;
  final CardItemCallback onItemChanged;

  TextStyle? _getTextStyle() {
    if (!isChecked) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  Widget listItem() => ListTile(
        onTap: () {
          onItemChanged(itemProduct, isChecked);
        },
        leading: CircleAvatar(
          backgroundColor: Colors.blue[400],
          child: Text(
            itemProduct.name[0],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          itemProduct.name,
          style: _getTextStyle(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return listItem();
    // custom style
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Container(
    //       padding: const EdgeInsets.only(right: 12),
    //       margin: const EdgeInsets.only(bottom: 12),
    //       decoration: const BoxDecoration(color: Colors.amber),
    //       child: (CircleAvatar(
    //         backgroundColor: Colors.blue[400],
    //         child: Text(
    //           itemProduct.name[0],
    //           style: const TextStyle(color: Colors.white),
    //         ),
    //       )),
    //     ),
    //     Text(
    //       itemProduct.name,
    //       style: const TextStyle(color: Colors.green),
    //     )
    //   ],
    // );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key, required this.lsProducts});
  final List<Product> lsProducts;

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //       // padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
  //       color: Colors.grey[200],
  //       child: ListView(
  //         children: lsProducts.map((e) {
  //           return ShoppingItem(
  //             itemProduct: e,
  //             isChecked: true,
  //           );
  //         }).toList(),
  //       ));
  // }
  @override
  State<ShoppingList> createState() => _ShoppingState();
}

class _ShoppingState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleChange(Product itemProduct, bool isChecked) {
    setState(() {
      if (!isChecked) {
        _shoppingCart.add(itemProduct);
      } else {
        _shoppingCart.remove(itemProduct);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('shopping list'),
      ),
      body: Container(
          color: Colors.grey[200],
          child: ListView(
            children: widget.lsProducts.map((e) {
              return ShoppingItem(
                itemProduct: e,
                isChecked: _shoppingCart.contains(e),
                onItemChanged: _handleChange,
              );
            }).toList(),
          )),
    );
  }
}

void main() {
  runApp(const MaterialApp(
      title: 'Shopping list',
      home: ShoppingList(lsProducts: [
        Product(name: 'aas'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
      ])));
}
