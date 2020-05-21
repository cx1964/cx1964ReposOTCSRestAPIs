# File: working_post_example.py
# bron: https://www.w3schools.com/python/ref_requests_post.asp

import requests

url = 'https://www.w3schools.com/python/demopage.php'
myobj = {'somekey': 'somevalue'}

x = requests.post(url, data = myobj)

#print the response text (the content of the requested file):
print(x)
print(x.status_code)
