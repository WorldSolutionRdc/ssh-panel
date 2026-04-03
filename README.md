# SSH Panel sur Cloud Run

Proxy SSH déployé sur Google Cloud Run vers VPS 165.227.234.179 (Londres).

## Configuration
| Élément | Valeur |
|---------|--------|
| **VPS cible** | `165.227.234.179:22` |
| **Port d'écoute proxy** | `443` |
| **Région VPS** | `europe-west2` (Londres, UK) |
| **Région Cloud Run** | `europe-west2` (Londres, UK) |
| **Type de proxy** | TCP Stream (Layer 4) |

## Déploiement
```bash
gcloud builds submit --config cloudbuild.yaml
