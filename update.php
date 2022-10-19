<?php 
header('Content-Type: application/json'); 
inclua "../flutter_api/db.php"; 

$id = $_POST['id']; 
$nome = $_POST['nome']; 
$idade = (int) $_POST['idade']; 

$stmt = $db->prepare("UPDATE student SET name = ?, age = ? WHERE id = ?"); 
$resultado = $stmt->execute([$nome, $idade, $id]); 

echo json_encode([ 
'sucesso' => $resultado 
]);