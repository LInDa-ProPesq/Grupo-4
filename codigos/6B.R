library("readxl")
library("tidyverse")
library("dplyr")
library("RColorBrewer")
#lendo xls
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")
#-----------------------------------------------------------------------------------------------------------
## Análise de opinião sobre mídias melhorarem resultados dos alunos

#faz o select das colunas que queremos e guarda numa "variável"
colunas <- select(as_data_frame(dados), melhoraresul)

#filtra de acordo com os critérios que estabelecermos, como se fosse o where do sql (também ta guardando numa variável)
nao <- filter(colunas, melhoraresul == 1 ) 
sim <- filter(colunas, melhoraresul == 2 ) 
ns  <- filter(colunas, melhoraresul == 3 )

#quantidade de pessoas 

nao1 <- nrow(nao)
sim1 <- nrow(sim)
ns1 <- nrow(ns)


#guardando num lugar pra passar pro grafico
x <- c(nao1,sim1, ns1)

lbls <- c("Não","Sim", "Não sei")
piepercent<- round(100*x/sum(x), 1)
lbls <- paste(lbls, piepercent) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
png(filename='./graficos/6B.png', width = 800, height = 500, pointsize = 16)
pie(x, labels = lbls, main ="Midias podem melhorar o resultado dos alunos?")
dev.off()
