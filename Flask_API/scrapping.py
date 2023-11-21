import requests
from bs4 import BeautifulSoup

# Hacer la solicitud a la API de Flask
url = 'http://localhost:5000/api?Query=Avenida Consistorial 2508, Peñalolén&Query=Avenida Pedro de Valdivia 2257, Providencia&Query=Paicaví 2721, La Florida&Query=Av. José Pedro Alessandri 1166, Ñuñoa&Query=Nueva Bilbao 9495, Las Condes'
response = requests.get(url)

# Verificar si la solicitud fue exitosa (código de respuesta 200)
if response.status_code == 200:
    # Analizar el contenido JSON de la respuesta
    data = response.json()

    # Obtener las direcciones del JSON
    direcciones = [item['Direccion'] for item in data['Direcciones']]

    # Ahora puedes procesar las direcciones según tus necesidades
    for direccion in direcciones:
        print("Dirección:", direccion)
        
        # Aquí puedes realizar el web scraping específico para cada dirección
        # Por ejemplo, puedes usar BeautifulSoup para analizar el HTML de la página asociada a cada dirección
        # y extraer información adicional.

else:
    print(f"Error en la solicitud: {response.status_code}")
