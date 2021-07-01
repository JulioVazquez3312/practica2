import 'package:flutter/material.dart';
import 'package:practica2/settings/color_settings.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapasScreen extends StatefulWidget {
  MapasScreen({Key? key}) : super(key: key);

  @override
  _MapasScreenState createState() => _MapasScreenState();
}

class _MapasScreenState extends State<MapasScreen> {
  double estados = 32;
  late MapShapeSource _shapeSource;
  late List<MapModel> _mapData;

  @override
  void initState() {
    _mapData = _getMapData();
    _shapeSource = MapShapeSource.asset(
      'assets/mexico.json',
      shapeDataField: 'STATE_NAME',
      dataCount: _mapData.length,
      primaryValueMapper: (int index) => _mapData[index].state,
      dataLabelMapper: (int index) => _mapData[index].stateCode,
      shapeColorValueMapper: (int index) => _mapData[index].color,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApps.backPrimaryColorApp,
        title: Text('Mapa'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Text(
              'Mapa de Mexico',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
              child: SfMaps(
                layers: [
                  MapShapeLayer(
                    source: _shapeSource,
                    showDataLabels: true,
                    legend: MapLegend(MapElement.shape),
                    shapeTooltipBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(estados),
                        child: Text(
                          _mapData[index].stateCode,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                    tooltipSettings: MapTooltipSettings(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<MapModel> _getMapData() {
  return <MapModel>[
    MapModel('Zacatecas', 'Zacatecas', Colors.orange[800]!),
    MapModel('Yucatán', 'Yucatán', Colors.blue),
    MapModel('Veracruz', 'Veracruz', Colors.pink[300]!),
    MapModel('Tlaxcala', 'Tlaxcala', Colors.pink),
    MapModel('Tamaulipas', 'Tamaulipas', Colors.amber[900]!),
    MapModel('Tabasco', 'Tabasco', Colors.orange),
    MapModel('Sonora', 'Sonora', Colors.green),
    MapModel('Sinaloa', 'Sinaloa', Colors.teal),
    MapModel('San Luis Potosí', 'San Luis Potosí', Colors.green),
    MapModel('Quintana Roo', 'Quintana Roo', Colors.purple),
    MapModel('Querétaro', 'Querétaro', Colors.brown),
    MapModel('Puebla', 'Puebla', Colors.green),
    MapModel('Oaxaca', 'Oaxaca', Colors.teal),
    MapModel('Nuevo León', 'Nuevo León', Colors.orange),
    MapModel('Nayarit', 'Nayarit', Colors.orange),
    MapModel('Morelos', 'Morelos', Colors.brown),
    MapModel('Michoacán', 'Michoacán', Colors.tealAccent[400]!),
    MapModel('México', 'Estado de\nMéxico', Colors.orange),
    MapModel('Jalisco', 'Jalisco', Colors.pink),
    MapModel('Hidalgo', 'Hidalgo', Colors.purple),
    MapModel('Guerrero', 'Guerrero', Colors.purple),
    MapModel('Guanajuato', 'Guanajuato', Colors.blue),
    MapModel('Durango', 'Durango', Colors.purple),
    MapModel('Ciudad de México', 'Ciudad de México', Colors.purple),
    MapModel('Colima', 'Colima', Colors.blueGrey),
    MapModel('Coahuila', 'Coahuila', Colors.blueGrey),
    MapModel('Chihuahua', 'Chihuahua', Colors.brown),
    MapModel('Chiapas', 'Chiapas', Colors.blue),
    MapModel('Campeche', 'Campeche', Colors.blueGrey),
    MapModel('Baja California Sur', 'Baja California Sur', Colors.blueGrey),
    MapModel('Baja California', 'Baja California', Colors.pink[300]!),
    MapModel('Aguascalientes', 'Aguascalientes', Colors.teal),
  ];
}

class MapModel {
  MapModel(this.state, this.stateCode, this.color);
  String state;
  String stateCode;
  Color color;
}
