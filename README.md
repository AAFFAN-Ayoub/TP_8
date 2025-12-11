# TP_8

# Projet DApp Hello World (Flutter & Solidity)

Ce projet est une **Application Décentralisée (DApp)** basique qui démontre l'intégration d'un front-end mobile développé en **Flutter** avec un Contrat Intelligent (Smart Contract) écrit en **Solidity** et déployé sur une blockchain locale Ethereum.

L'objectif principal était de maîtriser la chaîne d'outils de développement Ethereum (Truffle et Ganache) et de réaliser la liaison (Contract Linking) permettant au mobile d'interagir avec les données *on-chain*.

## 🚀 Caractéristiques du Projet

L'application implémente un mécanisme simple de lecture et d'écriture sur la blockchain :
*   **Contrat Intelligent `HelloWorld.sol` :** Définit une variable d'état publique, `yourName`, initialisée à `"Unknown"` via le constructeur.
*   **Lecture des Données :** La DApp récupère et affiche la valeur actuelle de `yourName` depuis le contrat.
*   **Écriture des Données :** L'utilisateur peut mettre à jour la valeur de `yourName` en envoyant une transaction à la fonction `setName(string memory nm)` du contrat intelligent.

## 🛠️ Technologies et Outils Utilisés

| Composant | Technologie/Langage | Rôle | Source |
| :--- | :--- | :--- | :--- |
| **Front-end / UI** | Flutter & Dart | Interface mobile décentralisée (DApp) | |
| **Blockchain Locale** | **Ganache** | Blockchain personnelle pour le développement et l'exécution des tests | |
| **Smart Contract** | **Solidity** | Langage de programmation du contrat `HelloWorld` | |
| **Framework** | **Truffle Suite** | Environnement de développement, compilation et migration des contrats Ethereum | |
| **Liaison Contrat (Dart)** | `web3dart` / `provider` | Permet la connexion au nœud RPC Ganache (`http://127.0.0.1:7545`) et l'envoi de transactions signées par la clé privée du compte de développement | |

## ⚙️ Environnement de Développement et Déploiement

Le workflow de développement est structuré autour du framework Truffle :

1.  **Préparation de l'environnement :** Installation de Node.js et de **Truffle** (`npm install -g truffle`).
2.  **Initialisation du Projet :** Création du projet Truffle (`truffle init`) au sein du répertoire Flutter. Les répertoires `contracts/`, `migrations/`, et `test/` sont créés.
3.  **Contrat (Solidity) :** Le contrat `HelloWorld.sol` est écrit dans le répertoire `contracts/`.
4.  **Compilation et Migration :**
    *   Le contrat est compilé (`truffle compile`).
    *   L'environnement Ganache est démarré, créant une blockchain locale généralement sur le port 7545.
    *   Le fichier `truffle-config.js` est configuré pour définir les paramètres du réseau de développement et spécifier le répertoire de construction des artefacts (`./src/artifacts/`).
    *   Le contrat est déployé sur Ganache (`truffle migrate`).
5.  **Tests (JavaScript) :** Des tests unitaires sont écrits dans le répertoire `test/` pour vérifier que les fonctions du contrat (comme `setName`) fonctionnent correctement en utilisant l'assertion.
6.  **Intégration Flutter :** Le fichier `contract_linking.dart` est utilisé pour :
    *   Lire l'**ABI** et l'adresse du contrat à partir du fichier `HelloWorld.json` (artefact).
    *   Établir la connexion au client RPC Ganache.
    *   Utiliser la **clé privée** du compte Ganache pour signer les transactions envoyées lors de l'appel de la fonction `setName`.

Ce projet représente une démonstration fonctionnelle de la manière dont les applications mobiles peuvent interagir directement avec les données immuables de la blockchain Ethereum via un contrat intelligent.
