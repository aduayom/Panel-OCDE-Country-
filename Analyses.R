library(readxl)
library(plm)
library(dplyr)
library(ggplot2)
library(corrplot)

# Convertir Country en facteur (catégoriel) et Year en numérique
Base$Country <- as.factor(Base$`Country name`)
Base$Year <- as.numeric(as.character(Base$Year))
str(Base)

# Tracer le graphique ESP
ggplot(Base, aes(x = Year, y = ESP, color = Country)) +
  geom_line(linewidth = 1) +                # Remplacer size par linewidth pour ggplot2 >= 3.4.0
  geom_point(size = 2) +                    # Ajoute des points pour chaque observation
  labs(title = "Évolution de l'ESP par Pays",
       x = "Année",
       y = "ESP") +
  theme_minimal() +                         # Applique un thème minimaliste
  theme(legend.title = element_blank()) +   # Supprime le titre de la légende
  scale_color_viridis_d()                   # Utilise une palette de couleurs distinctes (viridis)

# PIBt
ggplot(Base, aes(x = Year, y = PIBt, color = Country)) +
  geom_line(linewidth = 1) +                # Remplacer size par linewidth pour ggplot2 >= 3.4.0
  geom_point(size = 2) +                    # Ajoute des points pour chaque observation
  labs(title = "Évolution de l'PIBt par Pays",
       x = "Année",
       y = "PIBt") +
  theme_minimal() +                         # Applique un thème minimaliste
  theme(legend.title = element_blank()) +   # Supprime le titre de la légende
  scale_color_viridis_d()                   # Utilise une palette de couleurs distinctes (viridis)

# Educ
ggplot(Base, aes(x = Year, y = Educ, color = Country)) +
  geom_line(linewidth = 1) +                # Remplacer size par linewidth pour ggplot2 >= 3.4.0
  geom_point(size = 2) +                    # Ajoute des points pour chaque observation
  labs(title = "Évolution de l'Educ par Pays",
       x = "Année",
       y = "Educ") +
  theme_minimal() +                         # Applique un thème minimaliste
  theme(legend.title = element_blank()) +   # Supprime le titre de la légende
  scale_color_viridis_d()                   # Utilise une palette de couleurs distinctes (viridis)

# Ineq
ggplot(Base, aes(x = Year, y = Ineq, color = Country)) +
  geom_line(linewidth = 1) +                # Remplacer size par linewidth pour ggplot2 >= 3.4.0
  geom_point(size = 2) +                    # Ajoute des points pour chaque observation
  labs(title = "Évolution de l'Ineq par Pays",
       x = "Année",
       y = "Ineq") +
  theme_minimal() +                         # Applique un thème minimaliste
  theme(legend.title = element_blank()) +   # Supprime le titre de la légende
  scale_color_viridis_d()                   # Utilise une palette de couleurs distinctes (viridis)

# Cho
ggplot(Base, aes(x = Year, y = Cho, color = Country)) +
  geom_line(linewidth = 1) +                # Remplacer size par linewidth pour ggplot2 >= 3.4.0
  geom_point(size = 2) +                    # Ajoute des points pour chaque observation
  labs(title = "Évolution de l'Cho par Pays",
       x = "Année",
       y = "Cho") +
  theme_minimal() +                         # Applique un thème minimaliste
  theme(legend.title = element_blank()) +   # Supprime le titre de la légende
  scale_color_viridis_d()                   # Utilise une palette de couleurs distinctes (viridis)


# Le code ci-dessous effectue une analyse descriptive des données en calculant la moyenne et l'écart-type pour chaque pays.

summary_by_country <- Base %>% 
  # Groupement des données par la variable "Country"
  group_by(Country) %>% 
  # Calcul des statistiques descriptives pour plusieurs variables
  summarise(
    mean_esp = mean(ESP, na.rm = TRUE),     # Moyenne de l'ESP
    sd_esp = sd(ESP, na.rm = TRUE),         # Écart-type de l'ESP
    
    mean_pibt = mean(PIBt, na.rm = TRUE),   # Moyenne du PIBt
    sd_pibt = sd(PIBt, na.rm = TRUE),       # Écart-type du PIBt
    
    mean_ineq = mean(Ineq, na.rm = TRUE),   # Moyenne de l'Ineq
    sd_ineq = sd(Ineq, na.rm = TRUE),       # Écart-type de l'Ineq
    
    mean_tmi = mean(TMI, na.rm = TRUE),     # Moyenne du TMI
    sd_tmi = sd(TMI, na.rm = TRUE),          # Écart-type du TMI
    
    mean_tmi = mean(Upop, na.rm = TRUE),     # Moyenne du Upop
    sd_tmi = sd(Upop, na.rm = TRUE),          # Écart-type du 
    
    mean_tmi = mean(Educ, na.rm = TRUE),     # Moyenne du Educ
    sd_tmi = sd(Educ, na.rm = TRUE)          # Écart-type du Educ
  )

