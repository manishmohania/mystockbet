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
filename='CM_52_wk_High_low_'+fdate+'.csv'
furl='https://nsearchives.nseindia.com/content/'+filename

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
    dest_file.close()

    if os.path.isfile(destfilepath) :
        ## load file in db
        cnx = mariadb.connect(user='manish', password='mohania', database='nse')
        cursor = cnx.cursor()

        cursor.execute("USE nse")
        query = "LOAD DATA LOCAL INFILE '" + destfilepath + "' INTO TABLE cm_52_wk_high_low FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 3 LINES (symbol, @series_uv, @adjusted_52_week_high, @52_week_high_date,@adjusted_52_week_low, @52_week_low_dt) set ddate=STR_TO_DATE('"+fdate+"','%d%m%Y'), series=TRIM(@series_uv), adjusted_52_week_high=CASE WHEN @adjusted_52_week_high='-' THEN NULL ELSE TRIM(@adjusted_52_week_high) END, 52_week_high_date=CASE WHEN @52_week_high_date='-' THEN NULL ELSE STR_TO_DATE(@52_week_high_date, '%d-%b-%Y') END, adjusted_52_week_low=CASE WHEN @adjusted_52_week_low='-' THEN NULL ELSE TRIM(@adjusted_52_week_low) END ,52_week_low_dt=CASE WHEN  @52_week_low_dt='-' THEN NULL ELSE STR_TO_DATE(@52_week_low_dt, '%d-%b-%Y') END"

        cursor.execute(query);
        
        cnx.commit()
        cursor.close()
        cnx.close()

