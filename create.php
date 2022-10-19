<?php 
header('Content-Type: application/json'); 
inclua "../flutter_api/db.php"; 


$nome = $_POST['nome']; 
$idade = (int) $_POST['idade']; 

$stmt = $db->prepare("INSERIR NO aluno (nome, idade) VALUES (?, ?)"); 
$resultado = $stmt->execute([$nome, $idade]); 

echo json_encode([ 
'sucesso' => $resultado 
]);