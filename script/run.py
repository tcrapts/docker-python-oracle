import pandas as pd
import pyodbc
import os
import cx_Oracle

# configure connection
host = os.environ['DB_HOST']
service_name = os.environ['DB_SERVICE_NAME']
port = os.environ['DB_PORT']
username = os.environ['DB_USERNAME']
password = os.environ['DB_PASSWORD']

# read query
query = 'select * from test_table'
dsn_tns = cx_Oracle.makedsn(host, port, service_name) 
conn = cx_Oracle.connect(username, password, dsn_tns) 
c = conn.cursor()
c.execute(query)
df = pd.DataFrame(c.fetchall())
df.columns = [i[0] for i in c.description]
print(df)