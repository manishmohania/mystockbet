<?php
header('Content-type: application/json');
require "db.php";
try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $qs = urldecode($_GET['qs']);
  $qtf = urldecode($_GET['qtf']);
  $qep = urldecode($_GET['qep']);
  $qindn = urldecode($_GET['qindn']);
  
  if ($qtf == 'D') {
    if ($qindn == 'EMA'.$qep) {
      $et = 'ema_v_fcm_intrm_bc_be_eq_close';
    } else if ($qindn == 'Volume') {
      $et = 'ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty';
    } else if ($qindn == 'DeliveryVolume') {
      $et = 'ema_v_sec_bhavdata_full_be_eq_deliv_qty_deliv_qty';
    } else if ($qindn == 'DeliveryPercent') {
      $et = 'ema_v_sec_bhavdata_full_be_eq_deliv_per_deliv_per';
    }
  } else if ($qtf == 'W') {
    if ($qindn == 'EMA'.$qep) {
      $et = 'ema_fcm_intrm_bc_be_eq_w_close';
    } else if ($qindn == 'Volume') {
      $et = 'ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty';
    } else if ($qindn == 'DeliveryVolume') {
      $et = 'ema_v_sec_bhavdata_full_be_eq_w_deliv_qty_deliv_qty';
    } else if ($qindn == 'DeliveryPercent') {
      $et = 'ema_v_sec_bhavdata_full_be_eq_w_deliv_per_deliv_per';
    }
    
  }

  $q=<<<EMAQ
select ddatetime, ema_$qep as ema_p from $et where symbol='$qs' order by ddatetime asc
EMAQ;
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

