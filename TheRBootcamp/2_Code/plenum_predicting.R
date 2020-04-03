require(tidyverse)
require(caret)
require(party)
require(partykit)

# Lade Daten
house_train <- read_csv("1_Data/house_train.csv")
house_test <- read_csv("1_Data/house_test.csv")

# Konvertiere character zu factor
data_train <- data_train %>% mutate_if(is.character, factor)
data_test <- data_test %>% mutate_if(is.character, factor)

# Definiere Train Kontrollparameter
ctrl_none <- trainControl(method = "none")

# Regression
house_glm <- train(form = Preis ~ .
                   data = house_train, 
                   method = "XX",
                   trControl = ctrl_none)



# Decision Tree
house_glm <- train(form = Preis ~ .
                   data = house_train, 
                   method = "XX",
                   trControl = ctrl_none,
                   tuneGrid = XX)



# Random forest
house_glm <- train(form = Preis ~ .
                   data = house_train, 
                   method = "XX",
                   trControl = ctrl_none,
                   tuneGrid = XX)



# Evaluation  fit



# Evaluation predict


