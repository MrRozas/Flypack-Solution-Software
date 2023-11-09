from geopy.geocoders import Nominatim

# Crear un objeto geocoder
geolocator = Nominatim(user_agent="Flypack")

# Dirección que quieres geocodificar
direccion = "2508 Avenida Consistorial, Peñalolén, Santiago, Chile"

direcciones = [
    "2508 Avenida Consistorial, Peñalolén, Santiago, Chile",
    "5541 De Las Amapolas, Peñalolén, Santiago, Chile",
    "9500 Valenzuela Puelma, La Reina, Santiago, Chile",
]

item = [] # Lista vacía que contendrá las direcciones y sus coordenadas

# Geocodificar la dirección
for direccion in direcciones:
    location = geolocator.geocode(direccion) # Geocodificar la dirección
    if location is not None: # Si se encontró la dirección
        latitud = location.latitude # Obtener la latitud
        longitud = location.longitude # Obtener la longitud
        item.append([direccion, latitud, longitud]) # Agregar a la lista
    else:
        print("No se encontró la dirección.")

print(f"{item[0][0]}, {item[0][1]}, {item[0][2]}")
print(f"{item[1][0]}, {item[1][1]}, {item[1][2]}")
print(f"{item[2][0]}, {item[2][1]}, {item[2][2]}")

#Este código es para encontrar las latitudes y longitudes de las direcciones que se encuentran en la lista direcciones usando la API de Nominatim.