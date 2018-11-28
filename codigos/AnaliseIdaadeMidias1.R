library("readxl")
library("tidyverse")
library("dplyr")
library("RColorBrewer")
#lendo xls
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")
# entre 21 e 25 anos


colunas <- select(as_data_frame(dados), idade, facebook, twitter, whatsapp, linkedin, youtube, instagram, snapchat, tumblr, pinterest, outras_plataformas)
#filtra de acordo com os critérios que estabelecermos, como se fosse o where do sql (também ta guardando numa variável)
facebook <- nrow(filter(colunas, idade == 2 & facebook == 1))
twitter <- nrow(filter(colunas, idade == 2 & twitter == 1))
whatsapp <- nrow(filter(colunas, idade == 2  & whatsapp == 1))
linkedin <- nrow(filter(colunas, idade == 2  & linkedin == 1))
youtube <- nrow(filter(colunas, idade == 2  & youtube == 1))
instagram <- nrow(filter(colunas, idade == 2  & instagram == 1))
snapchat <- nrow(filter(colunas, idade == 2  & snapchat == 1))
tumblr <- nrow(filter(colunas, idade == 2  & tumblr == 1))
pinterest <- nrow(filter(colunas, idade == 2  & pinterest == 1))
outras_plataformas <- nrow(filter(colunas, idade == 2 &outras_plataformas == 1))


#guardando num lugar pra passar pro grafico
x <- c(facebook, twitter, whatsapp, linkedin, youtube, instagram, snapchat, tumblr, pinterest, outras_plataformas)

lbls <- c(" Facebook", "Twitter", "WhatsApp", "Linkedln", "YouTube", "Instagram", "Snapchat", "Tumblr", "Pinterest", "Outro") 
quantidade <- length(lbls)
piepercent<- round(100*x/sum(x), 1)
lbls <- paste(lbls, piepercent) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
png(filename='./graficos/AnaliseIdaadeMidias1.png', width = 800, height = 500, pointsize = 16)
pie(x, labels = lbls, main ="Mídias Sociais Utilizadas pelos Público entre 21 e 25 anos", col=topo.colors(quantidade))
dev.off()