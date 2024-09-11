import time
from datetime import datetime
import os
import shutil
import subprocess
import mariadb

now = datetime.now()
fdate = now.strftime("%d%m%Y")
filename='market_data_all_indices_'+fdate+'.json'
furl='https://www.nseindia.com/api/allIndices'
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
        query = "LOAD DATA LOCAL INFILE '" + destfilepath + "' INTO TABLE market_data_all_indices(jsonDoc)"

        cursor.execute(query);
        
        cnx.commit()
        cursor.close()
        cnx.close()

