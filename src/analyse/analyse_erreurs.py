import json
import pandas as pd
import matplotlib.pyplot as plt
#import matplotlib
#matplotlib.use("TkAgg") 
# marche avec TkAgg, mais pas avec Qt5Agg
# Si ça ne marche pas, essayer de changer le backend de matplotlib
# ou de mettre à jour matplotlib
import seaborn as sns

# Charger le fichier JSON
with open("data/output/analyse/erreurs.json", "r", encoding="utf-8") as f:
    data = json.load(f)

# Convertir en DataFrame
df = pd.DataFrame(data)

# Afficher les premières lignes pour vérification
print("Aperçu des erreurs :")
print(df.head())

# Tracer un histogramme des erreurs par face
plt.figure(figsize=(8, 5))
sns.countplot(data=df, x="face", order=sorted(df["face"].unique()))
plt.title("Nombre d'erreurs par face")
plt.xlabel("Face")
plt.ylabel("Nombre d'erreurs")
plt.tight_layout()
plt.grid(axis="y")
plt.savefig("data/output/analyse/histo_erreurs.png")
plt.show()