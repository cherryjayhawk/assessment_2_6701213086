import 'package:flutter/material.dart';
import 'package:assessment_2_6701213086/secondpage.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: MyForm(),
    ),
  ));
}

class MyForm extends StatefulWidget{
  const MyForm({super.key});

  @override
  MyFormState createState(){
    return MyFormState();
  }
}

class MyFormState extends State<MyForm>{
  final _formKey = GlobalKey<FormState>();

  bool dalamKota = false;
  bool retur = false;

  @override
  Widget build(BuildContext context) {

    final namaBarangController  = TextEditingController();
    final deskripsiController = TextEditingController();
    final hargaController = TextEditingController();

    String kondisi = "Bekas";
 

    return Form(
      key: _formKey,
      child:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            NamaBarang(namaBarangController: namaBarangController),
            Deskripsi(deskripsiController: deskripsiController),
            Harga(hargaController: hargaController),
            const KondisiBarang(),
            Container(
              child: Column(
                children: [
                  RadioListTile(
                      title: Text("Bekas"),
                      value: "bekas", 
                      groupValue: kondisi, 
                      onChanged: (value){
                        setState(() {
                          kondisi = value.toString();
                        });
                      },
                  ),
                  RadioListTile(
                      title: Text("Baru"),
                      value: "baru", 
                      groupValue: kondisi, 
                      onChanged: (value){
                        setState(() {
                          kondisi = value.toString();
                        });
                      },
                  ),
                ],
              ),
            ),
            SwitchContainer(dalamKota: dalamKota, retur: retur),
            ButtonPublikasikan(
              namaBarangController: namaBarangController,
              deskripsiController: deskripsiController,
              hargaController: hargaController,
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchContainer extends StatelessWidget {
  SwitchContainer({
    super.key,
    required this.dalamKota,
    required this.retur,
  });

   bool dalamKota = false;
   bool retur = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pengiriman dalam kota saja"),
                Switch(
                  value: dalamKota, 
                  onChanged: (value) {
                    // setState(() {
                    //   dalamKota = value;
                    // });
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Menerima retur"),
                Switch(
                  value: retur, 
                  onChanged: (value) {
                  //
                  },
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}

class KondisiBarang extends StatelessWidget {
  const KondisiBarang({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: const Text("Kondisi Barang"));
  }
}

class ButtonPublikasikan extends StatelessWidget {
  const ButtonPublikasikan({
    super.key,
    required this.namaBarangController,
    required this.deskripsiController,
    required this.hargaController,
  });

  final TextEditingController namaBarangController;
  final TextEditingController deskripsiController;
  final TextEditingController hargaController;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
        child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
            ),
            onPressed: (){
              List<String> formData = [];

              String namaBarang = namaBarangController.text;
              String deskripsi = deskripsiController.text;
              String harga = deskripsiController.text;
              // String kirim2 = deskripsiController.text;
              // String kirim2 = deskripsiController.text;

              formData.add(namaBarang);
              formData.add(deskripsi);
              formData.add(harga);



              /*AlertDialog alert = AlertDialog(
                title: Text("Coba get data"),
                content: Text(kirim1+" - "+kirim2),
              );

              showDialog(context: context,
                  builder:(BuildContext context){
                    return alert;
                  }
              );*/

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondPage(formData)
                  )
              );

              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const SecondPage()
              //     )
              // );
            },
            child: const Text("PUBLIKASIKAN")
        )
    );
  }
}

class Deskripsi extends StatelessWidget {
  const Deskripsi({
    super.key,
    required this.deskripsiController,
  });

  final TextEditingController deskripsiController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            // textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.top,
            maxLines: 4,
            style: TextStyle(fontSize: 14),
            decoration: new InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: Colors.grey
                )
              ),
              labelText: 'Deskripsi',
            ),
            controller: deskripsiController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
              },
          ),
        ],
      )
    );
  }
}

class NamaBarang extends StatelessWidget {
  const NamaBarang({
    super.key,
    required this.namaBarangController,
  });

  final TextEditingController namaBarangController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        style: TextStyle(fontSize: 14),
        decoration: new InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: Colors.grey
                )
            ),
          labelText: 'Nama barang',
        ),
        controller: namaBarangController,
        validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
      ),
    );
  }
}


class Harga extends StatelessWidget {
  const Harga({
    super.key,
    required this.hargaController,
  });

  final TextEditingController hargaController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        style: TextStyle(fontSize: 14),
        decoration: new InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: Colors.grey
                )
            ),
          labelText: 'Harga',
        ),
        controller: hargaController,
        validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
      ),
    );
  }
}