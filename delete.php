<?php 
header('Content-Type: application/json'); 
inclua "../flutter_api/db.php"; 

$id = (int) $_POST['id']; 
$stmt = $db->prepare("DELETE FROM student WHERE id = ?"); 
$resultado = $stmt->execute([$id]); 

echo json_encode([ 
'id' => $id, 
'sucesso' => $resultado 
]);