library("readxl")
library("tidyverse")
library("dplyr")
library("RColorBrewer")
#lendo xls
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")

#-------------------------------------------------------------------------------
#Idade dos Público

#faz o select das colunas que queremos e guarda numa "variável"
colunas <- select(as_data_frame(dados), idade)

#filtra de acordo com os critérios que estabelecermos, como se fosse o where do sql (também ta guardando numa variável)
dezesseis <- filter(colunas,idade == 1) 
vincinco <- filter(colunas, idade == 2) 
vinseis <- filter(colunas, idade == 3) 
trinta <- filter(colunas, idade == 4)
trintaseis <- filter(colunas, idade == 5)
acima <- filter(colunas, idade == 6)

#quantidade de pessoas 
dezesseis <- nrow(dezesseis)
vincinco <- nrow(vincinco) 
vinseis <- nrow(vinseis) 
trinta <- nrow(trinta)
trintaseis <- nrow(trintaseis)
acima <- nrow(acima)


#guardando num lugar pra passar pro grafico
x <- c(dezesseis, vincinco, vinseis, trinta, trintaseis, acima)

lbls <- c("Entre 16 e 20 anos", "Entre 21 e 25 anos", "Entre 26 e 30 anos", "Entre 30 e 35 anos" , "Entre 36 e 40 anos", "Acima de 40 anos")
quantidade <- length(lbls)
piepercent<- round(100*x/sum(x), 1)
lbls <- paste(lbls, piepercent) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
png(filename='./graficos/2A.png', width = 800, height = 500, pointsize = 16)
barplot(idade, legend=lbls, main="Idade público", 
        xlab="Idade",ylab= "Nº de Público",col=rainbow(quantidade))
dev.off()