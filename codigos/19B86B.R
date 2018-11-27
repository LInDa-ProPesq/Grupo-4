library("readxl")
library("tidyverse")
library("dplyr")
library("RColorBrewer")
#lendo xls
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")
#--------------------------------------------------------------------------------------------------------------

#1.9B e 8.6B - 
#faz o select das colunas que queremos e guarda numa "variável"
colunas <- select(as_data_frame(dados), pinterest, quadrovirtual)


#filtra de acordo com os critérios que estabelecermos, como se fosse o where do sql (também ta guardando numa variável)
exc <- nrow(filter(colunas, quadrovirtual == 1 & pinterest == 1))  
bom <- nrow(filter(colunas, quadrovirtual == 2 & pinterest == 1))  
ind <- nrow(filter(colunas, quadrovirtual == 3 & pinterest == 1))  
ruim <- nrow(filter(colunas, quadrovirtual == 4 & pinterest == 1))  
mtoruim <- nrow(filter(colunas, quadrovirtual == 5 & pinterest == 1))  


#guardando num lugar pra passar pro grafico
x <- c(exc,bom, ind, ruim, mtoruim)
lbls <- c("Excelente", "Bom", "Indiferente", "Ruim", "Muito Ruim")
piepercent<- round(100*x/sum(x), 1)
lbls <- paste(lbls, piepercent) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
png(filename='./graficos/19B86B.png', width = 800, height = 500, pointsize = 16)
pie(x, labels = lbls, main ="Relação Pinterest")
dev.off()  # usado em complemento com a funcao png (ou outras funcoes para 
# gerar arquivos graficos)