use nse;
call calculate_and_load_fcm_intrm_bc_be_eq_w(year(current_date()), week(current_date()));
call calculate_and_load_sec_bhavdata_full_be_eq_w(year(current_date()), week(current_date()));
call calculate_and_load_ema('fcm_intrm_bc_be_eq_w', 'close');
call calculate_and_load_ema('sec_bhavdata_full_be_eq_w', 'close');
call calculate_and_load_ema('sec_bhavdata_full_be_eq_w', 'ttl_trd_qnty');
call calculate_and_load_ema('v_sec_bhavdata_full_be_eq_w_deliv_qty', 'deliv_qty');
call calculate_and_load_ema('v_sec_bhavdata_full_be_eq_w_deliv_per', 'deliv_per');
call calculate_and_load_ema('v_macd_5_8_ema_fcm_intrm_bc_be_eq_w_close', 'macd');
call calculate_and_load_ema('v_macd_12_26_ema_fcm_intrm_bc_be_eq_w_close', 'macd');
call calculate_and_load_ema('v_macd_5_8_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty', 'macd');
call calculate_and_load_ema('v_macd_12_26_ema_sec_bhavdata_full_be_eq_w_ttl_trd_qnty', 'macd');
call calculate_and_load_ema('v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_w_deliv_qty', 'macd');
call calculate_and_load_ema('v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_w_deliv_qty', 'macd');
call calculate_and_load_ema('v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_w_deliv_per', 'macd');
call calculate_and_load_ema('v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_w_deliv_per', 'macd');

call calculate_and_load_rsi('fcm_intrm_bc_be_eq_w','close');
