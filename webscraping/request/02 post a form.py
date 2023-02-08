import requests
#! If there is a need for a form to be posted, it can be done easily using the post() method. The form data can sent as a dictionary as follows:

form_data = {'key1': 'value1', 'key2': 'value2'}
response = requests.post("https://oxylabs.io/ ", data=form_data)
print(response.text)