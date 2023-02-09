from models.user import *
from setting.setting import session
users = session.query(User).all()
for user in users:
    print(f'{user.name} {user.email} {user.age}')