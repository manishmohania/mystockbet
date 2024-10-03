<?php
header('Content-type: application/json');
require "db.php";
require "util.php";
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
      if (str_starts_with($qs, 'INDEX.')) {
        $ts = str_replace('.', ' ', substr($qs, 6));
        $et = 'ema_v_ma_nifty_index_d_close';
        $qs = $ts;
      }

    } else if ($qindn == 'Volume') {
      $et = 'ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty';
    } else if ($qindn == 'DeliveryVolume') {
      $et = 'ema_v_sec_bhavdata_full_be_eq_deliv_qty_deliv_qty';
    } else if ($qindn == 'DeliveryPercent') {
      $et = 'ema_v_sec_bhavdata_full_be_eq_deliv_per_deliv_per';
    } else if ($qindn == 'ADRline') {
      if ($qs == 'NSEEODADR') {
        $et = 'ema_v_ma_advance_decline_ratio_adr';
      } else if (str_starts_with($qs, 'INDEX.')) {
        $ts = str_replace('.', ' ', substr($qs, 6));
        $et = 'ema_v_md_all_indices_advance_decline_adr';
        $qs = $ts;
      }
    } else if ($qindn == 'ADLline') {
      if ($qs == 'NSEEODADR') {
        $et = 'ema_v_ma_cum_advance_decline_ald';
      } else if (str_starts_with($qs, 'INDEX.')) {
        $ts = str_replace('.', ' ', substr($qs, 6));
        $et = 'ema_v_md_all_indices_cum_advance_decline_ald';
        $qs = $ts;
      }
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
select ddatetime, ema_$qep as ema_p from $et where symbol='$qs' and ema_$qep IS NOT NULL order by ddatetime asc
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

