require(tidyverse)
require(caret)
require(party)
require(partykit)

# Lade Daten
baseball_train <- read_csv("1_Data/baseball_train.csv")
baseball_test <- read_csv("1_Data/baseball_test.csv")

# Konvertiere character zu factor
baseball_train <- baseball_train %>% mutate_if(is.character, factor)
baseball_test <- baseball_test %>% mutate_if(is.character, factor)

# Definiere Train Kontrollparameter
ctrl_cv <- trainControl(method = "repeatedcv", number = 10, repeats = 100)

# Elastic net
baseball_glmnet <- train(form = Gehalt ~ .,
                      data = baseball_train, 
                      method = "glmnet", 
                      preProcess = c("center", "scale"),
                      trControl = ctrl_cv,
                      tuneGrid = expand.grid(
                        alpha = 1,
                        lambda = seq(10,30,1)
                        )
                      )
baseball_glmnet$bestTune
plot(baseball_glmnet)



# findCorrelation(cor(baseball_train %>% select_if(is.numeric)))

# Elastic net
baseball_glm <- train(form = Gehalt ~ .,
                   data = baseball_train, 
                   method = "glm",
                   trControl  = trainControl(method = "none"))

# Evaluation  fit
postResample(predict(house_glm), baseball_train$Gehalt) %>% round(2)
postResample(predict(house_glmnet), baseball_train$Gehalt) %>% round(2)


# Evaluation predict
postResample(predict(house_glm, newdata = house_test), 
             house_test$Preis) %>% round(2)
postResample(predict(house_glmnet, newdata = house_test), 
             house_test$Preis) %>% round(2)




