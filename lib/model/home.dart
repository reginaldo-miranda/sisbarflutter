import 'package:flutter/material.dart'; 
importar 'pacote:http/http.dart' como http; 
import 'dardo:converter'; 

import '../env.sample.dart'; 
import '../models/student.dart'; 
import './details.dart'; 
import './create.dart'; 

class Home extends StatefulWidget { 
  Home({Key key}) : super(key: key); 
  @override 
  HomeState createState() => HomeState(); 
} 

class HomeState extends State<Home> { 
  Future<List<Student>> alunos; 
  final studentListKey = GlobalKey<HomeState>(); 

  @override 
  void initState() { 
    super.initState(); 
    alunos = getListaAluno();



    resposta final = await http.get("${Env. URL_PREFIX }/list.php"); 
    itens finais = json.decode(response.body).cast<Map<String, dynamic>>(); 
    Lista<Aluno> alunos = items.map<Aluno>((json) { 
      return Aluno.fromJson(json); 
    }).toList(); 

    alunos de retorno; 
  } 

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      key: studentListKey, 
      appBar: AppBar( 
        title: Text('Student List'), 
      ), 
      body: Center( 
        child: FutureBuilder<List<Student>>( 
          future: students , 
          construtor: (Contexto BuildContext,
            // Por padrão, mostra um spinner de carregamento. 
            if (!snapshot.hasData) return CircularProgressIndicator(); 
            // Renderiza listas de alunos
             return ListView.builder( 
              itemCount: snapshot.data.length, 
              itemBuilder: (BuildContext context, int index) { 
                var data = snapshot.data[index]; 
                return Card( 
                  child: ListTile( lead 
                    : Icon(Icons . person ), 
                    à direita: Icon(Icons. view_list ), 
                    title: Text( 
                      data.name, 
                      style: TextStyle(fontSize: 20), 
                    ),
                    onTap: () { 
                      Navigator. push ( 
                        contexto, 
                        MaterialPageRoute(construtor: (contexto) => Detalhes(aluno: dados)), 
                      ); 
                    }, 
                  ), 
                ); 
              }, 
            ); 
          }, 
        ), 
      ), 
      floatingActionButton: FloatingActionButton( 
        child: Icon(Icons. add ), 
        onPressed: () { 
          Navigator. push (context, MaterialPageRoute(builder: (_) { 
            return Create();
          })); 
        }, 
      ), 
    ); 
  } 
}