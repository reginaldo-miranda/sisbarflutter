import 'package:flutter/material.dart'; 

class AppForm extends StatefulWidget { 
  // Necessário para validações de formulário
   GlobalKey<FormState> formKey = GlobalKey<FormState>(); 

  // Manipula o texto onchange
   TextEditingController nameController; 
  TextEditingController ageController; 

  AppForm({this.formKey, this.nameController, this.ageController}); 

  @override 
  _AppFormState createState() => _AppFormState(); 
} 

class _AppFormState extends State<AppForm> { 
  String _validateName(String value) { 
    if (value.length < 3) return 'O nome deve ter mais de 2 caracteres'; 
    retornar nulo; 
  } 

  String _validateAge(Valor da string) {
    Padrão de padrão = r'(?<=\s|^)\d+(?=\s|$)'; 
    RegExp regex = new RegExp(padrão); 
    if (!regex.hasMatch(valor)) return 'A idade deve ser um número'; 
    retornar nulo; 
  } 

  @override 
  Widget build(BuildContext context) { 
    return Form( 
      key: widget.formKey, 
      autovalidate: true, 
      child: Column( 
        children: <Widget>[ 
          TextFormField( 
            controller: widget.nameController, 
            keyboardType: TextInputType. text , 
            decoration: InputDecoration (labelText: 'Nome'), 
            validador: _validateName, 
          ), 
          TextFormField(
            controlador: widget.ageController, 
            keyboardType: TextInputType. número , 
            decoração: InputDecoration(labelText: 'Age'), 
            validador: _validateAge, 
          ), 
        ], 
      ), 
    );; 
  } 
}