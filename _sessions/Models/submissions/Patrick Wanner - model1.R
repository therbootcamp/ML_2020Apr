tweets_glm4_pmw = train(gender ~ name_female + name_male,
                        data = tweets_train,
                        method = "glm")
