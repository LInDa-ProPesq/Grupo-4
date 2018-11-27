library("readxl")
library("tidyverse")
library("dplyr")
library("RColorBrewer")
#lendo xls
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")
#-----------------------------------------------------------------------------------------------------

#5B E 5B - quem marcou sim nas duas 
#faz o select das colunas que queremos e guarda numa "variável"
colunas <- select(as_data_frame(dados), profchegaal, melhoraresul)
colunas
totalalunos <- nrow(colunas)
totalalunos

#filtra de acordo com os critérios que estabelecermos, como se fosse o where do sql (também ta guardando numa variável)
filtro <- filter(colunas, profchegaal == 2 &  melhoraresul == 2)  

#quantidade de pessoas 
nroalunos <- nrow(filtro)

#guardando num lugar pra passar pro grafico
x <- c(totalalunos, nroalunos)

lbls <- c("Sim", "Não; Não sei/Não tenho opinião")
piepercent<- round(100*x/sum(x), 1)
lbls <- paste(lbls, piepercent) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
png(filename='./graficos/5B6B.png', width = 800, height = 500, pointsize = 16)
pie(x, labels = lbls, main ="Melhor forma de aproximação e melhora resultado dos alunos.")
dev.off()  # usado em complemento com a funcao png (ou outras funcoes para 
# gerar arquivos graficos)