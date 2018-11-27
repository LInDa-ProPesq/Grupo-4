library("readxl")
library("tidyverse")
library("dplyr")
library("RColorBrewer")
#lendo xls
dados <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")
#-----------------------------------------------------------------------------------------------------------
#5B e 8.5B - quem classifica como excelente e respondeu sim, nao e não sei na 5B
#faz o select das colunas que queremos e guarda numa "variável"
colunas <- select(as_data_frame(dados), profchegaal, compinfopal)


#filtra de acordo com os critérios que estabelecermos, como se fosse o where do sql (também ta guardando numa variável)
sim <- filter(colunas, profchegaal == 1 & compinfopal == 1)  
nao <- filter(colunas, profchegaal == 2 & compinfopal == 1)  
ns <- filter(colunas, profchegaal == 3 & compinfopal == 1)  

#quantidade de pessoas 
sim1 <- nrow(sim)
nao1 <- nrow(nao)
ns1 <- nrow(ns)


#guardando num lugar pra passar pro grafico
x <- c(sim1,nao1,ns1)
lbls <- c("Não", "Sim", "Não sei/Não tenho opinião")
piepercent<- round(100*x/sum(x), 1)
lbls <- paste(lbls, piepercent) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
png(filename='./graficos/5B85B.png', width = 800, height = 500, pointsize = 16)
pie(x, labels = lbls, main ="Melhora resultado e troca de arquivos.")
dev.off()  # usado em complemento com a funcao png (ou outras funcoes para 
# gerar arquivos graficos)