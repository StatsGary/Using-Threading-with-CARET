amp_up_models <- function(){
  library(parallel)
  library(doParallel)
  
  no_cores <- parallel::detectCores() - 1
  #Leave one core available for Operating system
  cluster <- makePSOCKcluster(no_cores)
  registerDoParallel(cluster)
  message(cat("Model amped and ready to go with:", no_cores, "cores. \n"))
}

amp_up_models()

source("C:/Users/GaryHutson/Desktop/Caret and Threading/Amp up models.R")

caret_example <- train(Y ~ X1 + X2, 
                       data = my_data, 
                       method = "rf",
                       allowParallel = TRUE)