class Item {
  String? _itemName;
  int? _stock;
  double? _sale;
  double? _price;
  String? _imageUrl;
  String? _categoryId;

  Item(
      {String? itemName,
        int? stock,
        double? sale,
        String? description,
        String? feedback,
        double? price,
        String? imageUrl}) {
    if (itemName != null) {
      this._itemName = itemName;
    }
    if (stock != null) {
      this._stock = stock;
    }
    if (sale != null) {
      this._sale = sale;
    }


    if (price != null) {
      this._price = price;
    }
    if (imageUrl != null) {
      this._imageUrl = imageUrl;
    }
    if (_categoryId!= null) {
      this._categoryId = _categoryId;
    }
  }

  String? get itemName => _itemName;
  set itemName(String? itemName) => _itemName = itemName;
  int? get stock => _stock;
  set stock(int? stock) => _stock = stock;
  double? get sale => _sale;
  set sale(double? sale) => _sale = sale;


  double? get price => _price;
  set price(double? price) => _price = price;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;

  Item.fromJson(Map<String, dynamic> json) {
    _itemName = json['itemName'];
    _stock = json['stock'];
    _sale = json['sale'];
    _price = json['price'];
    _imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemName'] = this._itemName;
    data['stock'] = this._stock;
    data['sale'] = this._sale;
    data['price'] = this._price;
    data['imageUrl'] = this._imageUrl;
    return data;
  }
}