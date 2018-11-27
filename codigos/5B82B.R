library("readxl")
library("tidyverse")
library("dplyr")
library("RColorBrewer")
#lendo xls
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")
#----------------------------------------------------------------------------
#quem marcou sim na 5B e avaliação das midias na educação
#5B E 8.2B

#faz o select das colunas que queremos e guarda numa "variável"
colunas <- select(as_data_frame(dados), profchegaal, grandeuso)
colunas
totalalunos <- nrow(colunas)
totalalunos

#filtra de acordo com os critérios que estabelecermos, como se fosse o where do sql (também ta guardando numa variável)
excelente <- filter(colunas, profchegaal == 2 & grandeuso == 1)
bom <- filter(colunas, profchegaal == 2 & grandeuso == 2)
indif <- filter(colunas, profchegaal == 2 & grandeuso == 3)
ruim <- filter(colunas, profchegaal == 2 & grandeuso == 2)
mtoruim <- filter(colunas, profchegaal == 2 & grandeuso == 2)

#quantidade de pessoas 
nroexc <- nrow(excelente)
nrobom <- nrow(bom)
nroindif <- nrow(indif)
nroruim <- nrow(ruim)
nromtoruim <- nrow(mtoruim)

#guardando num lugar pra passar pro grafico
x <- c(nroexc, nrobom, nroindif, nroruim, nromtoruim)
#trasnformando em %

lbls <- c("Excelente", "Bom", "Indiferente", "Ruim", "Muito Ruim")
piepercent<- round(100*x/sum(x), 1)
lbls <- paste(lbls, piepercent) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
png(filename='./graficos/5B82B.png', width = 800, height = 500, pointsize = 16)
pie(x, labels = lbls, main ="Avaliação dos alunos para as mídias sociais na educação.")
dev.off()  # usado em complemento com a funcao png (ou outras funcoes para 
# gerar arquivos graficos)