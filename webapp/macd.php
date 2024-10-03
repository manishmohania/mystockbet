<?php
header('Content-type: application/json');
require "db.php";
require "util.php";
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
    } else if ($qindv == 5) {
      $mt = 'v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_deliv_qty';
      $et = 'ema_v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_deliv_qty_macd';
      $ep = 3;
    } else if ($qindv == 6) {
      $mt = 'v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_deliv_qty';
      $et = 'ema_v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_deliv_qty_macd';
      $ep = 9;
    } else if ($qindv == 7) {
      $mt = 'v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_deliv_per';
      $et = 'ema_v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_deliv_per_macd';
      $ep = 3;
    } else if ($qindv == 8) {
      $mt = 'v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_deliv_per';
      $et = 'ema_v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_deliv_per_macd';
      $ep = 9;
    } else if ($qindv == 9) {
      if ($qs == 'NSEEODADR') {
        $mt = 'v_macd_5_8_ema_v_ma_advance_decline_ratio_adr';
        $et = 'ema_v_macd_5_8_ema_v_ma_advance_decline_ratio_adr_macd';
        $ep = 3;
      } else if (str_starts_with($qs, 'INDEX.')) {
        $ts = str_replace('.', ' ', substr($qs, 6));

        $mt = 'v_macd_5_8_ema_v_md_all_indices_advance_decline_adr';
        $et = 'ema_v_macd_5_8_ema_v_md_all_indices_advance_decline_adr_macd';
        $ep = 3;
        $qs = $ts;

      }
    } else if ($qindv == 10) {
      if ($qs == 'NSEEODADR') {
        $mt = 'v_macd_12_26_ema_v_ma_advance_decline_ratio_adr';
        $et = 'ema_v_macd_12_26_ema_v_ma_advance_decline_ratio_adr_macd';
        $ep = 9;
      } else if (str_starts_with($qs, 'INDEX.')){
        $ts = str_replace('.', ' ', substr($qs, 6));

        $mt = 'v_macd_12_26_ema_v_md_all_indices_advance_decline_adr';
        $et = 'ema_v_macd_12_26_ema_v_md_all_indices_advance_decline_adr_macd';
        $ep = 9;
        $qs = $ts;

      }

    } else if ($qindv == 11) {
      if ($qs == 'NSEEODADR') {
        $mt = 'v_macd_5_8_ema_v_ma_cum_advance_decline_ald';
        $et = 'ema_v_macd_5_8_ema_v_ma_cum_advance_decline_ald_macd';
        $ep = 3;
      }  else if (str_starts_with($qs, 'INDEX.')) {
        $ts = str_replace('.', ' ', substr($qs, 6));

        $mt = 'v_macd_5_8_ema_v_md_all_indices_cum_advance_decline_ald';
        $et = 'ema_v_macd_5_8_ema_v_md_all_indices_cum_advance_decline_ald_macd';
        $ep = 3;
        $qs = $ts;

      }

    } else if ($qindv == 12) {
      if ($qs == 'NSEEODADR') {
        $mt = 'v_macd_12_26_ema_v_ma_cum_advance_decline_ald';
        $et = 'ema_v_macd_12_26_ema_v_ma_cum_advance_decline_ald_macd';
        $ep = 9;
      } else if (str_starts_with($qs, 'INDEX.')) {
        $ts = str_replace('.', ' ', substr($qs, 6));

        $mt = 'v_macd_12_26_ema_v_md_all_indices_cum_adv_dec_ald';
        $et = 'ema_v_macd_12_26_ema_v_md_all_indices_cum_adv_dec_ald_macd';
        $ep = 9;
        $qs = $ts;
      }

    } else if ($qindv == 13) {
        $ts = str_replace('.', ' ', substr($qs, 6));

        $mt = 'v_macd_5_8_ema_v_ma_nifty_index_d_close';
        $et = 'ema_v_macd_5_8_ema_v_ma_nifty_index_d_close_macd';
        $ep = 3;
        $qs = $ts;

    } else if ($qindv == 14) {
        $ts = str_replace('.', ' ', substr($qs, 6));

        $mt = 'v_macd_12_26_ema_v_ma_nifty_index_d_close';
        $et = 'ema_v_macd_12_26_ema_v_ma_nifty_index_d_close_macd';
        $ep = 9;
        $qs = $ts;
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
    } else if ($qindv == 5) {
      $mt = 'v_macd_5_8_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty';
      $et = 'ema_v_macd_5_8_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty_macd';
      $ep = 3;
    } else if ($qindv == 6) {
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

