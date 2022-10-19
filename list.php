<?php 
header('Content-Type: application/json'); 
inclua "../flutter_api/db.php"; 

$stmt = $db->prepare("SELECT id, nome, idade do aluno"); 
$stmt->executar(); 
$resultado = $stmt->fetchAll(PDO::FETCH_ASSOC); 

echo json_encode($resultado);