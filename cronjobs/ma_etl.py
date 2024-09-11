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
fdate = now.strftime("%d%m%y")
#fdate = '240724'
#https://nsearchives.nseindia.com/archives/equities/mkt/MA080724.csv
filename='MA'+fdate+'.csv'
furl='https://nsearchives.nseindia.com/archives/equities/mkt/'+filename

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
    destpath='/home/manish/nseprocessedfiles/'
    destfilepath=destpath+filename
    dest_file = open(destfilepath, 'wb')
    shutil.copyfileobj(source_file, dest_file)
    source_file.close()
    dest_file.close()

cnx = mariadb.connect(user='manish', password='mohania', database='nse')
cursor = cnx.cursor()

cursor.execute("USE nse")

pdt=None
vddate=None
vqddate=None
vsummary_dt=None
vqsummary_dt=None
vsummary_stmt=None
vtraded_value_in_cr=None
vtraded_quantity_in_lakhs=None
vnumber_of_trades=None
vtotal_mkt_capitalisation_in_cr=None
vtraded_quantity_in_lakhs=None
vnumber_of_trades=None
vtotal_mkt_capitalisation_in_cr=None
vadvances=None
vdeclines=None
vunchanged=None
vsecurities_price_band_hit_count=None

# Using readlines()
file1 = open(dndfilepath,'r')
Lines = file1.readlines()

count = 0
# Strips the newline character
for line in Lines:
    count += 1
    # print("Line{}: {}".format(count,line.strip()))
    lv = line.split(",")
    v = [s.strip() for s in lv]
    if count == 1 and pdt is None:
        print(v[1])
        vddate = v[1]
        vqddate = "STR_TO_DATE('"+vddate+"','%d-%b-%Y')"
        vsummary_dt = v[1]
        vqsummary_dt = "STR_TO_DATE('"+vsummary_dt+"','%d-%b-%Y')"
    elif count == 2:
        vsummary_stmt=v[0]
    elif count == 3:
        pass
    elif count == 4:
        vtraded_value_in_cr=v[2]
    elif count == 5:
        vtraded_quantity_in_lakhs=v[2]
    elif count == 6:
        vnumber_of_trades=v[2]
    elif count == 7:
        vtotal_mkt_capitalisation_in_cr=v[2]
        va = (vsummary_stmt,vtraded_value_in_cr,vtraded_quantity_in_lakhs,vnumber_of_trades,vtotal_mkt_capitalisation_in_cr);
        q="insert into ma_summary values ("+vqddate+","+vqsummary_dt+",'" + "','".join( va)+"')"
        cursor.execute(q);
        cnx.commit()
    elif count == 8 or count == 9:
        pass
    elif count >= 10 and count <= 86:
        q="insert into ma_nifty_index values ("+vqddate+",'" + "','".join( v[1:])+"')"
        cursor.execute(q);
        cnx.commit()
    elif count == 87:
        pass
    elif count == 88:
        vadvances = v[2]
    elif count == 89:
        vdeclines = v[2]
    elif count == 90:
        vunchanged = v[2] 
    elif count == 91:
        pass
    elif count == 92:
        vsecurities_price_band_hit_count = v[2]
        va = (vadvances, vdeclines, vunchanged, vsecurities_price_band_hit_count)
        q = "insert into ma_advance_decline values ("+vqddate+",'" + "','".join( va)+"')"
        cursor.execute(q);
        cnx.commit()
    elif count == 93 or count == 94 or count == 95:
        pass
    elif count >= 96 and count <= 120:
        q="insert into ma_top_25_securities_today values ("+vqddate+",'" + "','".join( v[1:])+"')"
        cursor.execute(q);
        cnx.commit()
    elif count == 121 or count == 122 or count == 123:
        pass
    elif count >= 124 and count <= 128:
        if v[0] == '' and len(v)==1 :
            count = 128
            continue
        q="insert into ma_top_5_nifty_50_gainers values ("+vqddate+",'" + "','".join( v[1:])+"')"
        cursor.execute(q);
        cnx.commit()
    elif count == 129 or count == 130 or count == 131:
        pass
    elif count >= 132 and count <= 136:
        if v[0] == '' and len(v)==1:
            count = 136
            continue
        q="insert into ma_top_5_nifty_50_losers values ("+vqddate+",'" + "','".join( v[1:])+"')"
        cursor.execute(q);
        cnx.commit()
    elif count == 137 or count == 138 or count == 139:
        pass
    elif count >= 140:
        q="insert ignore into ma_securities_price_volume_data values ("+vqddate+",'" + "','".join( v[1:])+"')"
        cursor.execute(q);
        cnx.commit()


file1.close()
cursor.close()
cnx.close()

