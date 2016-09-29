import psycopg2
import sys

con = None
num=sys.argv[1];

try:
     
    con = psycopg2.connect("dbname='mimic' user='postgres'") 
    
    cur = con.cursor()    
    cur.execute("SELECT chart.subject_id,chart.hadm_id,chart.itemid,item.label,chart.charttime,chart.value,chart.valuenum,chart.valueuom FROM mimiciii.chartevents chart INNER JOIN mimiciii.d_items item ON chart.itemid = item.itemid where chart.subject_id = "+num+" ORDER BY chart.itemid;")
    f=open(num+'.txt','a+')
    col_names = [cn[0] for cn in cur.description]
    #print >> f,col_names[0],col_names[1],col_names[2],col_names[3],col_names[4],col_names[5],col_names[6],col_names[7]
    while True:
        row = cur.fetchone()
        if row == None:
            break
        print >> f, row
       
    f.close() 
 #   for row in rows:
 #       print >> f,"%s %s %s %s %s %s %s %s" % (row["subject_id"],row["hadm_id"],row["itemid"],row["label"],row["charttime"],row["value"],row["valuenum"],row["valueuom"])
   

except psycopg2.DatabaseError, e:
    print 'Error %s' % e    
    sys.exit(1)
    
    
finally:
    
    if con:
        con.close()
