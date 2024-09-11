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
  
  
  if ($tf == 'D') {
    if ($qindv == 1) {
      $mt = 'v_macd_5_8_ema_v_fcm_intrm_bc_be_eq_close';
      $et = 'ema_v_macd_5_8_ema_v_fcm_intrm_bc_be_eq_close_macd';
      $ep = 3;
    } else if ($qindv == 2) {
      $mt = 'v_macd_12_26_ema_v_fcm_intrm_bc_be_eq_close';
      $et = 'ema_v_macd_12_26_ema_v_fcm_intrm_bc_be_eq_close_macd';
      $ep = 9;
    } else if ($qindv == 3) {
      $mt = 'v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty';
      $et = 'ema_v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty_macd';
      $ep = 3;
    } else if ($qindv == 4) {
      $mt = 'v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty';
      $et = 'ema_v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty_macd';
      $ep = 9;
    }
  } else if ($tf == 'W') {
    if ($qindv == 1) {
      $mt = 'v_macd_5_8_ema_fcm_intrm_bc_be_eq_w_close';
      $et = 'ema_v_macd_5_8_ema_fcm_intrm_bc_be_eq_w_close_macd';
      $ep = 3;
    } else if ($qindv == 2) {
      $mt = 'v_macd_12_26_ema_fcm_intrm_bc_be_eq_w_close';
      $et = 'ema_v_macd_12_26_ema_fcm_intrm_bc_be_eq_w_close_macd';
      $ep = 9;
    } else if ($qindv == 3) {
      $mt = 'v_macd_5_8_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty';
      $et = 'ema_v_macd_5_8_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty_macd';
      $ep = 3;
    } else if ($qindv == 4) {
      $mt = 'v_macd_12_26_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty';
      $et = 'ema_v_macd_12_26_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty_macd';
      $ep = 9;
    }
    
  }
  
  

  $q=<<<MACD
select m.ddatetime, m.macd, e.ema_$ep as signalline from $mt m inner join $et e on m.ddatetime=e.ddatetime and m.symbol=e.symbol and m.symbol='$qs' order by m.ddatetime asc
MACD;

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

