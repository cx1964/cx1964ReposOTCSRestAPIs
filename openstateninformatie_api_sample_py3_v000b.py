# filenaam:         openstateninformatie_api_sample_py3_v000b.py
# Functie:          Voorbeeld hoe mbv de api van open StatenInformatie of open raadsinformatie
#                   in python3 open data opgevraagd kan worden.
#                   Dit voorbeeld vraagt informatie op over vergaderingen.
#
#                   Voorbeeld api call
#                   
#                   curl -i -XPOST 'http://api.openraadsinformatie.nl/v0/search' -d '{"query": "vergadering", "size": 5}'
#                   zie https://curl.trillworks.com/ 
#                   tbv omzetten van curl naar python request. Roep de url naar trillworks.com aan via chrome browser
#
#                   Zie: http://docs.openraadsinformatie.nl/user/api.html
#
# Ptyhon version:   3.X
#                   
# Achtergrond mbt http request: https://www.tutorialspoint.com/http/http_requests.htm                 
#
# command:          python3 openstateninformatie_api_sample_py3_v000.py

# Tbv om webservices obv een API aan te roepen
import requests
import json
import yaml

def recursivePrintJSONDict (jsonDict):
# 
  if (not isinstance(jsonDict,dict)):
    print("Fout invoer. Inputdata heeft geen JSON format")
    exit(1)
  else: 
    print("{") 
    #print("else jsonDict is een dict")
    for element in jsonDict:
      elementValue = jsonDict[element]
      if (not isinstance(elementValue,dict)):
        #print("elementValue is nu geen dict")
        output = "'%s':'%s'" % (element, elementValue)
        print(output) 
      else:

        print("'%s':" % element)
        recursivePrintJSONDict(elementValue) 
  print("}") 
# END recursivePrintJSONDict




### input ####
aantalRecords = 1  
# serviceurl = 'http://api.openraadsinformatie.nl/v0/search' of 'http://api.openstateninformatie.nl/v0/search'
serviceurl = 'http://api.openstateninformatie.nl/v0/search' 
### input ###


# *** nieuw ***
# specificeer de parameters van de post van het request
payload = {"query": "vergadering", "size": aantalRecords} # de json parameters van de api
print('payload type:',type(payload))
# headers = {'content-type': 'application/json'}
# *** nieuw ***

# debug print("serviceurl: ", serviceurl)

try:
    # response = urlopen(uh)
    response = requests.post(serviceurl, data=json.dumps(payload)) #, headers=headers)
except HTTPError as e:
    # do something
    print('Error code: ', e.code)
except URLError as e:
    # do something
    print('Reason: ', e.reason)
else:
    # do something
    print('good!')

print('Encoding van response:', response.encoding)
print('response.headers.get:', response.headers.get('content-type'))

# Print de response als text 
#print(response.text)

# debug print(response.content) # werkt; dit bevat de inhoud

# Zet response om in een JSON format 
data = response.content
print("nog OK")

js = json.loads(data)
print("hier")
# debug print(js)
# debug print(json.dumps(js, indent=4)) # hiermee kan men de keys vinden in het bericht   
# print(json.dumps(js, indent=4))


# interpreteer de response in JSON format
print("type(data):", type(data))
print("input: %s\n" % (data))

data_dict=yaml.load(data)
print("type(inpt):", type(data_dict))

if (isinstance(data_dict,dict)):
   # pak eerst uit tot list
   inpt_list = data_dict["events"]
   tel=0
   for item in inpt_list:
     tel=tel+1  
     #print("type(item):", type(item))
     print("Record %d:" % (tel))
     recursivePrintJSONDict(item)
     print(" ")
else:
   # geen dict error
   print("Invoer fout: input is geen JSON file")

print("Klaar")
