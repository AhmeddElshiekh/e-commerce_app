class CartModel {
  bool? status;
  DataCart? data;

  CartModel({this.status, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? DataCart.fromJson(json['data']) : null;
  }

}

class DataCart {
  List<CartItems>? cartItems;
  num? subTotal;
  num? total;

  DataCart({this.cartItems, this.subTotal, this.total});

  DataCart.fromJson(Map<String, dynamic> json) {
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(CartItems.fromJson(v));
      });
    }
    subTotal = json['sub_total'];
    total = json['total'];
  }

}

class CartItems {
  num? id;
  num? quantity;
  ProductCart? product;

  CartItems({this.id, this.quantity, this.product});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
    json['product'] != null ? ProductCart.fromJson(json['product']) : null;
  }


}

class ProductCart {
  num? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  ProductCart(
      {this.id,
        this.price,
        this.oldPrice,
        this.discount,
        this.image,
        this.name,
        this.description,
        this.images,
        this.inFavorites,
        this.inCart});

  ProductCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

}