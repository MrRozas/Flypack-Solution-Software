from flask import Flask, request, jsonify
from shortest_route import GeoStart, readDirections, getInformatioGraph, permute, getRoute, getOutput
from concurrent.futures import ThreadPoolExecutor
from flask_cors import CORS

#Reference: https://www.youtube.com/watch?v=P6AwCCvGC58&list=PLzgsCkb9XeHw94H-25lf3FPGHNgdlP0Ri&ab_channel=TopTutorial

# Función que inicia el programa
def StartProgram(direcciones):
    graph, geolocator = GeoStart()
    #a = readDirections()
    # Añadir ", Provincia de Santiago, Chile" a cada elemento de la lista
    direcciones = [direccion + ", Provincia de Santiago, Chile" for direccion in direcciones]
    nodes_in_route, diccionario = getInformatioGraph(direcciones, graph, geolocator)
    permutations = permute(nodes_in_route)
    best_route = getRoute(permutations, nodes_in_route, graph)
    output = getOutput(best_route, diccionario)
    #print(output)
    return output

app = Flask(__name__)
CORS(app)
executor = ThreadPoolExecutor()

@app.route('/api', methods=['GET'])
def route():
    queries = request.args.getlist('Query')
    response_data = {'Direcciones': []}

    future = executor.submit(StartProgram, queries)

    try:
        # Obtener el resultado de la función después de que se complete
        resultado = future.result()  # Sin límite de tiempo
        for query in resultado:
            data = {'Direccion': query}
            # Aquí puedes realizar cualquier procesamiento adicional según tu lógica
            response_data['Direcciones'].append(data)

        # Establecer la codificación UTF-8 al serializar la respuesta JSON y desactivar escape de caracteres especiales
        response = jsonify(response_data)
        response.headers['Content-Type'] = 'application/json; charset=utf-8'

        # Convertir la respuesta a una cadena y decodificarla
        json_str = response.get_data(as_text=True)
        json_str = json_str.encode('utf-8').decode('unicode-escape')

        # Crear una nueva respuesta con la cadena decodificada
        response = app.response_class(
            response=json_str,
            status=200,
            mimetype='application/json; charset=utf-8'
        )

        return response
    except Exception as e:
        return jsonify({'status': f'Error: {str(e)}'})

if __name__ == '__main__':
    app.run()