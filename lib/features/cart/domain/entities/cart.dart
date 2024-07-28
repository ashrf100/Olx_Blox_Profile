class Cart {
  int id;
  List<CartProduct> products;
  int total;
  int discountedTotal;
  int userId;
  int totalProducts;
  int totalQuantity;

  Cart(
      {required this.id,
      required this.products,
      required this.total,
      required this.discountedTotal,
      required this.userId,
      required this.totalProducts,
      required this.totalQuantity});
}

class CartProduct {
  int id;
  String title;
  int price;
  int quantity;
  int total;
  double discountPercentage;
  int discountedPrice;

  CartProduct(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity,
      required this.total,
      required this.discountPercentage,
      required this.discountedPrice});
}
