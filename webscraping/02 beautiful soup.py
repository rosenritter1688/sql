
#* Beautiful Soup
#? part 1 - get the html using requests
import requests
url = "https://oxylabs.io/blog"
response = requests.get(url)
#? part 2 - find element 
                 # title
from bs4 import BeautifulSoup
soup = BeautifulSoup(response.text, 'html.parser')
print(soup.title)
"""
語法剖析器（parser）通常是作為編譯器或直譯器的組件出現的，它的作用是進行語法檢查、
並構建由輸入的單詞組成的資料結構（一般是語法分析樹、抽象語法樹等層次化的資料結構）。
語法剖析器通常使用一個獨立的詞法剖析器從輸入字元流中分離出一個個的「單詞」，並將單詞流作為其輸入。
實際開發中，語法剖析器可以手工編寫，也可以使用工具（半）自動生成。
"""

blog_titles = soup.findAll('h2', attrs={"class":"blog-card__content-title"})
if blog_titles is not None:
    for blog_titles in blog_titles:
        print(title.text)
else:
    print("no data found")

# Output:
# Prints all blog tiles on the page

for blog_titles in blog_titles:
    print(title.text)