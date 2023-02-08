import requests
"""
Requests library provides easy methods for sending HTTP GET and POST requests. 
For example, the function to send an HTTP Get request is aptly named get():
"""
response = requests.get("https://oxylabs.io/")## website
print(response.text)






# But this library has a limitation in that it does not parse the extracted HTML data, i.e., 
# it cannot convert the data into a more readable format for analysis. Also, it cannot be used to scrape websites that are written using purely JavaScript.





