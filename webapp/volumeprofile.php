<?php
header('Content-type: application/json');
require "db.php";
try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $qs = urldecode($_GET['qs']);
  $tf = urldecode($_GET['qtf']);
  
  if ($tf == 'D') {
    $tn = 'vp_1_atr';
  } else if ($tf == 'W') {
    $tn = 'vp_w_1_atr';
  }
  
  

  $q=<<<VOLUME
select symbol, mn, mx, atr, n, p1, p2, v, zl, zh from $tn where symbol = '$qs' 
VOLUME;

  $result = $conn->query($q);
  
  if (!$result) {
    print '[{"success": false }]';
  } else {
    $ra = $result->fetchAll();
    echo json_encode($ra);
  }



} catch(PDOException $e) {
  echo '[{"success": false , "e" : "'. urlencode($e->getMessage()) . '"}]';
}
?>

