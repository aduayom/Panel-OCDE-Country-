# Impact de la Globalisation et des Inégalités de Revenu sur la Santé

### Analyse de Données de Panel | 1999-2021 | Pays de l'OCDE

## 📋 Description du Projet

Ce projet vise à analyser l'impact des inégalités de revenus, amplifiées par la mondialisation, sur la santé des populations dans les pays de l'OCDE entre 1999 et 2021. En utilisant des données de panel, nous étudions l'effet des inégalités de revenu, de la globalisation, et d'autres variables démographiques et socio-économiques sur l'espérance de vie à la naissance (ESP) ainsi que sur des indicateurs alternatifs de santé (tels que le taux de mortalité infantile pour des tests de robustesse).

## 🎯 Objectif

L'objectif principal est de démontrer comment les inégalités de revenu, exacerbées par la mondialisation, affectent le bien-être des populations, mesuré par l'espérance de vie dans des pays développés. Ce projet permet également d'étudier l'influence de facteurs socio-économiques tels que le PIB par tête, le taux de chômage, l'éducation, et la nutrition.

## 🗂️ Données

### Échantillon
- **Pays** : Membres de l'Organisation de Coopération et de Développement Économiques (OCDE)
- **Période** : 1999 - 2021

### Variables

#### Variable Dépendante
- **Santé**  
  - **ESP** : Espérance de vie à la naissance

#### Variables Explicatives Principales
1. **Inégalité de revenu**  
   - **Ineq** : Indice de Gini (entre 0 et 1, où des valeurs proches de 0 indiquent des inégalités plus faibles)
   
2. **Globalisation**  
   - **Glo** : Indice de globalisation KOF

#### Variables de Contrôle
- **Démographie**  
  - **Crpop** : Taux de croissance démographique (%)
  - **Upop** : Part de la population urbaine (%)

- **Revenu**  
  - **PIBt** : PIB par tête courant en parité de pouvoir d'achat (PPA)

- **Emploi**  
  - **Cho** : Taux de chômage

- **Éducation**  
  - **Educ** : Pourcentage d'adultes (25-64 ans) ayant un niveau d'éducation inférieur au second cycle du secondaire

- **Nutrition**  
  - **Nutri** : Nombre de kilocalories consommées par an par personne
  - **Alc** : Nombre de litres d'alcool consommés par an par personne

#### Tests de Robustesse
- **TMI** : Taux de mortalité infantile (utilisé comme variable alternative pour tester la robustesse des résultats obtenus pour l'ESP)

## 🛠️ Méthodologie

1. **Analyse Descriptive** : Exploration et visualisation initiale des variables pour comprendre leur distribution et détecter d'éventuelles anomalies.
2. **Modélisation de Données de Panel** : Utilisation de modèles de données de panel (effets fixes et aléatoires) pour évaluer l'impact des inégalités de revenu et de la globalisation sur la santé.
3. **Tests de Robustesse** : Analyse de l'impact des inégalités de revenu sur d'autres indicateurs de santé (comme le taux de mortalité infantile).
4. **Visualisation** : Création de graphiques pour visualiser les tendances dans le temps et entre les différents pays.

## 🧩 Pré-requis et Installation

Ce projet utilise le langage R et les packages suivants :

- `tidyverse` : Manipulation et visualisation de données
- `plm` : Modélisation de données de panel
- `ggplot2` : Visualisation des données
- `dplyr` : Manipulation de données
- `broom` : Résumé et visualisation des résultats de modèles statistiques

Pour installer ces packages, exécutez dans R :

```r
install.packages(c("tidyverse", "plm", "ggplot2", "dplyr", "broom"))
