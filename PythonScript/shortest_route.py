import osmnx as ox
import networkx as nx
from geopy.geocoders import Nominatim
import itertools

'''
Referencias: 
https://github.com/gboeing/osmnx-examples/blob/v0.13.0/notebooks/02-routing-speed-time.ipynb
https://geoffboeing.com/2016/11/osmnx-python-street-networks/
https://github.com/gboeing/osmnx-examples/blob/main/notebooks/02-routing-speed-time.ipynb
https://nominatim.openstreetmap.org/ui/search.html
'''
# Función que crea el grafo y el geocoder
def GeoStart():
    # Configura el lugar de búsqueda, por ejemplo, una ciudad o coordenadas GPS.
    place_name = "Provincia de Santiago, Chile"
    graph = ox.graph_from_place(place_name, network_type="drive")
    #graph = ox.project_graph(graph)

    # Crear un objeto geocoder
    geolocator = Nominatim(user_agent="Flypack")
    return graph, geolocator

# Función que lee las direcciones
def readDirections():
    # Leer las direcciones
    with open("directions.txt", "r", encoding="utf-8") as f:
        direcciones = [line.rstrip('\n') for line in f]
    return direcciones

# Función que obtiene la información del grafo, le añade los nodos en base a latitud y longitud de las direcciones, y crea un diccionario que asocia los nodos con las direcciones
def getInformatioGraph(direcciones, graph, geolocator):
    # Encuentra el nodo más cercano a cada dirección intermedia
    nodes_in_route = []
    recognize = []

    for i in direcciones:
        location = geolocator.geocode(i)
        node = ox.distance.nearest_nodes(graph, X=location.longitude, Y=location.latitude)
        nodes_in_route.append(node)
        recognize.append([i, node])
        #print(i, location.longitude, location.latitude, node)
    recognize.append(recognize[0])

    # Se crea un diccionario que asocia los nodos con las direcciones
    nombres = []
    nodo_asociado = []
    for i in recognize:
        nombres.append(i[0])
        nodo_asociado.append(i[1])
    diccionario = dict(zip(nodo_asociado, nombres))
    return nodes_in_route, diccionario

# Función que obtiene las posibles combinaciones de direcciones intermedias
def permute(nodes_in_route):
    # Posibles combinaciones de direcciones intermedias
    permutations = list(itertools.permutations(nodes_in_route[1:]))
    #print(direcciones[1:])
    return permutations

# Función que obtiene la mejor ruta
def getRoute(permutations, nodes_in_route, graph):
    # Encuentra la ruta más corta entre las direcciones intermedias
    best_lenght = float("inf")
    for perm in permutations:
        origin = nodes_in_route[0]
        route = 0
        for i in perm:
            destination = i
            route += nx.shortest_path_length(graph, origin, destination, weight="length")
            origin = destination
        destination = nodes_in_route[0]
        route += nx.shortest_path_length(graph, origin, destination, weight="length")

        if best_lenght == 0:
            best_lenght = route
            best_route = perm

        if route < best_lenght:
            best_lenght = route
            best_route = perm

    best_route = [nodes_in_route[0]] + list(best_route) + [nodes_in_route[0]]
    #print(best_lenght, best_route)
    return best_route

# Función que imprime las direcciones intermedias en la mejor ruta
def getOutput(best_route, diccionario):
    output = []

    # Imprime las direcciones intermedias en la mejor ruta.
    #print("Direcciones de la Mejor Ruta en orden:")
    for h in best_route:
        if h in diccionario:
            nombre_asociado = diccionario[h]
            output.append(nombre_asociado)
            #print(f"{nombre_asociado}")
    return output



#StartProgram(['Avenida Consistorial 2508, Peñalolén', 'Avenida Pedro de Valdivia 2257, Providencia' ,'Paicaví 2721, La Florida' ,'Av. José Pedro Alessandri 1166', 'Nueva Bilbao 9495, Las Condes'])