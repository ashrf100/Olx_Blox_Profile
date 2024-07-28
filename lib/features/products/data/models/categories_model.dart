class CategoriesModel {
  List<String>? categories;

  CategoriesModel({this.categories});

  factory CategoriesModel.fromJson(List<dynamic> json) {
    return CategoriesModel(
      categories: List<String>.from(json),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categories': categories,
    };
  }
}
