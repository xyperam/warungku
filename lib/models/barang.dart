class Barang {
  int _id;
  String _namaBarang;
  String _stock;

  //constructor
  Barang(this._namaBarang, this._stock);

  //konversi dari map
  Barang.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._namaBarang = map['namaBarang'];
    this._stock = map['stock'];
  }

  //getter
  int get id => _id;
  String get namaBarang => _namaBarang;
  String get stock => _stock;

  //setter
  set namaBarang(String value) {
    _namaBarang = value;
  }

  set stock(String value) {
    _stock = value;
  }

  //konversi dari Barang ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['namaBarang'] = namaBarang;
    map['stock'] = stock;
    return map;
  }
}
