import 'package:flutter/material.dart';

import '../Modals/product.dart';

class ProductListRowWidget extends StatelessWidget{
  Product product;
  ProductListRowWidget(this.product);
  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: [
            Container(
              child: Image.network("https://cdn.pixabay.com/photo/2022/08/17/08/58/sun-has-7391959_960_720.jpg"),
              height: 130.0,
              width: MediaQuery.of(context).size.width/2,
            ),
            Text(product.productName.toString()),
            Text(product.unitPrice.toString(),style: TextStyle(fontSize: 18,color: Colors.grey),),
          ],
        ),
      ),
    );
  }
  
}