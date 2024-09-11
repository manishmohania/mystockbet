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
filename='sec_bhavdata_full_'+fdate+'.csv'
furl='https://nsearchives.nseindia.com/products/content/'+filename

#options = Options()
#options.add_argument("--headless=new")
#options.add_argument("user-agent=Mozilla/5.0 (X11; CrOS x86_64 14541.0.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36")

#driver = webdriver.Chrome(options=options)
#driver.get(furl)
#time.sleep(20)
#driver.close()

dndpath='/home/manish/Downloads/'
dndfilepath=dndpath+filename

if not os.path.isfile(dndfilepath) :
  subprocess.run(['curl', '-A', 'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0', furl, '-o', dndfilepath], check=True)

if os.path.isfile(dndfilepath) :
    source_file = open(dndfilepath, 'rb')
    destpath='/home/manish/nsemysqluploads/'
    destfilepath=destpath+filename
    dest_file = open(destfilepath, 'wb')
    shutil.copyfileobj(source_file, dest_file)
    source_file.close()
    dest_file.close()

    if os.path.isfile(destfilepath) :
        ## load file in db
        cnx = mariadb.connect(user='manish', password='mohania', database='nse')
        cursor = cnx.cursor()

        cursor.execute("USE nse")
        query = "LOAD DATA LOCAL INFILE '" + destfilepath + "' INTO TABLE sec_bhavdata_full FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 LINES (symbol, @series_uv, @date1_uv, prev_close, open_price, high_price, low_price, @last_price_uv, close_price, avg_price, ttl_trd_qnty, turnover_lacs, no_of_trades, @deliv_qty_uv, @deliv_per_uv) set series=TRIM(@series_uv), last_price=CASE WHEN @last_price_uv=' ' THEN NULL ELSE @last_price_uv END , ddate=STR_TO_DATE(@date1_uv, '%d-%b-%Y'), deliv_qty=CASE WHEN @deliv_qty_uv=' -' THEN NULL ELSE @deliv_qty_uv END, deliv_per=CASE WHEN @deliv_per_uv=' -' THEN NULL ELSE @deliv_per_uv END"

        cursor.execute(query);
        
        cnx.commit()
        cursor.close()
        cnx.close()

