<?php
header('Content-type: application/json');
require "db.php";
try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $qs = urldecode($_GET['qs']);
  $tf = urldecode($_GET['qtf']);
  $qindv = urldecode($_GET['qindv']);
  
  $tn = 'v_sec_bhavdata_full_be_eq';

  if ($qindv == 1) {
    $fn = 'ttl_trd_qnty';
  } else if ($qindv == 2) {
    $fn = 'deliv_qty';
  } else if ($qindv == 3) {
    $fn = 'deliv_per';
  }
 
  if ($tf == 'D') {
    $tn = 'v_sec_bhavdata_full_be_eq';
  } else if ($tf == 'W') {
    $tn = 'sec_bhavdata_full_be_eq_w';
  }
  
  

  $q=<<<VOLUME
select ddate, $fn, open, close from $tn where symbol='$qs' order by ddate asc
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

