import 'package:flutter/material.dart'; 
importar 'pacote:http/http.dart' como http; 

import '../env.sample.dart'; 
import '../models/student.dart'; 
import './edit.dart'; 

class Details extends StatefulWidget { 
  final Student student; 

  Detalhes({este.aluno}); 

  @override 
  _DetailsState createState() => _DetailsState(); 
} 

class _DetailsState extends State<Details> { 
  void deleteStudent(context) async { 
    await http.post( 
      "${Env. URL_PREFIX }/delete.php", 
      body: { 
        'id': widget.student.id.toString() , 
      }, 
    ); 
    // Navigator.pop(context);
    of (contexto) 
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false); 
  } 

  void confirmDelete(contexto) { 
    showDialog( 
      context: context, 
      builder: (BuildContext context) { 
        return AlertDialog( 
          content: Text('Tem certeza de que deseja excluir isso?'), 
          actions: <Widget>[ 
            RaisedButton( 
              child: Icon(Icons. cancel ), 
              color: Colors. red , 
              textColor: Colors. white , 
              onPressed: () => Navigator. of (context).pop(), 
            ),
            RaisedButton( 
              child: Icon(Icons. check_circle ), 
              color: Colors. blue , 
              textColor: Colors. white , 
              onPressed: () => deleteStudent(context), 
            ), 
          ], 
        ); 
      }, 
    ); 
  } 

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: Text('Details'), 
        actions: <Widget>[ 
          IconButton( 
            icon: Icon(Icons. delete ),
            onPressed: () => confirmDelete(context), 
          ), 
        ], 
      ), 
      body: Container( 
        height: 270.0, 
        padding: const EdgeInsets.all(35), 
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: <Widget> [ 
            Text( 
              "Nome: ${widget.student.name}", 
              estilo: TextStyle(fontSize: 20), 
            ), 
            Padding( 
              padding: EdgeInsets.all(10), 
            ), 
            Text( 
              "Idade: ${widget.student .age}", 
              estilo: TextStyle(fontSize: 20),
            ), 
          ], 
        ), 
      ), 
      floatingActionButton: FloatingActionButton( 
        child: Icon(Icons. edit ), 
        onPressed: () => Navigator. of (context).push( 
          MaterialPageRoute( 
            builder: (BuildContext context) => Edit(student: widget.aluno), 
          ), 
        ), 
      ), 
    ); 
  } 
}