library("readxl")
library("tidyverse")
library("dplyr")
library("RColorBrewer")
#lendo xls
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")

#-------------------------------------------------------------------------------------------------
#Situação trabalhista atual Público

#faz o select das colunas que queremos e guarda numa "variável"
colunas <- select(as_data_frame(dados), trabalha)

#filtra de acordo com os critérios que estabelecermos, como se fosse o where do sql (também ta guardando numa variável)
desempregado <- filter(colunas,  trabalha == 1) 
jorparcial <- filter(colunas,  trabalha == 2) 
jorintegral <- filter(colunas,  trabalha == 3) 
estagiario <- filter(colunas,  trabalha == 4)
contapropria <- filter(colunas,  trabalha == 5)
afastado <- filter(colunas,  trabalha == 6)
aposentado <- filter(colunas,  trabalha == 7)
bolsista <- filter(colunas,  trabalha == 8)

#quantidade de pessoas 
desempregado <- nrow(desempregado)
jorparcial <- nrow(jorparcial) 
jorintegral <- nrow(jorintegral) 
estagiario <- nrow(estagiario)
contapropria <- nrow(contapropria)
afastado <- nrow(afastado)
aposentado  <- nrow(aposentado)
bolsista <- nrow(bolsista)

#guardando num lugar pra passar pro grafico
x <- c(desempregado, jorparcial, jorintegral, estagiario)

lbls <- c("Desempregado", "Jornada parcial", "Jornada integral", "Estagiário", "Outros") 
quantidade <- length(lbls)
piepercent<- round(100*x/sum(x), 1)
lbls <- paste(lbls, piepercent) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
png(filename='./graficos/3A.png', width = 800, height = 500, pointsize = 16)
pie(x, labels = lbls, main ="Situação Trabalhista Atual Público", col=rainbow(quantidade))
dev.off()