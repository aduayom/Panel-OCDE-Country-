
################################## TEST MODELES A EFFETS FIXES ##################################

# Tester l'hétéroscédasticité dans les résidus du modèle FE
bptest(fe_model)

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