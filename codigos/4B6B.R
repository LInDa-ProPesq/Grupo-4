library("readxl")
library("tidyverse")
library("dplyr")
library("RColorBrewer")
#lendo xls
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")
#-------------------------------------------------------------------------------------------------
#4b e 6b
#faz o select das colunas que queremos e guarda numa "variável"
colunas <- select(as_data_frame(dados), usoacademico, melhoraresul)

#filtra de acordo com os critérios que estabelecermos, como se fosse o where do sql (também ta guardando numa variável)

sim <- filter(colunas, usoacademico == 2 & melhoraresul == 2) 
nao <- filter(colunas, usoacademico == 2 & melhoraresul == 1) 
ns <- filter(colunas, usoacademico == 2 & melhoraresul == 3) 


#quantidade de pessoas 
sim1 <- nrow(sim)
nao1 <- nrow(nao)
ns1 <- nrow(ns)



#guardando num lugar pra passar pro grafico
x <- c(sim1,nao1,ns1)

lbls <- c("Sim", "Não", "Não sei")
piepercent<- round(100*x/sum(x), 1)
lbls <- paste(lbls, piepercent) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
png(filename='./graficos/4B6B.png', width = 800, height = 500, pointsize = 16)
pie(x, labels = lbls, main ="Midias podem ser utilizadas e melhora resultado dos alunos.")
dev.off()  # usado em complemento com a funcao png (ou outras funcoes para 
# gerar arquivos graficos)