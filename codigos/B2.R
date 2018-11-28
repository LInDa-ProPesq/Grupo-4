library("readxl")
library("tidyverse")
library("dplyr")
library("RColorBrewer")
#lendo xls
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")

#-------------------------------------------------------------------------------------------------
#motivos pelos quais publico usa redes


#faz o select das colunas que queremos e guarda numa "variável"
colunas <- select(as_data_frame(dados), contato, atualizado,	preencher,	encontrar,	compopiniao,	compfoto,	amigosja,	profnetwork	,novaamizade,	compdetalhe	,outros_motivos)

contato <- nrow(filter(colunas, contato == 1))
atualizado <- nrow(filter(colunas, atualizado == 1))
preencher <- nrow(filter(colunas, preencher == 1))
encontrar <- nrow(filter(colunas, encontrar == 1))
compopiniao <- nrow(filter(colunas, compopiniao == 1 ))
compfoto <- nrow(filter(colunas, compfoto == 1))
amigosja <- nrow(filter(colunas, amigosja == 1))
profnetwork <- nrow(filter(colunas, profnetwork == 1))
novaamizade <- nrow(filter(colunas, novaamizade == 1))
compdetalhe <- nrow(filter(colunas, compdetalhe == 1))
outros_motivos <- nrow(filter(colunas, outros_motivos == 1))

#guardando num lugar pra passar pro grafico
x <- c(contato, atualizado, preencher, encontrar, compopiniao, compfoto, amigosja, profnetwork, novaamizade, compdetalhe, outros_motivos)

lbls <- c("Contato com o  que amigos estão fazendo", "Manter-se atualizado com notícias e eventos atuais", "Preencher o tempo livre", "Encontrar conteúdo interessante", "Compart. opiniões" , "Compart. fotos ou vídeos", "Amigos já estão neles", "Networking profissional", "Conhecer novas pessoas", "Compart. assuntos de trabalho", "Outras razões") 
quantidade <- length(lbls)
piepercent<- round(100*x/sum(x), 1)
lbls <- paste(lbls, piepercent) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
png(filename='./graficos/B2.png', width = 800, height = 500, pointsize = 16)
pie(x, labels = lbls, main ="Mídias Sociais Utilizadas pelos Público", col=rainbow(quantidade))
dev.off()