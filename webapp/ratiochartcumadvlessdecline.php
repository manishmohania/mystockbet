<?php
header('Content-type: application/json');
require "db.php";
require "util.php";

try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $qindv = urldecode($_GET['qindv']);


  if ($qindv == 'NSEEODADR') {
    $q='select ddate, ald, cumadvances, cumdeclines from v_ma_cum_advance_decline t';

    $result = $conn->query($q);

    if (!$result) {
      print '[{"success": false }]';
    } else {
      $ra = $result->fetchAll();
      echo json_encode($ra);
    }
  } else if (str_starts_with($qindv, 'INDEX.')) {
    $q=<<<ADVDEC
    select ddate, ald, cumadvances, cumdeclines from v_md_all_indices_cum_advance_decline t where concat('INDEX.', replace(t.symbol, ' ', '.')) ='$qindv';
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
