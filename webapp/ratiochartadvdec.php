<?php
header('Content-type: application/json');
require "db.php";
try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $qindv = urldecode($_GET['qindv']);


  if ($qindv == 'STKTM') {
    $q='select ddate, (advances/(case when declines is null or declines=0 then 1 else declines end)), advances, declines, unchanged from ma_advance_decline t';

    $result = $conn->query($q);

    if (!$result) {
      print '[{"success": false }]';
    } else {
      $ra = $result->fetchAll();
      echo json_encode($ra);
    }
  } else if (str_starts_with($qindv, 'INDEX.')) {
    $q=<<<ADVDEC
    select ddate, (advances/(case when declines is null or declines=0 then 1 else declines end)), advances, declines, unchanged from md_all_indices_advance_decline t where concat('INDEX.', replace(t.index_name, ' ', '.')) ='$qindv';
ADVDEC;

    $result = $conn->query($q);

    if (!$result) {
      print '[{"success": false }]';
    } else {
      $ra = $result->fetchAll();
      echo json_encode($ra);
    }

  }

} catch(PDOException $e) {
  echo '[{"success": false , "e" : "'. urlencode($e->getMessage()) . '"}]';
}
?>
