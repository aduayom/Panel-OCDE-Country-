# Modèle GMM (Méthode des moments généralisés)
# -------------------------------------------
# Le modèle GMM est utilisé pour estimer les relations dynamiques dans des données de panel,
# en tenant compte des problèmes d'endogénéité, d'hétéroscédasticité et/ou d'autocorrélation.
# 
# Fonctionnement :
# 1. Les variables explicatives potentiellement endogènes sont instrumentées avec leurs propres retards.
#    - Par exemple, la variable dépendante (ESP) est instrumentée par ses valeurs retardées.
# 2. GMM différencié (Diff-GMM) : Élimine les effets fixes individuels en prenant les différences.
#    - Avantage : Corrige pour l'endogénéité et les biais d'effets fixes.
# 3. GMM système (Sys-GMM) : Combine les équations en niveaux et en différences pour plus de précision.
#    - Avantage : Convient si les retards seuls ne sont pas de bons instruments.
#
# Étapes :
# --------
# Étape 1 : Préparer les données pour inclure les variables retardées.
# Étape 2 : Définir le modèle GMM et spécifier les instruments.
# Étape 3 : Estimer le modèle avec des options de robustesse (une étape ou deux étapes).
# Étape 4 : Tester la validité des instruments (test de Hansen ou de Sargan).
# Étape 5 : Vérifier l'absence d'autocorrélation (test d'Arellano-Bond).
#
# Avantages :
# - Résout les biais liés à l'endogénéité dans les données de panel.
# - Utilise efficacement l'information contenue dans les données.
#
# Limites :
# - Sensible au choix des instruments (risque d'instruments faibles ou sur-identifiés).
# - Modèle complexe qui peut être instable sur des échantillons de petite taille.


library(AER)  # Pour le test de Durbin-Wu-Hausman
library(lmtest)

# Modèle GMM avec une formule multi-part
gmm_model <- pgmm(ESP ~ lag(ESP, 1) + Ineq + PIBt + TMI + Emp + Upop + Educ |
                    lag(ESP, 2:4),
                  data = pdata,
                  effect = "twoways",
                  model = "twosteps") # Méthode GMM en deux étapes

# Résumé des résultats
summary(gmm_model)
