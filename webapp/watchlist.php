<?php
header('Content-type: application/json');
require "db.php";
try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $qw = urldecode($_GET['qw']);
  $tn = '';
  
  if ($qw == 'sensex_30') {
    $tn = 'sensex_30';
  } else if ($qw == 'nifty_50') {
    $tn = 'nifty_50';
  } else if ($qw == 'nifty_next_50') {
    $tn = 'nifty_next_50';
  } else if ($qw == 'nifty_100') {
    $tn = 'nifty_100';
  } else if ($qw == 'nifty_200') {
    $tn = 'nifty_200';
  } else if ($qw == 'nifty_500') {
    $tn = 'nifty_500';
  }

  $q=<<<WQ
select symbol from $tn;
WQ;

  if ($qw == 'fo_symbols') {
    $q='select FinInstrmNm as symbol from fo_symbols';
  } else if ($qw == 'index_symbols') {
    $q="select concat('INDEX.',replace(index_name, ' ', '.')) from ma_nifty_index where ddate=(select max(ddate) from ma_nifty_index)";
  }
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

