# SSH Panel sur Cloud Run

Proxy SSH déployé sur Google Cloud Run vers VPS 159.89.80.171 (New York).

## Configuration
| Élément | Valeur |
|---------|--------|
| **VPS cible** | `159.89.80.171:22` |
| **Port d'écoute proxy** | `443` |
| **Région Cloud Run** | `europe-west1` (Belgique) |
| **Type de proxy** | TCP Stream (Layer 4) |

## Déploiement
```bash
gcloud builds submit --config cloudbuild.yaml
