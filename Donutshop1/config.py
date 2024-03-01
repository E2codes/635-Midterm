#Will parse ini data so main.py can read data from config.py

from configparser import ConfigParser

def config(filename="database.ini", section="postgresql"):
    #create parser
    parser = ConfigParser()
    #read config file
    parser.read(filename)
    # create empty dictionary
    db = {}
    if parser.has_section(section):
        params = parser.items(section)
        for param in params:
            db[param[0]] = param[1]
    else:
        raise Exception('Section{0} is not founf in {1} file.'.format(section, filename))
    print(db)

config()