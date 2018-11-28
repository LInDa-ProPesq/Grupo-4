library("readxl")
library("tidyverse")
library("dplyr")
library("RColorBrewer")
#lendo xls
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")
#faz o select das colunas que queremos e guarda numa "variável"
colunas <- select(as_data_frame(dados), idade, contato, atualizado,	preencher,	encontrar,	compopiniao,	compfoto,	amigosja,	profnetwork	,novaamizade,	compdetalhe	,outros_motivos)
#21 e 25 anos 
contato <- nrow(filter(colunas, idade == 2 & contato == 1))
atualizado <- nrow(filter(colunas, idade == 2 &  atualizado == 1))
preencher <- nrow(filter(colunas, idade ==2 &  preencher == 1))
encontrar <- nrow(filter(colunas, idade == 2 & encontrar == 1))
compopiniao <- nrow(filter(colunas, idade == 2 & compopiniao == 1 ))
compfoto <- nrow(filter(colunas, idade == 2 & compfoto == 1))
amigosja <- nrow(filter(colunas, idade == 2 & amigosja == 1))
profnetwork <- nrow(filter(colunas, idade == 2 & profnetwork == 1))
novaamizade <- nrow(filter(colunas, idade == 2 & novaamizade == 1))
compdetalhe <- nrow(filter(colunas, idade == 2 & compdetalhe == 1))
outros_motivos <- nrow(filter(colunas, idade == 2 & outros_motivos == 1))

#guardando num lugar pra passar pro grafico
x <- c(contato, atualizado, preencher, encontrar, compopiniao, compfoto, amigosja, profnetwork, novaamizade, compdetalhe, outros_motivos)

lbls <- c("Contato com o  que amigos estão fazendo", "Manter-se atualizado com notícias e eventos atuais", "Preencher o tempo livre", "Encontrar conteúdo interessante", "Compart. opiniões" , "Compart. fotos ou vídeos", "Amigos já estão neles", "Networking profissional", "Conhecer novas pessoas", "Compart. assuntos de trabalho", "Outras razões") 
quantidade <- length(lbls)
piepercent<- round(100*x/sum(x), 1)
lbls <- paste(lbls, piepercent) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
png(filename='./graficos/Motivos2.png', width = 800, height = 500, pointsize = 16)
pie(x, labels = lbls, main ="Motivos pelos quais pessoas entre 21 e 25 anos utilizam", col=rainbow(quantidade))
dev.off()