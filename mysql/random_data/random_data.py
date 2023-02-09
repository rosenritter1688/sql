import random
import datetime

today = datetime.date.today()
# print(today)

def random_date():
  start_date = datetime.date(1960, 1, 1)
  end_date = datetime.date.today()
  time_between_dates = end_date - start_date
  ## use .days 
  ## start_date and end_date 日付の間隔を求める in day
  days_between_dates = time_between_dates.days
  
  random_number_of_days = random.randrange(days_between_dates)
  random_date = start_date + datetime.timedelta(days=random_number_of_days)
  return random_date.strftime("%Y-%m-%d")    ## %y will only return last 2 digits of the year



# 26 names
names_list = [
    "James",
    "Mary",
    "Robert",
    "Patricia",
    "John",
    "Jennifer",
    "Michael",
    "Linda",
    "Elizabeth",
    "David",
    "Barbara",
    "William",
    "Richard",
    "Susan",
    "Joseph",
    "Jessica",
    "Thomas",
    "Sarah",
    "Charles",
    "Karen",
    "Christopher",
    "Lisa",
    "Daniel",
    "Nancy",
    "Betty",
    "Matthew"
]
#print(len(names_list))




gender_sex = ["F","M"]


dep = [
    "Marketing","Finance","Operations management","Human Resource","IT","PR"
]

citys = [
    
    "New York City",
    "Los Angeles",
    "Chicago",
    "Houston",
    "Phoenix",
    "Philadelphia",
    "San Antonio",
    "San Diego",
    "Dallas",
    "San Jose"

]

    # Emp_ID int PRIMARY KEY,
    # Emp_name VARCHAR(25),
    # Age INT,
    # Geder CHAR(1),
    # Doj date,
    # Dept VARCHAR(20),
    # City VARCHAR(15),
    # Salary float

employees_list = []
employee_list=[]
# emp_id starts by Emp_ID = 10000
Emp_ID = 10000
for i in range(10):
    employee_list.append(names_list.pop())           # getting names from the last element FYI pop() will change the original list, so last one will be deleted
    employee_list.append(Emp_ID)                                         #  
    Emp_ID += 1                                                                               # for next id so need to plus 1
    employee_list.append(random.randint(18,70))            # random age from age 18 ~ 70
    employee_list.append(random.choice(gender_sex))  # random gender
    employee_list.append(random_date())              # using def random_date 
    employee_list.append(random.choice(dep))
    employee_list.append(random.choice(citys))
    employee_list.append(random.randint(3,10) * 10_000)
    
    employees_list.append(employee_list)  ## update date to employees_list
    employee_list = [] ## reset list for refresh data

print(employees_list)
    


