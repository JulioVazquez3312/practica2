import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practica2/settings/color_settings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';

class IntencionesScreen extends StatelessWidget {
  const IntencionesScreen({Key? key}) : super(key: key);

  @override
  // final image = ImagePicker();
  // String pathImage;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApps.backPrimaryColorApp,
        title: Text('Intenciones'),
      ),
      body: ListView(
        children: [
          // Abrit una pagina web/ Llamada telefonica/ Enviar un Email / Mandar SMS / Tomar Foto
          Card(
            margin: EdgeInsets.all(20.0),
            elevation: 10.0,
            child: ListTile(
              title: Text('Abrir pagina Web',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Row(
                children: [Text('www.itcelaya.edu.mx'), Icon(Icons.touch_app)],
              ),
              leading: Container(
                height: 38,
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.language),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.black))),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                _OpendURL();
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(20.0),
            elevation: 10.0,
            child: ListTile(
              title: Text('Llamada telefonica',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Row(
                children: [Text('4121001334'), Icon(Icons.touch_app)],
              ),
              leading: Container(
                height: 38,
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.phone),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.black))),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                _MakeCallPhone();
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(20.0),
            elevation: 10.0,
            child: ListTile(
              title: Text('Enviar SMS',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Row(
                children: [Text('4121001334'), Icon(Icons.touch_app)],
              ),
              leading: Container(
                height: 38,
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.message),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.black))),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                _SendSMS();
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(20.0),
            elevation: 10.0,
            child: ListTile(
              title: Text('Enviar Email',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Row(
                children: [Text('julio@va.com'), Icon(Icons.touch_app)],
              ),
              leading: Container(
                height: 38,
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.email),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.black))),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                _SendEMAIL();
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(20.0),
            elevation: 10.0,
            child: ListTile(
              title: Text('Tomar Fotografia',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Row(
                children: [Text('Sonrie'), Icon(Icons.touch_app)],
              ),
              leading: Container(
                height: 38,
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.camera),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.black))),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () => _OpenCamera(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _OpendURL() async {
    const url = 'http://www.itcelaya.edu.mx/';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  Future<void> _MakeCallPhone() async {
    const tel = 'tel:4612279093';
    if (await canLaunch(tel)) {
      await launch(tel);
    }
  }

  Future<void> _SendSMS() async {
    const tel = 'sms:4121001334';
    if (await canLaunch(tel)) {
      await launch(tel);
    }
  }

  Future<void> _SendEMAIL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: '19030145@gmail.com',
      query: 'subject=Hola mundo&body=Hola, buen dia :)',
    );

    var email = params.toString();
    if (await canLaunch(email)) {
      await launch(email);
    }
  }

  Future<void> _OpenCamera() async {
    /*final foto = image.getImage(source: ImageSource.camera);
    pathImage = foto.path;*/
  }
}
