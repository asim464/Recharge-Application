class Config:
    def __init__(self,config):
        self.camera_ip = config['camera']['ip']
        self.camera_password = config['camera']['password']
        self.db_user = config['db_user']['user']
        self.db_password = config['db_user']['password']
        self.db_driver = config['sqlserver']['driver']
        self.db_server = config['sqlserver']['server']
        self.database = config['sqlserver']['database']
        self.host = config['server']['host']
        self.port =config['server']['port']
        self.rfid=config['rfid']['rfid_port']