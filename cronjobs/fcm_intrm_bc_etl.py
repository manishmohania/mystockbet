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
#fdate = '22122023'
filename='FCM_INTRM_BC'+fdate+'.DAT'
furl='https://nsearchives.nseindia.com/content/trdops/'+filename

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
        query = "LOAD DATA LOCAL INFILE '" + destfilepath + "' INTO TABLE fcm_intrm_bc FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (name, @symbol, series, @dummy, prev_close,open, high, low, close, @dummy, @dummy, @dummy, @dummy, @dummy, @ddate, @dummy) set ddate=STR_TO_DATE(@ddate, '%d-%b-%Y'), symbol=TRIM(@symbol)"

        cursor.execute(query);
        
        cnx.commit()
        cursor.close()
        cnx.close()
