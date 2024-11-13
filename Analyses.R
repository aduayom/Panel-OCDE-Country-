library(readxl)
library(plm)
library(dplyr)
library(ggplot2)
library(corrplot)

# Convertir Country en facteur (catégoriel) et Year en numérique
Base$Country <- as.factor(Base$`Country name`)
Base$Year <- as.numeric(as.character(Base$Year))

# Tracer le graphique
ggplot(Base, aes(x = Year, y = ESP, color = Country)) +
  geom_line(linewidth = 1) +                # Remplacer size par linewidth pour ggplot2 >= 3.4.0
  geom_point(size = 2) +                    # Ajoute des points pour chaque observation
  labs(title = "Évolution de l'ESP par Pays",
       x = "Année",
       y = "ESP") +
  theme_minimal() +                         # Applique un thème minimaliste
  theme(legend.title = element_blank()) +   # Supprime le titre de la légende
  scale_color_viridis_d()                   # Utilise une palette de couleurs distinctes (viridis)
