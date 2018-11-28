library("readxl")
library("tidyverse")
library("dplyr")
library("RColorBrewer")
#lendo xls
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")
#-------------------------------------------------------------------------------------------------
#redes sociais utilizadas Público

#faz o select das colunas que queremos e guarda numa "variável"
colunas <- select(as_data_frame(dados), facebook, twitter, whatsapp, linkedin, youtube, instagram, snapchat, tumblr, pinterest, outras_plataformas)

#filtra de acordo com os critérios que estabelecermos, como se fosse o where do sql (também ta guardando numa variável)
facebook <- filter(colunas, facebook == 1)
twitter <- filter(colunas, twitter == 1)
whatsapp <- filter(colunas, whatsapp == 1)
linkedin <- filter(colunas, linkedin == 1)
youtube <- filter(colunas, youtube == 1)
instagram <- filter(colunas, instagram == 1)
snapchat <- filter(colunas, snapchat == 1)
tumblr <- filter(colunas, tumblr == 1)
pinterest <- filter(colunas, pinterest == 1)
outras_plataformas <- filter(colunas, outras_plataformas == 1)

#quantidade de pessoas 
facebook <- nrow(facebook)
twitter <- nrow(twitter) 
whatsapp <- nrow(whatsapp) 
linkedin <- nrow(linkedin)
youtube <- nrow(youtube)
instagram <- nrow(instagram)
snapchat  <- nrow(snapchat)
tumblr <- nrow(tumblr)
pinterest <- nrow(pinterest)
outras_plataformas <- nrow(outras_plataformas)

#guardando num lugar pra passar pro grafico
x <- c(facebook, twitter, whatsapp, linkedin, youtube, instagram, snapchat, tumblr, pinterest, outras_plataformas)

lbls <- c(" Facebook", "Twitter", "WhatsApp", "Linkedln", "YouTube", "Instagram", "Snapchat", "Tumblr", "Pinterest", "Outro") 
quantidade <- length(lbls)
piepercent<- round(100*x/sum(x), 1)
lbls <- paste(lbls, piepercent) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
png(filename='./graficos/B1.png', width = 800, height = 500, pointsize = 16)
pie(x, labels = lbls, main ="Mídias Sociais Utilizadas pelos Público", col=rainbow(quantidade))
dev.off()