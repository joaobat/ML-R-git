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
hist(despesas$gastos, main = "Gastos com despesas hospitalares (R$)", xlab = "Gastos (R$)")

# Gerando uma tabela de contingencia das regiões
table(despesas$regiao)

# Matriz de correlação -> relação entre as variaveis
cor(despesas[c("idade", "bmi", "filhos", "gastos")])

# Nenhuma das correlações na matriz é considerada forte, mas existem algumas associaçõe interessantes.
# A idade e o bmi (IMC) parecem ter uma correlação positiva fraca, o que significa que 
# com o aumento da idade, a massa corporal tende a aumentar. há uma correlação positiva 
# moderada entre a idade e os gasto, além do numero de filhos e os gastos.
# Estas associações implicam que a medida que idade, massa corporal e numeros de filhos aumenta,
# o custo esperado do seguro saude sobe.

# Visualizando relacionamento entre as variaveis: scatterplot
pairs(despesas[c("idade", "bmi", "filhos", "gastos")])

# Scatterplot Matrix
install.packages("psych")
library(psych)

# Obtendo mais informações sobre o relacionamento entre as variaveis
pairs.panels(despesas[c("idade", "bmi", "filhos", "gastos")])

# Construir o modelo - usando a função lm()
# Usamos para este problema o modelo de regressão linear multipla
modelo <- lm(gastos ~ ., data = despesas)

# Visualizando os coeficientes
modelo

# Prevendo despesas médicas
despesasteste <- read.csv("despesas-teste.csv")
View(despesasteste)
previsao <- predict(modelo, despesasteste)
View(previsao)

# Avaliando a performance do modelo
summary(modelo)

# Otimizando a performance do modelo

# Adicionando uma variavel com o dobro do valor da idades
despesas$idade2 <- despesas$idade ^2

# Adicionando um indicador para BMI >= 30
despesas$bmi30 <- ifelse(despesas$bmi >= 30, 1, 0)
View(despesas)

# Criando a versão 2 do modelo
modelo_v2 <- lm(gastos ~ idade + idade2 + filhos + bmi + sexo +
                  bmi30 * fumante + regiao, data = despesas)

summary(modelo_v2)

# Testando o modelo
despesasteste <- read.csv("despesas-teste.csv")
previsao_v2 <- predict(modelo, despesasteste)
View(previsao_v2)









