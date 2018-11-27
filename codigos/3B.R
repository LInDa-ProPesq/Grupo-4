library("readxl")
library("tidyverse")
library("dplyr")
library("RColorBrewer")
#lendo xls
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")
#----------------------------------------------------------------------------------------------------

#Tempo gasto nas midias Público

#faz o select das colunas que queremos e guarda numa "variável"
colunas <- select(as_data_frame(dados), tempogasto)

#filtra de acordo com os critérios que estabelecermos, como se fosse o where do sql (também ta guardando numa variável)
nenhum <- nrow(filter(colunas,  tempogasto == 1)) 
cincocmin <- nrow(filter(colunas,  tempogasto == 2)) 
dezmin <- nrow(filter(colunas,  tempogasto == 3)) 
trintamin <- nrow(filter(colunas,  tempogasto == 4))
umahr <- nrow(filter(colunas,  tempogasto == 5))
duashrs <- nrow(filter(colunas,  tempogasto == 6))
treshrs <- nrow(filter(colunas,  tempogasto == 7))
quatrohrs <- nrow(filter(colunas,  tempogasto == 8))
maiscinco <- nrow(filter(colunas,  tempogasto == 9))


#guardando num lugar pra passar pro grafico
x <- c(nenhum, cincocmin, dezmin, trintamin, umahr, duashrs, treshrs, quatrohrs, maiscinco)

lbls <- c("Nenhum/Não uso", "de 5 a 10 minutes", "de 10 a 30 minutes", "de 30 minutos até 1 hora", "de 1 a 2 horas", "de 2 a 3 horas", "de 3 a 4 horas", "de 4 a 5 horas", "mais de 5 horas") 
quantidade <- length(lbls)
piepercent<- round(100*x/sum(x), 1)
lbls <- paste(lbls, piepercent) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
png(filename='./graficos/3B.png', width = 800, height = 500, pointsize = 16)
barplot(tempo, legend.text = lbls, args.legend = list("topleft", xpd = TRUE, ncol = 1, bty= 5, cex = 0.5), col=rainbow(quantidade),
        main ="Tempo Gasto em Mídias Sociais pelo Público", xlab = "Tempo gasto", ylab ="Nº de pessoas")
dev.off()
