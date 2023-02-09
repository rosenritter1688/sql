from sqlalchemy import Column, Integer, String, DateTime, Sequence
from setting.setting import ENGINE, Base     #? import from mysql\sqlalchemy\setting.py


from datetime import datetime



class User(Base):
    """
    emp_detail_model
    """
    __tablename__ = 'emp_details'
    id = Column(Integer, Sequence('emp_details_seq'), primary_key=True)
    name = Column(String(50))
    #email = Column(String(255))
    age = Column(Integer)
    sex = Column(String(1))
    doj = Column(DateTime)
    city = Column(String(50))
    # created_at = Column('created', DateTime, default=datetime.now, nullable=False)
    # updated_at = Column('modified', DateTime, default=datetime.now, nullable=False)


def main(args):
    Base.metadata.create_all(bind=ENGINE)


if __name__ == "__main__":
    main(sys.argv)