use nse;
call calculate_and_load_ema('v_fcm_intrm_bc_be_eq','close');
call calculate_and_load_ema('v_sec_bhavdata_full_be_eq','close'); 
call calculate_and_load_ema('v_sec_bhavdata_full_be_eq','ttl_trd_qnty');
call calculate_and_load_ema('v_sec_bhavdata_full_be_eq_deliv_qty','deliv_qty');
call calculate_and_load_ema('v_sec_bhavdata_full_be_eq_deliv_per','deliv_per');
call calculate_and_load_ema('v_macd_5_8_ema_v_fcm_intrm_bc_be_eq_close', 'macd');
call calculate_and_load_ema('v_macd_12_26_ema_v_fcm_intrm_bc_be_eq_close', 'macd');
call calculate_and_load_ema('v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty', 'macd');
call calculate_and_load_ema('v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_ttl_trd_qnty', 'macd');
call calculate_and_load_ema('v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_deliv_qty', 'macd');
call calculate_and_load_ema('v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_deliv_qty', 'macd');
call calculate_and_load_ema('v_macd_5_8_ema_v_sec_bhavdata_full_be_eq_deliv_per', 'macd');
call calculate_and_load_ema('v_macd_12_26_ema_v_sec_bhavdata_full_be_eq_deliv_per', 'macd');

call calculate_and_load_ema('v_ma_advance_decline_ratio', 'adr');
call calculate_and_load_ema('v_macd_12_26_ema_v_ma_advance_decline_ratio_adr', 'macd');
call calculate_and_load_ema('v_macd_5_8_ema_v_ma_advance_decline_ratio_adr', 'macd');

call calculate_and_load_ema('v_ma_cum_advance_decline', 'ald');
call calculate_and_load_ema('v_macd_12_26_ema_v_ma_cum_advance_decline_ald', 'macd');
call calculate_and_load_ema('v_macd_5_8_ema_v_ma_cum_advance_decline_ald', 'macd');

call calculate_and_load_ema('v_md_all_indices_advance_decline', 'adr');
call calculate_and_load_ema('v_macd_12_26_ema_v_md_all_indices_advance_decline_adr', 'macd');
call calculate_and_load_ema('v_macd_5_8_ema_v_md_all_indices_advance_decline_adr', 'macd');

call calculate_and_load_ema('v_md_all_indices_cum_advance_decline', 'ald');
call calculate_and_load_ema('v_macd_12_26_ema_v_md_all_indices_cum_adv_dec_ald', 'macd');
call calculate_and_load_ema('v_macd_5_8_ema_v_md_all_indices_cum_advance_decline_ald', 'macd');

call calculate_and_load_ema('v_ma_nifty_index_d', 'close');
call calculate_and_load_ema('v_macd_12_26_ema_v_ma_nifty_index_d_close', 'macd');
call calculate_and_load_ema('v_macd_5_8_ema_v_ma_nifty_index_d_close', 'macd');

call calculate_and_load_rsi('v_fcm_intrm_bc_be_eq','close');
