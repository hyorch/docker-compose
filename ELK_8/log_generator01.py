from datetime import datetime, timedelta
import time
from elasticsearch import Elasticsearch
import random
import string
from dotenv import load_dotenv
import os

load_dotenv()

# Configuración de conexión con Elasticsearch 8.x
# Al tener xpack.security.enabled=false, usamos http básico.
#es = Elasticsearch(hosts="http://localhost:9200")
# tener xpack.security.enabled=true
es = Elasticsearch(hosts="http://localhost:9200", basic_auth=(os.getenv("ELASTIC_USER"), os.getenv("ELASTIC_PASSWORD")))

# Verificación de conexión
if es.ping():
    print("Conexión exitosa a Elasticsearch 8!")
else:
    print("No se pudo conectar a Elasticsearch. Asegúrate de que el contenedor esté corriendo en el puerto 9200.")

base_index_name_01 = "python-logs"

print(f"Comenzando generador de logs. Enviando a índices cada 30 segundos...")

while True:
    try:
        # Generar nombre del índice con fecha actual: python-logs-2023-10-27
        index_name01 = f"{base_index_name_01}-{datetime.now().strftime('%Y.%m.%d.%H')}"
       
        # En la versión 8.x del cliente, se usa el parámetro 'document' en lugar de 'body'
        doc = {            
            "@timestamp": (datetime.now() - timedelta(hours=1)).isoformat(),
            "message": "Log generado automáticamente por script Python para Elastic 8",            
            "random_number": random.randint(1, 100),           
            "random_text": "".join(random.choices(string.ascii_letters, k=10)),            
            "level": random.choices(["INFO", "WARNING", "ERROR", "CRITICAL"], weights=[69, 25, 5, 1])[0],
            "service": "python-gen"
        }

        #print(doc)
        # Insertar documento
        resp01 = es.index(index=index_name01, document=doc)
          
        # En la v8, la respuesta es un ObjectApiResponse que permite acceso tipo dict
        print(f"[{doc['@timestamp']}] Log enviado. ID: {resp01['_id']} | Resultado: {resp01['result']}")    
     
    except Exception as e:
        print(f"Error enviando log: {e}")

    time.sleep(30)
