import 'package:flutter/material.dart';
import 'package:practica2/settings/color_settings.dart';
import 'dart:io';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApps.backPrimaryColorApp,
      appBar: AppBar(
        backgroundColor: ColorApps.secondaryColorApp,
        title: Text('Topicos Avanzados :)'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://chingizpro.uz/img/person.png'),
                ),
                accountName: Text(
                  'Julio',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  'julio@vazquez.com',
                  style: TextStyle(color: Colors.black),
                )),
            ListTile(
              tileColor: ColorApps.backPrimaryColorApp,
              leading: Icon(Icons.thermostat, color: Colors.white),
              title: Text('Conversor °C - °F',
                  style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.chevron_right, color: Colors.white),
              onTap: () {
                Navigator.pushNamed(context, '/conversor');
              },
            ),
            ListTile(
              tileColor: ColorApps.backPrimaryColorApp,
              leading: Icon(Icons.phone, color: Colors.white),
              title: Text('Intenciones', style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.chevron_right, color: Colors.white),
              onTap: () {
                Navigator.pushNamed(context, '/intenciones');
              },
            ),
            ListTile(
              tileColor: ColorApps.backPrimaryColorApp,
              leading: Icon(
                Icons.web,
                color: Colors.white,
              ),
              title: Text('API REST', style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.chevron_right, color: Colors.white),
              onTap: () {
                Navigator.pushNamed(context, '/populares');
              },
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              tileColor: ColorApps.backPrimaryColorApp,
              leading: Icon(Icons.exit_to_app, color: Colors.white),
              title: Text('Salir', style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.chevron_right, color: Colors.white),
              onTap: () => exit(0),
            ),
          ],
        ),
      ),
    );
  }
}
