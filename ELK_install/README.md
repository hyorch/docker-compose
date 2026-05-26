# Install ELK

Script de Elasti para instalar con Docker Compose
https://github.com/elastic/start-local



https://www.elastic.co/docs/deploy-manage/deploy/self-managed/install-elasticsearch-docker-basic

Ejecutar primero Elasticsearch y obtener el password y token.

```bash
docker exec -it elasticsearch /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic
docker exec -it elasticsearch /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana
```

Ejecutar luego Kibana, sin parámetros que apunten a Elasticsearch, ya que van en el enrollment token. Pegar el token.

## Insert ELK

curl -X POST http://localhost:9200/_bulk?pretty   -H "Content-Type: application/json"   -d'
{ "index" : { "_index" : "demo_index" } }
{"name": "fooooo", "title": "bar3" }'

curl -X POST http://localhost:9200/demo_index/_doc   -H "Content-Type: application/json"   -d'
{"name": "paco", "title": "bar3 ", "comentario": "me ha gustado nada", "score":8 }'


curl -X POST http://localhost:9200/demo_index/_doc   -H "Content-Type: application/json" -d @salida.json




## Docs
https://www.elastic.co/docs/deploy-manage/deploy/self-managed/install-elasticsearch-docker-basic

