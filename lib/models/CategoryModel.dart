class CategoryModel {
  String? _catName;


  CategoryModel({String? catName, int? itemNo}) {
    if (catName != null) {
      this._catName = catName;
    }

  }

  String? get catName => _catName;
  set catName(String? catName) => _catName = catName;



  CategoryModel.fromJson(Map<String, dynamic> json) {
    _catName = json['catName'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catName'] = this._catName;

    return data;
  }
}