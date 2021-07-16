import 'package:flutter/material.dart';
import 'package:warungku/views/Menu.dart';
import 'package:warungku/views/form.dart';
import 'package:warungku/models/barang.dart';
import 'package:warungku/helper/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
//untuk memanggil fungsi yg terdapat di daftar pustaka sqflite
import 'dart:async';

//pendukung program asinkron
class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Barang> listbarang;
  @override
  Widget build(BuildContext context) {
    if (listbarang == null) {
      listbarang = List<Barang>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Warungku'),
      ),
      // body: Menu(),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        onPressed: () async {
          var barang = await navigateToEntryForm(context, null);
          if (barang != null) addBarang(barang);
        },
      ),
    );
  }

  Future<Barang> navigateToEntryForm(
      BuildContext context, Barang barang) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(barang);
    }));
    return result;
  }

// Button To Form
  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
// Mebuat Component untuk item Barang dan Stock 
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            title: Text(
              this.listbarang[index].namaBarang,
              style: textStyle,
            ),
            subtitle: Text(this.listbarang[index].stock),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                deleteBarang(listbarang[index]);
              },
            ),
            onTap: () async {
              var contact =
                  await navigateToEntryForm(context, this.listbarang[index]);
              if (contact != null) editBarang(contact);
            },
          ),
        );
// Component END
      },
    );

// SingleChildScrollView dataTable(List<Barang>listbarang){
//   return SingleChildScrollView(
//     scrollDirection: Axis.vertical,
//     child: DataTable(columns: [
//       DataColumn(label: Text('Nama Barang')),
//       DataColumn(label: Text('Stock')),
//       DataColumn(label: Text('Delete')),
//     ],
//     rows: listbarang
//     .map(
//       (barang)=>DataRow(cells: [
//         DataCell(
//           Text( this.listbarang[index].namaBarang)
//         ),
//                DataCell(
//           Text( this.listbarang[index].stock)
//         ),
//       ])
//     )
//     ,
//     ),
//   )
// }
  }

// Button To Form END


// LOGIC START

  //buat barang
  void addBarang(Barang object) async {
    int result = await dbHelper.insert(object);
    if (result > 0) {
      updateListView();
    }
  }

  //edit barang
  void editBarang(Barang object) async {
    int result = await dbHelper.update(object);
    if (result > 0) {
      updateListView();
    }
  }

  //delete barang
  void deleteBarang(Barang object) async {
    int result = await dbHelper.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  //update barang
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Barang>> listbarangFuture = dbHelper.getBarang();
      listbarangFuture.then((listbarang) {
        setState(() {
          this.listbarang = listbarang;
          this.count = listbarang.length;
        });
      });
    });
  }

// LOGIC END
}
