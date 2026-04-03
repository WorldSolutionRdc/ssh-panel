# SSH Panel sur Cloud Run

Proxy SSH déployé sur Google Cloud Run vers VPS 159.89.80.171.

## Configuration
| Élément | Valeur |
|---------|--------|
| **VPS cible** | `159.89.80.171:22` |
| **Port d'écoute proxy** | `443` |
| **Région Cloud Run** | `europe-west4` (Amsterdam) |
| **Type de proxy** | TCP Stream (Layer 4) |

## Déploiement
```bash
gcloud builds submit --config cloudbuild.yaml
