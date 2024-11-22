library(plm)
library(tidyverse)
library(lmtest)
library(sandwich)
library(car)

############################## MODELE OLS ##############################
# Modèle linéaire sans effets fixes : On modèles ols pour faire le test de mutlicolinéarité
ols_model <- lm(ESP ~ Ineq + PIBt + TMI + Glo + 
                  Cho + Emp + Pop + CrPop + Upop +
                  Educ + nutri , data = pdata)

# Afficher les résultats du modèle
summary(ols_model)

# Calculer les VIF pour le modèle linéaire complet
vif(ols_model)
# Interprétation des résultats du VIF
# Les VIF des variables dans le modèle sont globalement faibles et ne suggèrent pas de multicolinéarité préoccupante.
# Toutes les variables ont un VIF inférieur à 5, ce qui indique une faible corrélation entre elles.
# Le VIF de 'Glo' (3.79) est légèrement plus élevé, mais reste sous le seuil critique de 5, donc pas de problème majeur de collinéarité.
# En résumé, il n'y a pas de nécessité immédiate de supprimer ou transformer des variables à cause de la multicolinéarité.

# Calculer les résidus du modèle
residuals_ols <- residuals(ols_model)

# Vérifier la corrélation entre les résidus et les variables explicatives : endogénéité
cor_test_ineq <- cor.test(residuals_ols, pdata$Ineq)
cor_test_pibt <- cor.test(residuals_ols, pdata$PIBt)
cor_test_tmi <- cor.test(residuals_ols, pdata$TMI)

# Affichage des résultats
print(cor_test_ineq)
print(cor_test_pibt)
print(cor_test_tmi)

# Commentaire:
# Les tests de corrélation de Pearson montrent qu'il n'y a pas de corrélation significative
# entre les résidus du modèle OLS et les variables explicatives (Ineq, PIBt, TMI).
# Les p-values très élevées (toutes égales à 1) indiquent qu'il n'y a pas de preuve
# de corrélation entre les résidus et les variables, suggérant que ces variables ne sont pas endogènes
# dans le modèle. Cela signifie que les variables explicatives ne sont pas influencées par des
# facteurs non observés et les résidus ne sont pas corrélés avec elles.

############################## MODELE OLS ############################## 
 
############################## MODELE A EFFETS FIXES ############################## 

# Estimation du modèle à effets fixes
fe_model <- plm(ESP ~ Ineq + PIBt + TMI, data = pdata, model = "within")
'Les variables à faire changer pour en inclure d avantages'

# Résultats du modèle FE
summary(fe_model)

# Résumé de l'interprétation du modèle à effets fixes

# Les résultats montrent que :
# - Les inégalités de revenu (Ineq) ont un impact négatif sur l'espérance de vie (ESP), avec un coefficient de -4.3756. 
#   Une augmentation des inégalités est associée à une baisse de l'espérance de vie.
# - Le PIB par tête (PIBt) a un effet positif sur l'espérance de vie, avec un coefficient de 9.9628e-05. 
#   Une augmentation du PIB par tête est liée à une augmentation de l'espérance de vie.
# - Le taux de mortalité infantile (TMI) a également un effet négatif sur l'espérance de vie, 
#   avec un coefficient de -0.2457. Une réduction du taux de mortalité infantile améliore l'espérance de vie.
# 
# Le modèle est bien ajusté, avec un R-squared de 0.70384, indiquant que les variables expliquent environ 70% de la variation de l'espérance de vie.
# La significativité des coefficients est confirmée par des p-values très faibles, indiquant que les variables ont un effet statistiquement significatif.
# 
# En résumé, l'augmentation des inégalités de revenu diminue l'espérance de vie, tandis que l'augmentation du PIB et la réduction de la mortalité infantile ont un impact positif sur l'espérance de vie.

# ------ VOIR LES TEST ASSOCIES AU MODELE DANS LE FICHIERS Tests_Stat

############################## MODELE A EFFETS FIXES ############################## 

############################## MODELE A EFFETS ALEATOIRES ############################## 

# Estimer le modèle à effets aléatoires
re_model <- plm(ESP ~ Ineq + PIBt + TMI, data = pdata, model = "random")

# Résultats du modèle RE
summary(re_model)

# Résumé de l'interprétation du modèle à effets aléatoires

# Les résultats montrent que :
# - L'impact des inégalités de revenu (Ineq) sur l'espérance de vie (ESP) est négatif, avec un coefficient de -3.2639. 
#   Une augmentation des inégalités est associée à une réduction de l'espérance de vie.
# - Le PIB par tête (PIBt) a un effet positif sur l'espérance de vie, avec un coefficient de 9.9239e-05. 
#   Une augmentation du PIB par tête est liée à une amélioration de l'espérance de vie.
# - Le taux de mortalité infantile (TMI) a un effet négatif sur l'espérance de vie, 
#   avec un coefficient de -0.2447. Une réduction de la mortalité infantile améliore l'espérance de vie.
# 
# Le modèle à effets aléatoires explique environ 69.7% de la variation de l'espérance de vie (R-squared = 0.69707).
# La significativité des coefficients est confirmée par des p-values très faibles, ce qui indique que les variables ont un effet statistiquement significatif.
# 
# L'effet individuel (idiosyncratique) explique environ 14.4% de la variance totale, tandis que l'effet individuel spécifique (individual) représente 85.6% de la variance.
# Le coefficient theta de 0.9148 suggère une forte corrélation entre les effets individuels et les erreurs spécifiques.

# ------ VOIR LES TEST ASSOCIES AU MODELE DANS LE FICHIERS Tests_Stat
############################## MODELE A EFFETS ALEATOIRES ############################## 







# Test de Wooldridge pour l'autocorrélation
pbgtest(fe_model)

# Test de normalité des résidus
shapiro.test(residuals(fe_model))


