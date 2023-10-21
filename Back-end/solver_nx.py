import networkx as nx

# Define las coordenadas de los puntos en forma de diccionario {nodo: (x, y)}
coordenadas = {
    'A': (-33.4990878, -70.5520428),
    'B': (-33.5079795, -70.5496573),
    'C': (-33.4322916, -70.530344),
    'D': (-33.4448865, -70.6548558)
}

# Crea un grafo completo con distancias euclidianas como pesos de las aristas
G = nx.Graph()
for nodo1, coord1 in coordenadas.items():
    for nodo2, coord2 in coordenadas.items():
        #print(nodo1, nodo2)
        #print(coord1, coord2)
        if nodo1 != nodo2:
            distancia = ((coord1[0] - coord2[0])**2 + (coord1[1] - coord2[1])**2) ** 0.5
            G.add_edge(nodo1, nodo2, weight=distancia)

# Encuentra una ruta aproximada usando el algoritmo del vecino más cercano
ruta_aproximada = nx.approximation.traveling_salesman_problem(G, cycle=True)

# Imprime la ruta aproximada
print("Ruta aproximada:", ruta_aproximada)

#print(coordenadas.items())
#print(G.edges.data())