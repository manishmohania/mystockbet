#!/bin/bash
f='bse_sensex_'
d=`date +'%Y-%m-%d %T'`
fn="$f$d.json"
dp="/home/manish/Downloads/bse_sensex_dnd/${fn}"
curl --max-time 60 'https://api.bseindia.com/BseIndiaAPI/api/GetStkCurrMain_new/w?flag=Equity&ddlVal1=Index&ddlVal2=BSE%20SENSEX&m=0&pgN=1&srts=A&srtb=1' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H 'origin: https://www.bseindia.com' \
  -H 'priority: u=1, i' \
  -H 'referer: https://www.bseindia.com/' \
  -H 'sec-ch-ua: "Chromium";v="128", "Not;A=Brand";v="24", "Google Chrome";v="128"' \
  -H 'sec-ch-ua-mobile: ?1' \
  -H 'sec-ch-ua-platform: "Android"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-site' \
  -H 'user-agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36' > "${dp}"
rv=$?
if [ "$rv" -eq "0" ]; then
mysql -umanish -pmohania -e "use bse; LOAD DATA LOCAL INFILE '${dp}' INTO TABLE bse_sensex(jsonDoc)" && mysql -umanish -pmohania < /home/manish/nse-automation-scripts/load_bse_sensex_data.sql
fi
