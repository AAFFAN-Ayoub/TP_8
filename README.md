### Copie le code ci-dessous :

````markdown
# 🌍 Hello World Dapp

Une Application Décentralisée (DApp) simple développée avec **Flutter** et **Solidity**. 
Ce projet permet d'interagir avec une blockchain Ethereum locale pour lire et modifier un état (un nom) stocké dans un Smart Contract.

## 🚀 Fonctionnalités

- **Lecture de la Blockchain :** Récupère et affiche le nom stocké actuellement dans le contrat ("Hello [Nom]").
- **Écriture sur la Blockchain :** Envoie une transaction pour modifier le nom.
- **Gestion d'État :** Indicateur de chargement pendant la validation de la transaction.
- **Intégration Web3 :** Connexion avec le portefeuille MetaMask.

## 🛠 Technologies Utilisées

- **Frontend :** Flutter (Web)
- **Smart Contract :** Solidity
- **Blockchain Locale :** Ganache
- **Wallet :** MetaMask
- **Librairie Dart :** `web3dart` / `http`

## ⚙️ Prérequis

Avant de commencer, assurez-vous d'avoir installé :
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Ganache](https://trufflesuite.com/ganache/) (pour la blockchain locale)
- [Extension MetaMask](https://metamask.io/) sur votre navigateur.

## 📦 Installation et Configuration

### 1. Cloner le projet
```bash
git clone [https://github.com/ton-username/ton-repo.git](https://github.com/ton-username/ton-repo.git)
cd ton-repo
````

### 2\. Configurer la Blockchain (Ganache)

1.  Lancez **Ganache**.
2.  Créez un nouveau workspace (ou utilisez "Quickstart").
3.  Notez le **RPC Server** (ex: `http://127.0.0.1:7545`) et le **Network ID** (ex: `5777`).

### 3\. Déployer le Smart Contract

*(Si tu utilises Truffle ou Hardhat)*

```bash
truffle migrate --reset
# ou
npx hardhat run scripts/deploy.js --network localhost
```

> **Important :** Copiez l'adresse du contrat déployé et mettez-la à jour dans votre fichier Flutter (généralement dans `lib/services/contract_service.dart` ou `main.dart`).

### 4\. Configurer MetaMask

1.  Ajoutez un réseau personnalisé dans MetaMask :
      - **Nom :** Localhost Ganache
      - **RPC URL :** `http://127.0.0.1:7545`
      - **Chain ID :** `1337` (ou `5777` selon votre version de Ganache)
      - **Symbole :** ETH
2.  Importez un compte depuis Ganache (copiez la clé privée d'un compte avec 100 ETH).

### 5\. Lancer l'Application

Lancez l'application sur Chrome :

```bash
flutter run -d chrome --web-port=3000
```

*L'application sera accessible sur `http://localhost:3000`.*

## 📝 Utilisation

1.  Ouvrez l'application dans votre navigateur.
2.  Assurez-vous que MetaMask est connecté au réseau **Localhost Ganache**.
3.  Saisissez un nom dans le champ de texte.
4.  Cliquez sur **"Set Name"**.
5.  MetaMask s'ouvrira pour demander la signature de la transaction.
6.  Une fois confirmée, l'interface se mettra à jour avec "Hello [Votre Nom]".

## 🐛 Problèmes Courants (Troubleshooting)

  - **Chargement infini ?** Vérifiez que vous avez bien confirmé la transaction dans la fenêtre pop-up de MetaMask (parfois cachée).
  - **Erreur RPC ?** Vérifiez que Ganache est bien lancé et que l'URL RPC dans MetaMask correspond exactement à celle de Ganache.
  - **Nonce Error ?** Si vous avez redémarré Ganache, réinitialisez votre compte MetaMask : *Paramètres \> Avancé \> Effacer l'activité de l'onglet*.

-----

Autheur : **AAFFAN Ayoub**
