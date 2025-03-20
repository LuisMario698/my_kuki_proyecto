import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class InformacionPersonal extends StatefulWidget {
  const InformacionPersonal({Key? key}) : super(key: key);

  @override
  _InformacionPersonalState createState() => _InformacionPersonalState();
}

class _InformacionPersonalState extends State<InformacionPersonal> {
  String? selectedSector; // Inicializado como null por defecto
  String? selectedFile; // Inicializado como null por defecto
  File? profileImage; // Archivo para la foto de perfil

  Future<void> _pickProfileImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      setState(() {
        profileImage = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Información Personal22')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickProfileImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        profileImage != null
                            ? FileImage(profileImage!)
                            : AssetImage('assets/images/perfil1.jpeg')
                                as ImageProvider,
                    child:
                        profileImage == null
                            ? Icon(
                              Icons.camera_alt,
                              size: 30,
                              color: Colors.white,
                            )
                            : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('NOMBRE COMPLETO'),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              Text('DIRECCION'),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              Text('TELEFONO'),
              SizedBox(height: 5),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              Text('FECHA DE NACIMIENTO'),
              SizedBox(height: 5),
              TextField(
                keyboardType: TextInputType.datetime,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    final text = newValue.text;
                    String formatted = text;
                    if (text.length >= 2) {
                      formatted =
                          text.substring(0, 2) + '/' + text.substring(2);
                    }
                    if (text.length >= 4) {
                      formatted =
                          formatted.substring(0, 5) + '/' + text.substring(4);
                    }
                    if (text.length > 10) {
                      formatted = formatted.substring(0, 10);
                    }
                    return TextEditingValue(
                      text: formatted,
                      selection: TextSelection.collapsed(
                        offset: formatted.length,
                      ),
                    );
                  }),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'DD/MM/AAAA',
                ),
              ),
              SizedBox(height: 10),
              Text('SECTOR'),
              SizedBox(height: 5),
              DropdownButtonFormField<String>(
                value: selectedSector,
                items:
                    ['GANADERO', 'PESQUERO', 'CONTRUCCION', 'AGRICULTURA']
                        .map(
                          (sector) => DropdownMenuItem(
                            value: sector,
                            child: Text(sector),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSector = value;
                  });
                },
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),

              SizedBox(height: 10),
              Text('TIPO DE USUARIO'),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedSector,
                items:
                    ['COMPRADOR', 'VENDEDOR']
                        .map(
                          (sector) => DropdownMenuItem(
                            value: sector,
                            child: Text(sector),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSector = value;
                  });
                },
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),

              SizedBox(height: 10),
              Text('EMPRESA'),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              Text('CERTIFICACION'),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedFile ?? 'Ningún archivo seleccionado',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();
                      if (result != null) {
                        setState(() {
                          selectedFile = result.files.single.name;
                        });
                      }
                    },
                    child: Text('Subir Archivo'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica para guardar la información personal
                  },
                  child: Text('Guardar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
