class CategoryModel {
  // Data? data;
  List<Data2>? data;

  CategoryModel({this.data});
  CategoryModel.fromJson( json) {
    if (json['data'] != null) {
      data = <Data2>[];
      json['data'].forEach((v) {
        data!.add(Data2.fromJson(v));
      });
    }
  }
  // CategoryModel.fromJson(json) {
  //   data = json['data'] != null ? Data.fromJson(json['data']) : null;
  // }
}

// class Data {
//   List<Data2>? data;
//
//   Data({
//     this.data,
//   });
//
//   Data.fromJson( json) {
//     if (json['data'] != null) {
//       data = <Data2>[];
//       json['data'].forEach((v) {
//         data!.add(Data2.fromJson(v));
//       });
//     }
//   }
// }

class Data2 {
  String? name;
  String? image;
  num? id;
  Data2({ this.name, this.image,this.id});

  Data2.fromJson( json) {
    name = json['name'];
    image = json['image'];
    id = json['id'];
  }
}
