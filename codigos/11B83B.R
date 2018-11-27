library("readxl")
library("tidyverse")
library("dplyr")
library("RColorBrewer")
#lendo xls
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")
#-------------------------------------------------------------------------------

#1.1B e 8.3B - 
#faz o select das colunas que queremos e guarda numa "variável"
colunas <- select(as_data_frame(dados), facebook, facegrupo)


#filtra de acordo com os critérios que estabelecermos, como se fosse o where do sql (também ta guardando numa variável)
exc <- nrow(filter(colunas, facegrupo == 1 & facebook == 1))  
bom <- nrow(filter(colunas, facegrupo == 2 & facebook == 1))  
ind <- nrow(filter(colunas, facegrupo == 3 & facebook == 1))  
ruim <- nrow(filter(colunas, facegrupo == 4 & facebook == 1))  
mtoruim <- nrow(filter(colunas, facegrupo == 5 & facebook == 1))  


#guardando num lugar pra passar pro grafico
x <- c(exc,bom, ind, ruim, mtoruim)
lbls <- c("Excelente", "Bom", "Indiferente", "Ruim", "Muito Ruim")
piepercent<- round(100*x/sum(x), 1)
lbls <- paste(lbls, piepercent) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
png(filename='./graficos/11B83B.png', width = 800, height = 500, pointsize = 16)
pie(x, labels = lbls, main ="Relação Facebook")
dev.off()  # usado em complemento com a funcao png (ou outras funcoes para 
# gerar arquivos graficos)
