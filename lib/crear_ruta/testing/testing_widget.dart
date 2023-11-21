import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestingWidget extends StatefulWidget {
  const TestingWidget({Key? key}) : super(key: key);

  @override
  _TestingWidgetState createState() => _TestingWidgetState();
}

class _TestingWidgetState extends State<TestingWidget> {
  TextEditingController _textController = TextEditingController();
  List<String> _savedAddresses = [];
  bool _loading = false;
  List<String> _resultAddresses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing Widget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Ingrese la dirección (dirección y comuna)',
                hintText: 'Type here...',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _savedAddresses.add(_textController.text);
                  _textController.clear();
                });
              },
              child: Text('Guardar dirección'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Direcciones guardadas:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _savedAddresses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_savedAddresses[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Visibility(
              visible: !_loading,
              child: ElevatedButton(
                onPressed: () {
                  _fetchAndDisplayData(_savedAddresses);
                },
                child: Text('Finish'),
              ),
            ),
            SizedBox(height: 16.0),
            if (_loading) CircularProgressIndicator(),
            if (_resultAddresses.isNotEmpty)
              Text(
                'Direcciones obtenidas:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (_resultAddresses.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _resultAddresses.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_resultAddresses[index]),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Construir la URL con las entradas
  String _buildUrl(List<String> addresses) {
    String url = 'http://127.0.0.1:5000/api?';
    for (String entry in addresses) {
      url += 'Query=${Uri.encodeComponent(entry)}&';
    }
    return url.substring(0, url.length - 1); // Eliminar el último '&'
  }

  // Realizar la solicitud HTTP y mostrar los resultados
  Future<void> _fetchAndDisplayData(List<String> addresses) async {
    setState(() {
      _loading = true;
      _resultAddresses.clear(); // Limpiar las direcciones anteriores
    });

    final url = _buildUrl(addresses);

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        final direcciones = decoded['Direcciones'] as List;

        // Muestra los datos en orden
        for (var data in direcciones) {
          final direccion = data['Direccion'];
          print('Dirección: $direccion');
          setState(() {
            _resultAddresses.add(direccion);
          });
        }
      } else {
        print('Error en la solicitud HTTP: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al realizar la solicitud HTTP: $e');
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: TestingWidget(),
  ));
}

