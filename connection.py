from configparser import ConfigParser
from database import Database
from config import Config
config = ConfigParser()
config.read("config.ini")
config = Config(config)
database = Database(config)

cnxn = database.connect()
cursor = cnxn.cursor()

