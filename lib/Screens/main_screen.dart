import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_demo/Data/Api/category_api.dart';
import 'package:http_demo/Data/Api/product_api.dart';
import 'package:http_demo/Modals/category.dart';

import '../Modals/product.dart';
import '../Widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category> categories = <Category>[];
  List<Widget> categoryWidget = <Widget>[];
  List<Product> products=<Product>[];
  @override
  void initState() {
    getCategoriesFromApi();
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alışveriş sistemi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidget,
              ),

            ),
             ProductListWidget(products)
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.categories =
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (var i = 0; i < categories.length; ++i) {
      categoryWidget.add(getCategoryWidget(categories[i]));
    }
    return categoryWidget;
  }

  Widget getCategoryWidget(Category category) {
    return ElevatedButton(
      onPressed: () {
        print(category.categoryName.toString());
        getProductsByCategoryId(category);
      },
      child: Text(
        category.categoryName.toString(),
        style: TextStyle(color: Colors.blueGrey),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.lightGreenAccent),
        )),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return Colors.white;
          },
        ),
      ),
    );
  }

  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id!).then((value)  {
      setState(() {
        Iterable list=json.decode(value.body);
        this.products=list.map((product)=>Product.fromJson(product)).toList();
      });
    });
  }
  void getProducts() {
    ProductApi.getProducts().then((value)  {
      setState(() {
        Iterable list=json.decode(value.body);
        this.products=list.map((product)=>Product.fromJson(product)).toList();
      });
    });
  }
}
