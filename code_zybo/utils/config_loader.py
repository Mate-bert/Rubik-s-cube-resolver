import yaml  # Importation du module YAML pour manipuler des fichiers YAML

def load_config(config_path="data/config/config.yaml"):
    # Ouvre le fichier de configuration spécifié en mode lecture avec encodage UTF-8
    with open(config_path, "r", encoding="utf-8") as f:
        # Charge et retourne le contenu du fichier YAML sous forme de dictionnaire Python
        return yaml.safe_load(f)