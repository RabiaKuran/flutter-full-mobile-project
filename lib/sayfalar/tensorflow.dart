//yukle.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donemuygulamam/servisler/yetkilendirmeservisi.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class tensorflow extends StatefulWidget {
  tensorflow({Key? key}) : super(key: key);

  @override
  State<tensorflow> createState() => _tensorflowState();
}

var deger = "";
var gelenYaziBasligi = "";
var gelenYaziIcerigi = "";

class _tensorflowState extends State<tensorflow> {
  @override
  List? _outputs;
  File? _image;
  bool _loading = false;

  @override
  void initState() {
    //initstate widget ilk olusturuldugunda calıstırılır. Bir kez çalışır.
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    //eğittiğim makinemin dosyalarını varlıklar dosyamdan çektim.
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite", //modellerim
      labels: "assets/labels.txt", //modellerimin başlıkları
      numThreads: 1,
    );
  }

  classifyImage(File image) async {
    //Model aracılığıyla görüntünün sınıflandırılması için metot oluşturdum
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0, //goruntuyu ortalama
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    setState(() {
      _loading = false;
      _outputs = output!;
    });
    kontrol();
  }

  void dispose() {
    Tflite.close();
    super.dispose();
  }

  pickImage() async {
    //galerideki resimleri çekmek ve algılamak için çalışan metot
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    classifyImage(
        _image!); //fotoğrafın durumunu kategorisini anlamak için modelin özelliklerinin bulunduğu metota yolladım.
  }

  clickImage() async {
    //kameradan çekilen resimleri almak ve algılamak için çalışan metot
    var image = await ImagePicker().getImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    classifyImage(_image!);
  }

  kontrol() {
    if (_outputs != null) {
      if (_outputs![0]["label"] == 'Sad') {
        deger = "yazi1";
        yaziGetir(deger);
      } else if (_outputs![0]["label"] == 'Happy') {
        deger = "yazi2";
        yaziGetir(deger);
      } else if (_outputs![0]["label"] == 'Worried') {
        deger = "yazi3";
        yaziGetir(deger);
      } else if (_outputs![0]["label"] == 'Surprised') {
        deger = "yazi4";
        yaziGetir(deger);
      } else if (_outputs![0]["label"] == 'Disgust') {
        deger = "yazi5";
        yaziGetir(deger);
      } else if (_outputs![0]["label"] == 'Angry') {
        deger = "yazi6";
        yaziGetir(deger);
      } else if (_outputs![0]["label"] == 'Scared') {
        deger = "yazi7";
        yaziGetir(deger);
      }
    }
  }

  yaziGetir(var deger) {
    Firestore.instance
        .collection("Yazilar")
        .document(deger)
        .get()
        .then((gelenVeri) {
      setState(() {
        //yeni yazilari paylaşacağım için yeni durumları eklemem lazım
        gelenYaziBasligi = gelenVeri.data['baslik'];
        gelenYaziIcerigi = gelenVeri.data['icerik'];
        Text(gelenYaziBasligi);
        Text(gelenYaziIcerigi);
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.yellow[400], //arkaplan rengi
        elevation: 1.0,
        title: Text(
          //başlık kısmım
          "PSYCHOLOGY DETECTOR",
          style: TextStyle(
            fontSize: 17.0,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(children: [
        //kaydırılabilir arayüz ekledim. Çünkü kameradan resim eklendğinde ekran içinde kapladığı alan çok
        //büyük olduğu için sığmıyordu.
        Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _loading
                  ? Container(
                      height: 300,
                      width: 300,
                    )
                  : Container(
                      margin: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _image == null ? Container() : Image.file(_image!),
                          SizedBox(
                            height: 20,
                          ),
                          _image == null
                              ? Container()
                              : _outputs != null
                                  ? Text(
                                      _outputs![0]["label"],
                                      //sonucu modelin hangi sınıfın içerisindeyse onun sonucunu ekrana basıyor.
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    )
                                  : Container(child: Text("")),
                        ],
                      ),
                    ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      //galeriden fotoğraf eklemek için aktifleştirdiğim buton.
                      tooltip: 'PickImage',
                      onPressed: pickImage,
                      child: Icon(
                        Icons.add_a_photo,
                        size: 20,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.amber,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      //kullanıcının anlık olarak fotoğraf ekleyebilmesi için aktifleştirdiğim buton.
                      tooltip: 'ClickImage',
                      onPressed: clickImage,
                      child: Icon(
                        Icons.camera,
                        size: 20,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.amber,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            child: Text(
              gelenYaziBasligi,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            child: Text(
              gelenYaziIcerigi,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
