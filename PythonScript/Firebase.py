import firebase_admin
from firebase_admin import credentials, firestore

cred = credentials.Certificate('testruta-f324b.json')
# Inicializa la aplicación Firebase Admin.
app = firebase_admin.initialize_app(cred)
# Crea un cliente de Firestore.
db = firestore.client()

def getRutas():
    # Recupera los documentos de la colección "RUTA".
    docs = db.collection("RUTA").stream()

    return docs
def ver_documento(id_documento):
    # Obtiene la referencia al documento
    doc_ref = db.collection('RUTA').document(id_documento)

    # Verifica si el documento existe
    if doc_ref.get().exists:

        # Obtiene el documento
        doc = doc_ref.get()

        # Imprime los datos del documento
        print(doc.to_dict())
    else:
        print("El documento no existe")

def show_docs(docs):
    data_json = {}
    for doc in docs:
        data_json[doc.id] = doc.to_dict()
    print(data_json)

# Descomentar para probar la función getRutas y show_docs
docs = getRutas()
show_docs(docs)



