
################################## TEST MODELES A EFFETS FIXES #################################
# Test de Breusch-Pagan pour l'hétéroscédasticité dans le modèle à effets fixes (FE)
# ------------------------------------------------------------------------------
# Le test de Breusch-Pagan est utilisé pour détecter la présence d'hétéroscédasticité dans
# les résidus d'un modèle de régression. L'hétéroscédasticité fait référence à une situation
# où la variance des résidus n'est pas constante à travers les observations. Cela peut entraîner
# des erreurs dans les tests statistiques, comme les tests de significativité des coefficients,
# si elle n'est pas prise en compte.

# Tester l'hétéroscédasticité dans les résidus du modèle FE
bptest(fe_model)

# Interprétation des résultats du test :
# - Statistique de test (BP) : 39.57
#   Cela mesure la magnitude de l'hétéroscédasticité dans le modèle. Une valeur plus élevée 
#   indique une forte présence d'hétéroscédasticité dans les résidus.

# - Degrés de liberté (df) : 3
#   Cela correspond au nombre de variables explicatives dans le modèle (moins une pour le terme constant).

# - P-value : 1.314e-08
#   La p-value associée au test est extrêmement faible (bien inférieure au seuil de 0.05),
#   ce qui indique qu'il existe une forte preuve statistique contre l'hypothèse nulle.
#   L'hypothèse nulle du test est qu'il n'y a pas d'hétéroscédasticité dans les résidus.
#   Puisque la p-value est très faible, nous rejetons l'hypothèse nulle, ce qui suggère
#   que les résidus du modèle présentent des problèmes d'hétéroscédasticité.

# Conclusion :
# En raison du rejet de l'hypothèse nulle (p-value très faible), nous concluons qu'il existe
# des problèmes d'hétéroscédasticité dans le modèle à effets fixes. Cela peut indiquer que la 
# variance des erreurs varie à travers les observations, ce qui pourrait affecter la précision 
# des estimations des coefficients. Afin de corriger ce problème, nous pourrions envisager d'utiliser
# des erreurs standards robustes, qui ajustent les erreurs pour tenir compte de l'hétéroscédasticité.


################################## TEST MODELES A EFFETS FIXES ##################################

# Test de Breusch-Pagan pour les effets individuels et temporels
# --------------------------------------------------------------
# Le test de Breusch-Pagan (ou Lagrange Multiplier) est utilisé pour déterminer
# si un modèle à effets spécifiques (effets fixes ou aléatoires) est plus approprié 
# qu'un modèle regroupé (pooled OLS).

# 1. Test pour les effets individuels :
#    Ce test vérifie si les effets spécifiques à chaque individu (par exemple, pays dans notre cas)
#    sont significatifs dans les données de panel.
#    - Hypothèse nulle (H0) : Absence d'effets individuels spécifiques.
#    - Hypothèse alternative (H1) : Présence d'effets individuels spécifiques.
plmtest(pdata, effect = "individual", type = "bp")

# 2. Test pour les effets temporels :
#    Ce test vérifie si les effets spécifiques à chaque période de temps (par exemple, années)
#    sont significatifs dans les données de panel.
#    - Hypothèse nulle (H0) : Absence d'effets temporels spécifiques.
#    - Hypothèse alternative (H1) : Présence d'effets temporels spécifiques.
plmtest(pdata, effect = "time", type = "bp")