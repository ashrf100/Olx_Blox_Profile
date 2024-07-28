import 'package:olx_bloc/features/cart/domain/entities/cart.dart';

class CartModel {
  List<CartItemModel> carts;
  int total;
  int skip;
  int limit;

  CartModel({
    required this.carts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      carts: (json['carts'] as List)
          .map((i) => CartItemModel.fromJson(i))
          .toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'carts': carts.map((i) => i.toJson()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }

  List<Cart> toDomain() {
    return carts.map((item) => item.toDomain()).toList();
  }
}

class CartItemModel {
  int id;
  List<CartProductModel> products;
  double total;
  double discountedTotal;
  int userId;
  int totalProducts;
  int totalQuantity;

  CartItemModel({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      products: (json['products'] as List)
          .map((i) => CartProductModel.fromJson(i))
          .toList(),
      total: json['total'],
      discountedTotal: json['discountedTotal'],
      userId: json['userId'],
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'products': products.map((i) => i.toJson()).toList(),
      'total': total,
      'discountedTotal': discountedTotal,
      'userId': userId,
      'totalProducts': totalProducts,
      'totalQuantity': totalQuantity,
    };
  }

  Cart toDomain() {
    return Cart(
      id: id,
      products: products.map((item) => item.toDomain()).toList(),
      total: total.toInt(),
      discountedTotal: discountedTotal.toInt(),
      userId: userId,
      totalProducts: totalProducts,
      totalQuantity: totalQuantity,
    );
  }
}

class CartProductModel {
  int id;
  String title;
  double price;
  int quantity;
  double total;
  double discountPercentage;
  double discountedTotal;
  String thumbnail;

  CartProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      total: json['total'],
      discountPercentage: json['discountPercentage'],
      discountedTotal: json['discountedTotal'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity,
      'total': total,
      'discountPercentage': discountPercentage,
      'discountedTotal': discountedTotal,
      'thumbnail': thumbnail,
    };
  }

  CartProduct toDomain() {
    return CartProduct(
      id: id,
      title: title,
      price: price.toInt(),
      quantity: quantity,
      total: total.toInt(),
      discountPercentage: discountPercentage,
      discountedPrice: discountedTotal.toInt(),
    );
  }
}
