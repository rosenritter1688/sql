import pandas as pd
from bs4 import BeautifulSoup
from selenium import webdriver
# using whereis google-chrome-stable  
#             which
driver = webdriver.Chrome(executable_path='/usr/bin/google-chrome-stable')
driver.get('https://biggo.com.tw/s/?q=S2721DGF')

# Object is “results”, brackets make the object an empty list.
# We will be storing our data here.
results = []

# Add the page source to the variable `content`.
content = driver.page_source
# Load the contents of the page, its source, into BeautifulSoup 
# class, which analyzes the HTML as a nested data structure and allows to select
# its elements by using various selectors.
soup = BeautifulSoup(content)