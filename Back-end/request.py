import requests
from pprint import pprint

#https://nominatim.org/release-docs/latest/api/Search/

BASE_URL = "https://nominatim.openstreetmap.org/search?format=json"

direccion = "2508 Avenida Consistorial, Peñalolén, Santiago, Chile"
coordinates = "-33.4990878, -70.5520428"

response = requests.get(f"{BASE_URL}&q={coordinates}")
print(response.json())

lat = response.json()[0]["lat"]
lon = response.json()[0]["lon"]

print(lat)
print(lon)