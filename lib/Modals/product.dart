class Product {
  int? id;
  int? categoryId;
  String? productName;
  String? quantityPerUnit;
  double? unitPrice;
  int? unitsInStock;

  Product(this.id, this.categoryId, this.productName, this.quantityPerUnit,
      this.unitPrice, this.unitsInStock);

  Product.fromJson(Map json) {
    id = int.parse(json["id"].toString());
    categoryId = int.parse(json["categoryId"].toString());
    productName = json["productName"];
    quantityPerUnit = json["quantityPerUnit"];
    unitPrice = double.parse(json["unitPrice"].toString()) ;
    unitsInStock = int.parse(json["unitsInStock"].toString());
  }

  Map toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "productName": productName,
      "quantityPerUnit": quantityPerUnit,
      "unitPrice": unitPrice,
      "unitsInStock": unitsInStock,
    };
  }
}
