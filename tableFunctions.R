


table_function <- function(ls) { 
  zzz = sapply(ls[["var"]], function(j) j) 
  yyy<-lapply(zzz, function(i){
    designobject = ls[["des"]]  
    x <- 
      eval(bquote( 
        svyby(
          ~.(as.name(i)),
          ~.(as.name(ls$elgr)),
          get(designobject), 
          svymean,
          na.rm=TRUE
        )
      ))
    y <- 
      eval(bquote( 
        svyby(
          ~.(as.name(i)),
          ~.(as.name(ls$elgr)), 
          get(designobject),  
          svytotal,
          na.rm=TRUE
        )
      ))
    
    xxx <- merge(x, y, by=0, all=TRUE)
    rownames(xxx) <- xxx$Row.names
    
    names(xxx) <- gsub(i,"stat",names(xxx)) 
    names(xxx) <- gsub(ls$elgr,"group",names(xxx)) 
    
    xxx <- xxx[,-(grep("^gro|^Row",names(xxx)))] 
    xxx
    
  })
  do.call(rbind,yyy)
}



