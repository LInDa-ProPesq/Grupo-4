library("readxl")
library("tidyverse")
library("dplyr")
library("RColorBrewer")
#lendo xls
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")

#Gênero

#faz o select das colunas que queremos e guarda numa "variável"
colunas <- select(as_data_frame(dados), genero)

#filtra de acordo com os critérios que estabelecermos, como se fosse o where do sql (também ta guardando numa variável)
ns <- filter(colunas, genero == 1) 
masc <- filter(colunas, genero == 2) 
fem <- filter(colunas, genero == 3) 


#quantidade de pessoas 
ns <- nrow(ns)
masc <- nrow(masc)
fem <- nrow(fem)


#guardando num lugar pra passar pro grafico
x <- c(ns,masc,fem)

lbls <- c("Prefiro não dizer", "Masculino", "Feminino")
quantidade <- length(lbls)
piepercent<- round(100*x/sum(x), 1)
lbls <- paste(lbls, piepercent) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
png(filename='./graficos/1A.png', width = 800, height = 500, pointsize = 16)
pie(x, labels = lbls, main ="Gênero Público", col=rainbow(quantidade))
dev.off()  # usado em complemento com a funcao png (ou outras funcoes para 
# gerar arquivos graficos)