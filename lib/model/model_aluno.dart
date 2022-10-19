class Aluno { 
  final int id; 
  nome final da String; 
  idade int final; 

  Student({this.id, this.name, this.age}); 

  factory Student.fromJson(Map<String, dynamic> json) { 
    return Student( 
      id: json['id'], 
      name: json['name'], 
      age: json['age'], 
    ); 
  } 

  Map<String, dynamic> toJson() => { 
    'name': name, 
    'age': age, 
  }; 
}