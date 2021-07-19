import 'package:flutter/material.dart';
import 'package:warungku/models/barang.dart';

class EntryForm extends StatefulWidget {
  final Barang barang;
  EntryForm(this.barang);
  @override
  EntryFormState createState() => EntryFormState(this.barang);
}

//class controller
class EntryFormState extends State<EntryForm> {
  Barang barang;
  EntryFormState(this.barang);
  TextEditingController namaBarangController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //kondisi
    if (barang != null) {
      namaBarangController.text = barang.namaBarang;
      stockController.text = barang.stock;
    }
    //form update
    return Scaffold(
        appBar: AppBar(
          title: barang == null ? Text('Tambah') : Text('Update'),
          leading: Icon(Icons.keyboard_arrow_left),
          backgroundColor: Color(0xFF4150A8),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // nama
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: namaBarangController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Masukan Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // form stock
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: stockController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Stock',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // button save
                    Expanded(
                      child: RaisedButton(
                        color: Color(0xFF4150A8),
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (barang == null) {
                            // tambah data
                            barang = Barang(namaBarangController.text,
                                stockController.text);
                          } else {
                            // ubah data
                            barang.namaBarang = namaBarangController.text;
                            barang.stock = stockController.text;
                          }
                          Navigator.pop(context, barang);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Colors.red,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
