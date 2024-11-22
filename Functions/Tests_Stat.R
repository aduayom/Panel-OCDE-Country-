
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

################################## TEST MODELES A EFFETS ALEATOIRES ##################################
# Tester l'hétéroscédasticité dans les résidus du modèle RE
bptest(re_model)

# Interprétation des résultats du test :
# - Statistique de test (BP) : 39.57
#   Cette valeur mesure l'ampleur de l'hétéroscédasticité dans le modèle. Plus cette 
#   statistique est élevée, plus il est probable que les résidus du modèle soient
#   hétéroscédastiques. Dans ce cas, la statistique BP est élevée, ce qui suggère 
#   qu'il pourrait y avoir une variance non constante des erreurs.

# - Degrés de liberté (df) : 3
#   Le nombre de degrés de liberté correspond ici au nombre de variables explicatives
#   dans le modèle (Ineq, PIBt, TMI). Ce chiffre détermine la taille de l'échantillon
#   nécessaire pour effectuer le test.

# - P-value : 1.314e-08
#   La p-value associée au test est très faible (bien inférieure au seuil de 0.05),
#   ce qui permet de rejeter l'hypothèse nulle d'absence d'hétéroscédasticité.
#   En d'autres termes, il existe une preuve statistique forte pour affirmer qu'il
#   y a de l'hétéroscédasticité dans les résidus du modèle.

# Conclusion :
# Étant donné que la p-value est très faible, nous rejetons l'hypothèse nulle qui suggère 
# qu'il n'y a pas d'hétéroscédasticité. Cela signifie que les erreurs du modèle à effets 
# aléatoires ne sont pas de variance constante, ce qui peut avoir un impact sur la fiabilité 
# des tests statistiques et l'efficacité des estimations des coefficients.
# 
# Pour corriger ce problème, il est recommandé d'utiliser des erreurs standards robustes
# afin d'obtenir des estimations fiables malgré la présence d'hétéroscédasticité.

################################## TEST MODELES A EFFETS ALEATOIRES ##################################

################################## TEST DE HAUSMAN : FE VS RE ##################################
# Test de Hausman
hausman_test <- phtest(fe_model, re_model)
hausman_test

# ------ VOIR LES TEST ASSOCIES AU MODELE DANS LE FICHIERS Tests_Stat : Section Test de hausman

# Résumé de l'interprétation du test de Hausman

# Le test de Hausman compare les modèles à effets fixes et à effets aléatoires pour déterminer lequel est plus approprié.
# - La statistique de test chi-carré est de 6.1345 avec 3 degrés de liberté (df = 3).
# - La p-value associée est de 0.1052, ce qui est supérieur au seuil de significativité de 0.05.
# - Comme la p-value est supérieure à 0.05, nous n'avons pas de preuve suffisante pour rejeter l'hypothèse nulle.
# - L'hypothèse nulle suggère que les deux modèles (fixes et aléatoires) sont équivalents, ce qui signifie que le modèle à effets aléatoires est approprié.
# 
# En conclusion, étant donné la p-value de 0.1052, il n'y a pas de justification statistique pour préférer le modèle à effets fixes, 
# et le modèle à effets aléatoires semble donc être le plus adapté.
################################## TEST DE HAUSMAN : FE VS RE ##################################

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