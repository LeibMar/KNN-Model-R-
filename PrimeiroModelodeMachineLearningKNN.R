iris
str(iris)

#a função abaixo trava os mesmos números atribuidos nas linhas embaralhadas e quando invocado em outra seção, aplicará a mesma distribuição caso o código a seguir seja rodado novamente
set.seed(1234)
h <- runif(nrow(iris))
h

irisS <- iris[order(h), ]

head(irisS)

str(irisS)
train <- irisS[1:100, ]
test <- irisS[101:150, ]
str(test)

summary(irisS[, c(1,2,3)])

normalize <- function(x) {
  + return((x - min(x))/ (max(x) - min(x)) ) }
#linha abaixo é só um teste
normalize(c(10,20,30,40,50))

iris_n <- as.data.frame(lapply(irisS[, c(1,2,3,4)], normalize))

iris_n_train <- iris_n[1:120, ]
iris_n_test <- iris_n[121:150, ]
#abaixo voltamos a selecionar irisS porque ele ainda tem a coluna species 
iris_train_target <- irisS[1:120,5]
iris_test_target <- irisS[121:150,5]

m1 <- knn(train = iris_n_train, test = iris_n_test, cl = iris_train_target, k = 13)
m1

#visualização dos resultados do teste
table(iris_test_target, m1)

