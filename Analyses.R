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
print(summary_by_country)
