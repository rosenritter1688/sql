from requests import Session
from bs4 import BeautifulSoup as bs
 
with Session() as s:
    site = s.get("http://quotes.toscrape.com/login")   #chrome Request URL: https://quotes.toscrape.com/login from network-> headers -> "General" , Request URL: https://quotes.toscrape.com/login
    #print(site.content)                                #firefox ) network tag -> headers tag -> request headers -> referer: http://quotes.toscrape.com/login

# code above will print out the content of the login page b4 we login

# Next, we would search for the csrf_token keyword which was found as one of the parameters 
# when using the network tab earlier. If the keyword shows a match with an input tag, 
# then the value can be extracted every time you run the script using BeautifulSoup.

    bs_content = bs(site.content, "html.parser")
    token = bs_content.find("input", {"name":"csrf_token"})["value"]
    login_data = {"username":"admin","password":"12345", "csrf_token":token}
    s.post("http://quotes.toscrape.com/login",login_data)
    home_page = s.get("http://quotes.toscrape.com")
    print(home_page.content)