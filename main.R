library(readxl)
Base <- read_excel("C:/Users/apedo/OneDrive/Base économétrie avancée heidi.xlsx")
head(Base)

# Convertir en données de panel# Définir le jeu de données comme un `pdata.frame`, en spécifiant les colonnes d'indexpdata 
library(plm)
pdata<- pdata.frame(Base, index = c("Country", "Year"))

#Vérifier le nombre de lignes et de variables
cat("Nombre de lignes :", nrow(pdata))
cat("Nombre de variables :", ncol(pdata))

# Vérifier l'équilibre
is_balanced <- is.pbalanced(pdata)
if(is_balanced){
  cat("base de données équilibrée")
}else{
  cat("base de données déséquilibrée")
}

# Valeurs manquantes
NROW(na.omit(pdata))
missing_data <- pdata[!complete.cases(pdata),]
print(missing_data)

# On retire l'année 2022
pdata <- pdata[pdata$Year!=2022,]
missing_data <- pdata[!complete.cases(pdata),]
print(missing_data)

# Afficher les années
years_modalite <- unique(pdata$Year)
years_modalite

# Afficher les différents pays
country_modalite <- unique(pdata$Country.name)
country_modalite

# Stat descriptive
summary(pdata)

# Matrice de correlation
continuous_variable <- pdata[sapply(pdata, is.double)]
continuous_variable
correlation_matrix <-cor(continuous_variable, use="complete.obs")
correlation_matrix

library(corrplot)
# Visualiser la matrice de corrélation
corrplot(correlation_matrix, method = "circle", 
         type = "upper",  # Afficher uniquement la partie supérieure de la matrice
         order = "hclust",  # Ordre par regroupement hiérarchique
         tl.col = "black",  # Couleur des étiquettes de ligne et de colonne
         tl.srt = 45)  # Incliner les étiquettes



library(ggplot2)

# Convertir le pdata.frame en data.frame standard
pdata_df <- as.data.frame(pdata)

# Sélectionner uniquement les colonnes continues (de type double)
continuous_vars <- pdata_df[sapply(pdata_df, is.double)]

# Boucle pour afficher la distribution de chaque variable continue
for (var_name in names(continuous_vars)) {
  # Créer un histogramme pour chaque variable continue
  print(
    ggplot(data = pdata_df, aes(x = .data[[var_name]])) +
      geom_histogram(bins = 30, fill = "steelblue", color = "black", alpha = 0.7) +
      labs(title = paste("Distribution de", var_name), x = var_name, y = "Fréquence") +
      theme_minimal()
  )
  
  # Pause pour afficher chaque graphique individuellement dans certains environnements
  Sys.sleep(1)  # Pause d'une seconde avant de passer à la variable suivante
}

# Spécifiez vos variables ici
x_var <- "Ineq"  # Remplacez par le nom de la variable indépendante
y_var <- "ESP"  # Remplacez par le nom de la variable dépendante

# Tracer la courbe entre les deux variables
ggplot(data = pdata_df, aes_string(x = x_var, y = y_var)) +
  geom_line(color = "blue", size = 1) +  # Ajoute une ligne pour la courbe
  labs(title = paste("Courbe de", y_var, "en fonction de", x_var),
       x = x_var, y = y_var) +
  theme_minimal()

library(dplyr)
# Boucle pour générer un graphique pour chaque pays
for (country in unique(pdata_df$Country.name)) {
  # Filtrer les données pour le pays actuel
  pdata_country <- pdata_df %>% filter(Country.name == country)
  
  # Créer et afficher le graphique pour ce pays
  print(
    ggplot(data = pdata_country, aes_string(x = x_var, y = y_var)) +
      geom_line(color = "blue", size = 1) +
      labs(title = paste("Courbe de", y_var, "en fonction de", x_var, "pour le pays", country),
           x = x_var, y = y_var) +
      theme_minimal()
  )
  
  # Pause pour afficher chaque graphique successivement dans certains environnements
  Sys.sleep(1)  # Pause d'une seconde avant de passer au pays suivant
}
