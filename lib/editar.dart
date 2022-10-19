import 'package:flutter/material.dart'; 
importar 'pacote:http/http.dart' como http; 

import '../env.sample.dart'; 
import 'model_aluno.dart'; 
import '../widgets/form.dart'; 

class Edit extends StatefulWidget { 
  final Student student; 

  Edit({este.aluno}); 

  @override 
  _EditState createState() => _EditState(); 
} 

class _EditState extends State<Edit> { 
  // Isto é para validações de formulário
   final formKey = GlobalKey<FormState>(); 

  // Isto é para o texto onChange
   TextEditingController nameController; 
  TextEditingController ageController;

  
  

      "${Env. URL_PREFIX }/update.php", 
      body: { 
        "id": widget.student.id.toString(), 
        "name": nameController.text, 
        "age": ageController.text 
      }, 
    ); 
  } 

  void _onConfirm(contexto) async { 
    await editStudent(); 
  } 

  @override 
  void initState() { 
    nameController = TextEditingController(texto: widget.student.name); 
    ageController = TextEditingController(texto: widget.student.age.toString()); 
    super.initState(); 
  } 

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(
        title: Text("Edit"), 
      ), 
      bottomNavigationBar: BottomAppBar( 
        child: RaisedButton( 
          child: Text('CONFIRM'), 
          color: Colors. blue , 
          textColor: Colors. white , 
          onPressed: () { 
            _onConfirm(context); 
          }, 
        ), 
      ), 
      body: Container( 
        height: double. infinity , 
        padding: EdgeInsets.all(20), 
        child: Center( 
          child: Padding( 
            padding: EdgeInsets.all(12), 
            child: AppForm( 
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