# Affichage du résumé des statistiques par pays
print(summary_by_country, n = Inf)


# Interprétation des Statistiques Descriptives Globales

# 1. Espérance de Vie (mean_esp)
# Les pays montrent une espérance de vie moyenne variant entre environ 73 ans (Lettonie, Lituanie, Mexique) et près de 83 ans (Suisse, Japon). Les écarts sont modérés, mais certains pays comme la Colombie ou le Mexique ont des moyennes nettement plus basses.

# 2. PIB par Tête (mean_pibt)
# Le Luxembourg se distingue avec un PIB moyen par tête exceptionnellement élevé (92 647), tandis que des pays comme la Colombie et le Mexique restent bien en dessous de la moyenne générale.

# 3. Inégalités de Revenu (mean_ineq)
# Les inégalités sont particulièrement marquées au Mexique et au Chili, avec des indices de Gini proches de 0,7. À l'opposé, le Danemark et la Finlande affichent les indices les plus bas, autour de 0,25.

# 4. Taux de Mortalité Infantile (mean_tmi)
# Les pays comme la Colombie, le Mexique et la Turquie affichent les taux de mortalité infantile les plus élevés, dépassant les 60 décès pour 1 000 naissances, tandis que les États-Unis, la Suisse et l'Estonie restent parmi les plus faibles, autour de 10.

# Conclusion
# Les données révèlent des disparités notables, notamment en termes de PIB et de mortalité infantile, corrélées avec les niveaux d'inégalité. Des pays comme le Mexique et le Chili apparaissent en contraste marqué avec les pays nordiques.

######### Analysons les moyenens par Années
summary_by_year <- Base %>% 
  # Groupement des données par la variable "Country"
  group_by(Year) %>% 
  # Calcul des statistiques descriptives pour plusieurs variables
  summarise(
    mean_esp = mean(ESP, na.rm = TRUE),     # Moyenne de l'ESP
    sd_esp = sd(ESP, na.rm = TRUE),         # Écart-type de l'ESP
    
    mean_pibt = mean(PIBt, na.rm = TRUE),   # Moyenne du PIBt
    sd_pibt = sd(PIBt, na.rm = TRUE),       # Écart-type du PIBt
    
    mean_ineq = mean(Ineq, na.rm = TRUE),   # Moyenne de l'Ineq
    sd_ineq = sd(Ineq, na.rm = TRUE),       # Écart-type de l'Ineq
    
    mean_tmi = mean(TMI, na.rm = TRUE),     # Moyenne du TMI
    sd_tmi = sd(TMI, na.rm = TRUE),          # Écart-type du TMI
    
    mean_tmi = mean(Upop, na.rm = TRUE),     # Moyenne du Upop
    sd_tmi = sd(Upop, na.rm = TRUE),          # Écart-type du 
    
    mean_tmi = mean(Educ, na.rm = TRUE),     # Moyenne du Educ
    sd_tmi = sd(Educ, na.rm = TRUE)          # Écart-type du Educ
  )

# Affichage du résumé des statistiques par pays
print(summary_by_year, n = Inf)

# Interprétation des Statistiques Descriptives Globales par Année

# 1. Espérance de Vie (mean_esp)
# L'espérance de vie moyenne a progressivement augmenté, passant de 76,2 ans en 1999 à un pic de 80,8 ans en 2019. Une légère baisse est observée après 2020, probablement liée à des perturbations globales comme la pandémie de COVID-19.

# 2. PIB par Tête (mean_pibt)
# Le PIB par tête a connu une croissance constante, doublant presque entre 1999 (20 909) et 2022 (59 953). Cela reflète une augmentation générale du niveau de vie au fil des années.

# 3. Inégalités de Revenu (mean_ineq)
# L'indice de Gini reste relativement stable sur la période, oscillant entre 0,36 et 0,38. Cela indique que, malgré la croissance économique, les inégalités de revenu n'ont pas fortement fluctué.

# 4. Taux de Mortalité Infantile (mean_tmi)
# Le taux de mortalité infantile a montré une nette diminution, passant de 35,5 décès pour 1 000 naissances en 1999 à 19,5 en 2022. Cette amélioration reflète des progrès constants en matière de santé publique.

# Conclusion
# Les données montrent une tendance générale à l'amélioration du bien-être (espérance de vie, mortalité infantile) accompagnée d'une hausse significative du PIB. Cependant, les inégalités de revenu demeurent stables malgré ces progrès économiques et sanitaires.
