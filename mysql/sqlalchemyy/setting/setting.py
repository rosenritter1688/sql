from sqlalchemy import *
from sqlalchemy.orm import *
from sqlalchemy.ext.declarative import declarative_base

dialect = "mysql"
driver = "mysqldb"
username = "root"
password = "19821205"
host = "localhost"
port = "3306"
database = "sql_intro"
charset_type = "utf8"
db_url = f"{dialect}+{driver}://{username}:{password}@{host}:{port}/{database}?charset={charset_type}"

# DB接続するためのEngineインスタンス
ENGINE = create_engine(db_url, echo=True)
                                                    #? echo=True とすることで、SQLを出力します。

# DBに対してORM操作するときに利用
# Sessionを通じて操作を行う
session = scoped_session(
    sessionmaker(autocommit=False, autoflush=False, bind=ENGINE)
)

# 各modelで利用
# classとDBをMapping
Base = declarative_base()