import requests
#? Requests library also makes it very easy to use proxies that require authentication.

import json 
# coz the website is using web token
# after step 1
# under header tag
# from response headers
#       if has content-type : application/json


# using chrome login the website
# step 1
# go to login page, right click and inspect
# choose network tag
# click Preserve log // must
# click header
# looking under Name(tag) like auth or login  has website's request method : POST
# pchome api link for sign in : https://ecvip.pchome.com.tw/ecapi/member/v3.1/login
# under payload tag 
# "Account":"heaven_in_blue@msn.com","Pwd":"U2FsdGVkX1/L9Mx7pI7GM1i3sVrclbpEif2AcQ7hyvY: 

# if you wont see anything under tag response, that means the website its using json web token
# website uses the web token which "authorization" is null (under tag headers)
# json web token or cookies


def login(mail,password):
    # allow us to presist cookies
    # website using json web token is not needed but its alright,
    # it still doesnt hurt for using that, it works on all website
    s = requests.Session()
    
    
    # define a payload that we send to server
    payload = {
        'Account' : Account,
        'Pwd' : Pwd
    }
    # resquest
    #  if has content-type : application/json(under header tag from response headers)
    # that means we have to send json to the server
    # if content-type is text plain or something else then we can probably to use data attribute
    res = s.post('https://ecvip.pchome.com.tw/ecapi/member/v3.1/login',json=payload)
    # coz this website is using json web token so we also have to update the headers by typing s headers update
    # this is going to be an object and we want to update the authorization which is going to come from the rest response so json loads
    s.headers.update({'authorization': json.loads(res.content)['token']})
    print(res.content)
    return s
session = login('heaven_in_blue@msn.com','s8271911c')


session = login()
#"Account":"heaven_in_blue@msn.com","Pwd":"U2FsdGVkX1/L9Mx7pI7GM1i3sVrclbpEif2AcQ7hyvY: 





