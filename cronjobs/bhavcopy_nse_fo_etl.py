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
from zipfile import ZipFile


now = datetime.now()
fdate = now.strftime("%Y%m%d")
#fdate = '20240802'
csvfilename='BhavCopy_NSE_FO_0_0_0_'+fdate.upper()+'_F_0000.csv'
zipfilename='BhavCopy_NSE_FO_0_0_0_'+fdate.upper()+'_F_0000.csv.zip'



furl='https://nsearchives.nseindia.com/content/fo/'+zipfilename


#options = Options()
#options.add_argument("--headless=new")
#options.add_argument("user-agent=Mozilla/5.0 (X11; CrOS x86_64 14541.0.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36")

#driver = webdriver.Chrome(options=options)
#driver.get(furl)
#time.sleep(20)
#driver.close()

dndpath='/home/manish/Downloads/'
dndfilepath=dndpath+zipfilename

destpath='/home/manish/nsemysqluploads/'
destfilepath=destpath+csvfilename

if not os.path.isfile(dndfilepath) :
  subprocess.run(['curl', '-A', 'Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0', furl, '-o', dndfilepath], check=True)


if os.path.isfile(dndfilepath) :
  with ZipFile(dndfilepath, 'r') as zObject: 
  
    # Extracting all the members of the zip  
    # into a specific location. 
    zObject.extractall( 
        path=destpath) 

    if os.path.isfile(destfilepath) :
        ## load file in db
        cnx = mariadb.connect(user='manish', password='mohania', database='nse')
        cursor = cnx.cursor()

        cursor.execute("USE nse")
        query = "LOAD DATA LOCAL INFILE '" + destfilepath + "' INTO TABLE bhavcopy_nse_fo FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 LINES (TradDt,	BizDt,	Sgmt,	Src,	FinInstrmTp,	FinInstrmId,	ISIN,	TckrSymb,	SctySrs,	XpryDt,	FininstrmActlXpryDt,	@StrkPric,	OptnTp,	FinInstrmNm,	OpnPric,	HghPric,	LwPric,	ClsPric,	LastPric,	PrvsClsgPric,	UndrlygPric,	SttlmPric,	OpnIntrst,	ChngInOpnIntrst,	TtlTradgVol,	TtlTrfVal,	TtlNbOfTxsExctd,	SsnId,	NewBrdLotQty,	Rmks,	Rsvd1,	Rsvd2,	Rsvd3,	Rsvd4) SET StrkPric=IF(@StrkPric='',NULL,@StrkPric)"

        cursor.execute(query);
        
        cnx.commit()
        cursor.close()

        query = "LOAD DATA LOCAL INFILE '" + destfilepath + "' INTO TABLE fo_bhav FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 LINES (ddate,	@BizDt,	@Sgmt,	@Src,	@FinInstrmTp,	@FinInstrmId,	@ISIN,	symbol,	@SctySrs,	expiry_dt,	@FininstrmActlXpryDt, @StrkPric,	option_typ,	@FinInstrmNm,	open,	high,	low,	close,	@LastPric,	@PrvsClsgPric,	@UndrlygPric,	settle_pr,	open_int,	chg_in_oi,	contracts,	@TtlTrfVal,	@TtlNbOfTxsExctd,	@SsnId,	@NewBrdLotQty,	@Rmks,	@Rsvd1,	@Rsvd2,	@Rsvd3,	@Rsvd4) SET strike_pr=IF(@StrkPric='',0.0,@StrkPric), val_inlakh=(@TtlTrfVal / 100000), instrument=case when @FinInstrmTp = 'STO' THEN 'OPTSTK' WHEN @FinInstrmTp = 'STF' THEN 'FUTSTK' WHEN @FinInstrmTp = 'IDO' THEN 'OPTIDX' WHEN @FinInstrmTp = 'IDF' THEN 'FUTIDX' ELSE @FinInstrmTp end"
        cursor = cnx.cursor()

        cursor.execute(query);
        cnx.commit()

        cursor.close()
        cnx.close()

