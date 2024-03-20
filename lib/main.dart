import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pets da mulamba'),
        ),
        body: PetForm(),
      ),
    );
  }
}

class PetForm extends StatefulWidget {
  @override
  _PetFormState createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  TextEditingController _petNameController = TextEditingController();
  String _enteredPetName = '';

  void _clearPetName() {
    setState(() {
      _enteredPetName = '';
      _petNameController.clear();
    });
  }

  void _submitForm() {
    setState(() {
      _enteredPetName = _petNameController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Cadastre o seu Pet:',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome do Pet:',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 10.0),

                    Container(

                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      width: 250,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: TextField(
                        controller: _petNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.0),
              Container(
                width: 150, // Defina a largura desejada
                height: 150, // Defina a altura desejada
                child: Image(
                  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
              )

            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _clearPetName,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1),
                  ),
                  backgroundColor: Colors.blue,
                ),
                child: Text('LIMPAR', style: TextStyle(color: Colors.white),),
              ),
              ElevatedButton(
                onPressed: () {
                  _submitForm();
                  _showEnteredPetName(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1),
                  ),
                  backgroundColor: Colors.blue,
                ),
                child: Text('CADASTRAR', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          _enteredPetName.isNotEmpty
              ? Text(
            'Pet cadastrado: $_enteredPetName',
            style: TextStyle(fontSize: 16.0),
          )
              : Container(),
        ],
      ),
    );
  }

  void _showEnteredPetName(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pet cadastrado'),
          content: Text('Pet cadastrado: $_enteredPetName'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}