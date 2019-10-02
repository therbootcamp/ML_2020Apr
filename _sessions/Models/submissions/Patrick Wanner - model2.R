tweets_rf_pmw <- train(gender ~ .,
                       data = tweets_train,
                       method = "rf",
                       trControl = trainControl(method = "none"),
                       tuneGrid = expand.grid(mtry = 2))