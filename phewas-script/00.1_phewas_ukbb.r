setwd("[path]")

library(data.table)
library(dplyr)

phecodesource <- c("[phecode_matrix_from_ukbiobank]")
phecodefname <- list.files(phecodesource)
phecodefname <- phecodefname[order(phecodefname,decreasing = T)]

base <- fread("[ukbb_covariate_file]");dim(base)


for (j in 1:length(phecodefname)) {

  base <- fread("[ukbb_covariate_file]");dim(base)
  
  phecode <- fread(paste0(phecodesource,phecodefname[j]));dim(phecode);colnames(phecode)[1] <- "IID"
  pheno <- merge(base,phecode,by="IID",all.x=T);rm(base);rm(phecode)
  
  phecodelist <- colnames(pheno)[grep("phecode_",colnames(pheno))]

  for (i in 1:length(phecodelist)) {
    modelname=paste0("as.factor(",phecodelist[i],")", "~ age+as.factor(sex)+PC01+PC02+PC03+PC04+PC05+PC06+PC07+PC08+PC09+PC10+Genoarray+scale(Glaucoma_PRS)")
    md <- glm(modelname, data=pheno, family=binomial(),na.action=na.exclude);summary(md)#;ORtable(md)
    mdsum <- summary(md) 
    
    if(i==1){
      temp <- data.frame(phecodelist[i],mdsum$coefficients[,c("Estimate")]["scale(Glaucoma_PRS)"][[1]],
                         mdsum$coefficients[,c("Std. Error")]["scale(Glaucoma_PRS)"][[1]],
                         mdsum$coefficients[,c("Pr(>|z|)")]["scale(Glaucoma_PRS)"][[1]])
      colnames(temp) <- c("PheCode","Beta","SE","P")
    }else{
      temptemp <- data.frame(phecodelist[i],mdsum$coefficients[,c("Estimate")]["scale(Glaucoma_PRS)"][[1]],
                             mdsum$coefficients[,c("Std. Error")]["scale(Glaucoma_PRS)"][[1]],
                             mdsum$coefficients[,c("Pr(>|z|)")]["scale(Glaucoma_PRS)"][[1]])
      colnames(temptemp) <- c("PheCode","Beta","SE","P")
      temp <- rbind(temp,temptemp)
    }
    
  }
  
  desc <- fread(paste0(phecodesource,"[pheCodes_description_file]"))
  temp <- merge(desc,temp,by="PheCode",all.y = T)
  
  fwrite(temp,paste0("./results_all/scale_",phecodefname[j],"_phewas_glaucomaPRS.tsv"),sep = "\t",quote = F,col.names = T,row.names = F)
}









