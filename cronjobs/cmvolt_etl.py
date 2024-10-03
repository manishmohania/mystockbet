#from selenium import webdriver
#from selenium.webdriver.support.wait import WebDriverWait
#from selenium.webdriver.chrome.options import Options
import time
from datetime import datetime
from datetime import timedelta
import os
import shutil
import subprocess
import mariadb


now = datetime.now()
fdate = now.strftime("%d%m%Y")
#fdate = '19072024'
filename='CMVOLT_'+fdate+'.CSV'
localfilename='CMVOLT_'+fdate+'.csv'
furl='https://nsearchives.nseindia.com/archives/nsccl/volt/'+filename

#options = Options()
#options.add_argument("--headless=new")
#options.add_argument("user-agent=Mozilla/5.0 (X11; CrOS x86_64 14541.0.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36")

#driver = webdriver.Chrome(options=options)
#driver.get(furl)
#time.sleep(20)
#driver.close()

dndpath='/home/manish/Downloads/'
dndfilepath=dndpath+localfilename

if (not os.path.isfile(dndfilepath)) or (os.stat(dndfilepath).st_size < 250000) :
  subprocess.run(['curl', '-A', 'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0', furl, '-o', dndfilepath], check=True)

if os.path.isfile(dndfilepath) and (os.stat(dndfilepath).st_size >= 250000):
    source_file = open(dndfilepath, 'rb')
    destpath='/home/manish/nsemysqluploads/'
    destfilepath=destpath+localfilename
    dest_file = open(destfilepath, 'wb')
    shutil.copyfileobj(source_file, dest_file)
    source_file.close()
    dest_file.close() 

    if os.path.isfile(destfilepath) :
        ## load file in db
        cnx = mariadb.connect(user='manish', password='mohania', database='nse')
        cursor = cnx.cursor()

        cursor.execute("USE nse")
        cursor.execute("select count(1) as cnt from cmvolt t where t.ddate=str_to_date('"+fdate+"','%d%m%Y' )")
        rs = cursor.fetchall()
        if (rs[0][0] <= 0) :
          query = "LOAD DATA LOCAL INFILE '" + destfilepath + "' INTO TABLE cmvolt FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 LINES (@ddate, symbol, @underlying_close_price_a, @underlying_previous_day_close_price_b, @underlying_log_returns_c,@previous_day_underlying_volatility_d, @current_day_underlying_daily_volatility_e, @underlying_annualised_volatility_f) set ddate=STR_TO_DATE(@ddate, '%d-%b-%Y'), underlying_close_price_a=CASE WHEN @underlying_close_price_a = '-' THEN NULL ELSE @underlying_close_price_a END, underlying_previous_day_close_price_b=CASE WHEN @underlying_previous_day_close_price_b = '-' THEN NULL ELSE @underlying_previous_day_close_price_b END, underlying_log_returns_c=CASE WHEN @underlying_log_returns_c = '-' THEN NULL ELSE @underlying_log_returns_c END, previous_day_underlying_volatility_d=CASE WHEN @previous_day_underlying_volatility_d = '-' THEN NULL ELSE @previous_day_underlying_volatility_d END, current_day_underlying_daily_volatility_e=CASE WHEN @current_day_underlying_daily_volatility_e = '-' THEN NULL ELSE @current_day_underlying_daily_volatility_e END, underlying_annualised_volatility_f=CASE WHEN @underlying_annualised_volatility_f = '-' THEN NULL ELSE @underlying_annualised_volatility_f END"

          cursor.execute(query);
        
        cnx.commit()
        cursor.close()
        cnx.close()

