class ProductModel {
  List<String>? images;
  // List<Subcategory>? subcategory;
  // num? ratingsQuantity;
  // String? sId;
  // String? title;
  // String? slug;
  // String? description;
  // num? quantity;
  // num? price;
  // String? imageCover;
  // Category? category;
  // Category? brand;
  // num? ratingsAverage;
  // String? createdAt;
  // String? updatedAt;
  // String? id;

  ProductModel(
      {
        this.images,
        // this.subcategory,
        // this.ratingsQuantity,
        // this.sId,
        // this.title,
        // this.slug,
        // this.description,
        // this.quantity,
        // this.price,
        // this.imageCover,
        // this.category,
        // this.brand,
        // this.ratingsAverage,
        // this.createdAt,
        // this.updatedAt,
        // this.id
      });

  ProductModel.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
    // if (json['subcategory'] != null) {
    //   subcategory = <Subcategory>[];
    //   json['subcategory'].forEach((v) {
    //     subcategory!.add(Subcategory.fromJson(v));
    //   });
    // }
    // ratingsQuantity = json['ratingsQuantity'];
    // sId = json['_id'];
    // title = json['title'];
    // slug = json['slug'];
    // description = json['description'];
    // quantity = json['quantity'];
    // price = json['price'];
    // imageCover = json['imageCover'];
    // // category = json['category'] != null
    // //     ? Category.fromJson(json['category'])
    // //     : null;
    // // brand = json['brand'] != null ? Category.fromJson(json['brand']) : null;
    // ratingsAverage = json['ratingsAverage'];
    // createdAt = json['createdAt'];
    // updatedAt = json['updatedAt'];
    // id = json['id'];
  }


}
//
// class Subcategory {
//   String? sId;
//   String? name;
//   String? slug;
//   String? category;
//
//   Subcategory({this.sId, this.name, this.slug, this.category});
//
//   Subcategory.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     category = json['category'];
//   }
//
//
// }
//
// class Category {
//   String? sId;
//   String? name;
//   String? slug;
//   String? image;
//
//   Category({this.sId, this.name, this.slug, this.image});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     image = json['image'];
//   }
//
//
// }