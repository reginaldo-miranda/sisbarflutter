<?php 
header('Content-Type: application/json'); 
inclua "../flutter_api/db.php"; 

$id = (int) $_POST['id']; 

$stmt = $db->prepare("SELECT nome, idade FROM aluno WHERE ID = ?"); 
$stmt->execute([$id]); 
$resultado = $stmt->fetch(PDO::FETCH_ASSOC); 

echo json_encode([ 
'resultado' => $resultado 
]);