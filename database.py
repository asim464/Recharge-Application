import pyodbc as odbc


class Database:
    def __init__(self, config):
        self.config = config

    def connect(self):
        try:
            connection_string = 'Driver={%s};Server=%s;Database=%s;UID=%s;PWD=%s' % (
                self.config.db_driver, self.config.db_server,
                self.config.database, self.config.db_user,
                self.config.db_password
            )
            conn = odbc.connect(connection_string)
            return conn
        except Exception as e:
            print(e)
            return None


    def selectQuery(self,querry,values=None):
        conn = self.connect()
        cursor = conn.cursor()
        if values is None:
            cursor.execute(querry)
        else:
            cursor.execute(querry,values)
        desc = cursor.description
        column_names = [col[0] for col in desc]
        data = [dict(zip(column_names, row))
                for row in cursor.fetchall()]
        return data

    def updateQuery(self,querry,values):
        conn = self.connect()
        cursor = conn.cursor()
        cursor.execute(querry,values)
        conn.commit()




# self.camera_ip = config['camera']['ip']
#         self.camera_password = config['camera']['password']
#         self.db_user = config['db_user']['user']
#         self.db_password = config['db_user']['password']
#         self.db_driver = config['sqlserver']['driver']
#         self.db_server = config['sqlserver']['server']
#         self.database = config['sqlserver']['database']
#         self.host = config['server']['host']
#         self.port =config['server']['port']

# connection_string = 'Driver={%s};Server=%s;Database=%s;UID=%s;PWD=%s' % (
#                     self.config['sqlserver']['driver'], self.config['sqlserver']['server'],
#                     self.config['sqlserver']['database'], self.config['db_user']['user'],
#                     self.config['db_user']['password']
#                 )
# cnxn = odbc.connect(
#     r'Driver=ODBC Driver 17 for SQL Server;Server=.\SQLEXPRESS01;Database=recharge_db;Trusted_Connection=yes;')
# cursor = cnxn.cursor()
#
#
# def connect(self):
#     try:
#         def connect(self):
#             try:
#                 connection_string = 'Driver={%s};Server=%s;Database=%s;UID=%s;PWD=%s' % (
#                     self.config['sqlserver']['driver'], self.config['sqlserver']['server'],
#                     self.config['sqlserver']['database'], self.config['db_user']['user'],
#                     self.config['db_user']['password']
#                 )
#                 conn = pyodbc.connect(connection_string)
#                 return conn
#             except Exception as e:
#                 self.logging.error(e)
#                 return None
#         conn = pyodbc.connect(connection_string)
#         return conn
#     except Exception as e:
#         self.logging.error(e)
#         return None