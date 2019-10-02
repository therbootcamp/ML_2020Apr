#Eva-rf

library(tidyverse)
library(caret)
tweets <- read_csv(file = "1_Data/tweets_train.csv")
tweets <- tweets %>% mutate_if(is.character, as.factor)
predictors_tweets <- tweets %>% select(-gender)
criterion_tweets <- tweets %>% select(gender) %>% pull()
zerovar_features <- nearZeroVar(predictors_tweets)
print(zerovar_features)
view(zerovar_features)
predictors_tweets <- predictors_tweets %>% select(-zerovar_features)
dim(predictors_tweets)
dim(tweets)
#find overcorrelated values
corr_matrix <- cor(predictors_tweets)
corr_features <- findCorrelation(corr_matrix)
view(corr_features)
print(corr_features)
predictors_tweets <- predictors_tweets %>% select(-corr_features)
view(predictors_tweets)
data_tweets <- predictors_tweets %>% add_column(gender=criterion_tweets)

ctrl_cv <- trainControl(method = "cv", number = 10)


tweets_rf <- train(form = .name_male + name_female + name_nchar + descr_sent + descr_nchar,
                   data = data_tweets,
                   method = "rf",
                   trControl = ctrl_cv)


criterion <- tweets$gender

#predicting with both models


tweets_rf_predict <- predict(tweets_rf, data = tweets)


confusionMatrix(data=tweets_rf_predict, reference = criterion)

