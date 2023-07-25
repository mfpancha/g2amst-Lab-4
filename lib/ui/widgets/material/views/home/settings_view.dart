import 'dart:ui';
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(color: AppColors.text_light),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body(){
    return Container(
      child: Column(
        children: [
          Expanded(flex: 1, child: _topSection()),
          Expanded(
            flex: 2,
            child: _profileContent(),
          ),
        ],
      ),
    );
  }

  Widget _topSection() {
    double _size = 130;
    return ListView(
      children: [
        const SizedBox(
          height: 45,
        ),
        Container(
            width: _size,
            height: _size,
            child: CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: ClipRRect(
                  child: Text(
                    "us",
                    style: TextStyle(
                      color: AppColors.text_dark,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(200),
                )))
      ],
    );
  }

  Widget _profileContent() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Colors.black.withOpacity(0.05))
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 30,bottom: 30),
            child: Row(
              children: const [
                Text("Información de la Cuenta",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.text_light,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Spacer(flex: 1),
              ],
            ),
          ),
          Expanded(
            child: _formItems(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 8, right: 8),
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushReplacementNamed("/login"),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    textStyle: TextStyle(fontSize: 16, color: Colors.white),
                    primary: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: Text("Cerrar Sesión",style: TextStyle(color: AppColors.text_dark),),
              ),
            ),
          ),
        ]),
      ),
    );
  }


  ListView _formItems() {
    return ListView(
      children: [
        FormItem(text: "email@espol.edu.ec",label: "Email", hintText: "Ingrese su email",),
        FormItem(text: "Peter Rodriguez",hintText: "Nombre", label: "Ingrese su nombre",),
        FormItem(text: "0987654321",label: "Celular", hintText: "Ingrese su celular",),
        FormItem(text: "Tarjeta de credito",label: "Metodo de pago", hintText: "Seleccione su metodo de pago",),
      ],
    );
  }
}

class FormItem extends StatelessWidget {
  final String? text;
  final String? label;
  final String? hintText;

  const FormItem({
    Key? key,
    this.text,
    this.label,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextField(
        key: ValueKey(text),
        enabled: false,
        controller: TextEditingController(text: text),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.person_rounded),
            labelText: label,
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0))),
      ),
    );
  }
}