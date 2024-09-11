<?php
header('Content-type: application/json');
require 'db.php';

try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $qs = urldecode($_GET['qs']);
  $qtf = urldecode($_GET['qtf']);
  $q = '';
  if ($qtf == 'D') {
    $q=<<<OHLC
select ddate, open, high, low, close from v_fcm_intrm_bc_be_eq where symbol='$qs' 
 order by ddate asc
OHLC;

    if ((str_ends_with($qs, 'FUT') || str_ends_with($qs, 'CE') || str_ends_with($qs, 'PE')) and strlen($qs) >= 10) {
      $q=<<<OHLC
      SELECT TradDt as ddate, OpnPric as open, HghPric as high, LwPric as low, ClsPric as close from bhavcopy_nse_fo fo where FinInstrmNm='$qs'
OHLC;
    } else if (str_starts_with($qs, 'INDEX.')) {
      $q=<<<OHLC
      SELECT ddate, open, high, low, close from ma_nifty_index where concat('INDEX.', replace(index_name, ' ', '.')) ='$qs'
OHLC;
    }
  } else if ($qtf == 'W') {
    $q=<<<OHLC
select ddate, open, high, low, close from fcm_intrm_bc_be_eq_w where symbol='$qs' 
 order by ddate asc
OHLC;
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
