library("readxl")
library("tidyverse")
library("dplyr")
library("RColorBrewer")
#lendo xls
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")
#-------------------------------------------------------------------------------------------------
#situação atual das pessoas que usam linkedin

colunas <- select(as_data_frame(dados), trabalha, linkedin)

#filtra de acordo com os critérios que estabelecermos, como se fosse o where do sql (também ta guardando numa variável)
desempregado <- nrow(filter(colunas,  trabalha == 1 & linkedin == 1)) 
jorparcial <- nrow(filter(colunas,  linkedin == 1 & trabalha == 2)) 
jorintegral <- nrow(filter(colunas,  linkedin == 1 &  trabalha == 3)) 
estagiario <- nrow(filter(colunas,  linkedin == 1 & trabalha == 4))
contapropria <- nrow(filter(colunas,  linkedin == 1 &  trabalha == 5))
afastado <- nrow(filter(colunas,  linkedin == 1 &  trabalha == 6))
aposentado <- nrow(filter(colunas,  linkedin == 1 &  trabalha == 7))
bolsista <- nrow(filter(colunas,  linkedin == 1 &  trabalha == 8))


#guardando num lugar pra passar pro grafico
x <- c(desempregado, jorparcial, jorintegral, estagiario, contapropria, afastado, aposentado, bolsista)

lbls <- c("Desempregado", "Jornada parcial", "Jornada integral", "Estagiário", "Conta Prórpia", "Afastado", "Aposentado", "Bolsista") 
quantidade <- length(lbls)
piepercent<- round(100*x/sum(x), 1)
lbls <- paste(lbls, piepercent) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
png(filename='./graficos/SituacaoLinkedin.png', width = 800, height = 500, pointsize = 16)
barplot(x, legend= lbls, main ="Situação Trabalhista Atual do Público que usa Linkedin",  xlab="Situação", ylab="Quantidade público", col=rainbow(quantidade))
dev.off()