# Problema de negócio - Prevendo Despesas Hospitalares

setwd("C:/MLR/DS")
getwd()

# Obtendo os dados
despesas <- read.csv("despesas.csv")
View(despesas)

# Explorando e Preparando os Dados
# Visualizando as variáveis
str(despesas)

# Sumarizando os dados -> mostra as medidas de tendencia central
summary(despesas)

# Construindo um histograma
hist(despesas$gastos, main = "Gastos com pacientes em (R$)", xlab = "Gastos (R$)")
