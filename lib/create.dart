import 'package:flutter/material.dart'; 
import 'pacote:http/http.dart' como http; 

import 'env.dart'; 
import '../formulario.dart'; 

class Criar extends StatefulWidget { 
  final Função refreshStudentList; 

  Create({this.refreshStudentList}); 

  @override 
  _CreateState createState() => _CreateState(); 
} 

class _CreateState extends State<Create> { 
  // Necessário para validações de formulário
   final formKey = GlobalKey<FormState>(); 

  // Manipula o texto onchange
   TextEditingController nameController = new TextEditingController(); 
  TextEditingController ageController = new TextEditingController(); 

  // Solicitação de postagem HTTP para criar novos dados
  Future _createStudent() async { 
    return await http.post( 
      "${Env. URL_PREFIX }/create.php", 
      body: { 
        "name": nameController.text, 
        "age": ageController.text, 
      }, 
    ); 
  } 

  void _onConfirm(contexto) async { 
    await _createStudent(); 

    // Remova todas as rotas existentes até o Home.dart, então reconstrua o Home. 
    Navegador. of (contexto) 
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false); 
  } 

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: Text("
      ), 
      bottomNavigationBar: BottomAppBar( 
        child: RaisedButton( 
          child: Text("CONFIRM"), 
          color: Colors. blue , 
          textColor: Colors. white , 
          onPressed: () { 
            if (formKey.currentState.validate()) { 
              _onConfirm(context ); 
            } 
          }, 
        ), 
      ), 
      body: Container( 
        height: double. infinity , 
        padding: EdgeInsets.all(20), 
        child: Center( 
          child: Padding( 
            padding: EdgeInsets.all(12),
            filho: AppForm( 
              formKey: formKey, 
              nameController: nameController, 
              ageController: ageController, 
            ), 
          ), 
        ), 
      ), 
    ); 
  } 
}