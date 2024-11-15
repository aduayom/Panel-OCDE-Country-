
# Estimation du modèle à effets fixes
fe_model <- plm(ESP ~ Ineq + PIBt + TMI, data = pdata, model = "within")
'Les variables à faire changer pour en inclure d avantages'

# Résultats du modèle
summary(fe_model)
