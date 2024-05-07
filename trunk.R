


library(survey)


# load functions
source("./tableFunctions.R")


#create vector of variables
vars <- c("var1","var2","var3","var4")

# specify the survey design
surveydesign <- "dsgn" 

# create vector of grouping variables
groups <- c("groupvar1","groupvar2","groupvar3")
groups <- sapply(groups, function(x) x)

# combine above variables into list
inputobject <- lapply(groups,function(x) list(var=vars,elgr=x,des=surveydesign))

tablelist <- lapply(inputobject, table_function )
do.call(rbind, tablelist)

