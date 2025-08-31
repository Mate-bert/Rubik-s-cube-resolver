import json
import pandas as pd
import matplotlib.pyplot as plt
#import matplotlib
#matplotlib.use("TkAgg") 
# marche avec TkAgg, mais pas avec Qt5Agg
# Si ça ne marche pas, essayer de changer le backend de matplotlib
# ou de mettre à jour matplotlib
import seaborn as sns
import sys
from pathlib import Path

# Ajouter le chemin du répertoire parent au PATH pour importer des modules personnalisés
sys.path.append(str(Path(__file__).resolve().parents[2]))

# Importer une fonction utilitaire pour charger la configuration
from utils.config_loader import load_config

# Charger la configuration depuis un fichier
cfg = load_config()

# Charger le fichier JSON contenant les erreurs
with open(cfg["paths"]["error_json"], "r", encoding="utf-8") as f:
    data = json.load(f)

# Convertir les données JSON en DataFrame pour une manipulation plus facile
df = pd.DataFrame(data)

# Afficher un aperçu des premières lignes du DataFrame pour vérifier les données
print("Aperçu des erreurs :")
print(df.head())

# Tracer un histogramme pour visualiser le nombre d'erreurs par face
plt.figure(figsize=(8, 5))  # Définir la taille de la figure
sns.countplot(data=df, x="face", order=sorted(df["face"].unique()))  # Tracer un countplot avec les faces triées
plt.title("Nombre d'erreurs par face")  # Ajouter un titre au graphique
plt.xlabel("Face")  # Ajouter un label pour l'axe X
plt.ylabel("Nombre d'erreurs")  # Ajouter un label pour l'axe Y
plt.tight_layout()  # Ajuster automatiquement les marges
plt.grid(axis="y")  # Ajouter une grille sur l'axe Y
plt.savefig(cfg["paths"]["error_img"])  # Sauvegarder le graphique dans un fichier
plt.show()  # Afficher le graphique