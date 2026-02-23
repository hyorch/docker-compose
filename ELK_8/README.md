# Elastic 8.8

## Create a policy

```bash
PUT _ilm/policy/Java-Policy
{
  "policy": {
    "phases": {
      "hot": {
        "actions": {
          "rollover": {
            "max_size": "50gb",
            "max_age": "30d"
          }
        }
      },
      "delete": {
        "min_age": "90d",
        "actions": {
          "delete": {}
        }
      }
    }
  }
}
```

## ILM Policy that mantain just monday to friday data

No se puede crear con ILM. Es necesaria programación.

## Apply a policy to an already created index

```bash
PUT java-logs-2025.12.11.17/_settings
{
  "index": {
    "lifecycle": {
      "name": "Java-Policy"
    }
  }
}
```

## ReIndex. Copy documents to other index

```bash

POST _reindex?wait_for_completion=true
{
  "source": {
    "index": "python-logs-2026.02.23.16"
  },
  "dest": {
    "index": "python-logs-2026"
  }
}
```
