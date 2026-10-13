Algoritmo "DESAFIOA1ARENA"
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio 
// Descrição   :
// Autor(a)    : CAIO HENRIQUE SANTOS DA SILVA
// Data atual  : 02/10/2026

const
max_equipes = 4
pontos_vitoria = 3
pontos_derrota = 0
pontos_empate = 1
tipo
equipe = registro
codigo: inteiro
nome: caractere
capitao: caractere
vitorias: inteiro
empates: inteiro
derrotas: inteiro
pontosMarcados: inteiro
pontosSofridos: inteiro
saldo: inteiro
pontuacao: inteiro
fimregistro

Var
// Seção de Declarações das variáveis 
 times: vetor[1..max_equipes] de equipe
 ordem: vetor[1..max_equipes]
 quantidadeEquipes: inteiro
 opcao: inteiro
 matrizPontos: vetor[1..max_equipes, 1..max_equipes] de inteiro
 i, j: inteiro
 totalVitorias: inteiro


 
 
 procedimento cadastrarEquipe()
 var
 codigoNovo, i: inteiro
 nomeNovo, capitaoNovo: caractere
 duplicado: logico

 
 inicio
 
 se quantidadeEquipes >= max_equipes entao
 escreval("Limite de equipes atingido!")
 senao
escreva("Digite o codigo da equipe: ")
leia(codigoNovo)
duplicado <- falso
para i de 1 ate quantidadeEquipes faca
se times[i].codigo = codigoNovo entao
duplicado <- verdadeiro
fimse
fimpara
se duplicado = verdadeiro entao
escreval("Esse codigo ja esta cadastrado!")
senao
escreva("Digite o nome da equipe: ")
leia(nomeNovo)
enquanto nomeNovo = "" faca
escreva("O nome nao pode ficar vazio. Digite novamente: ")
leia(nomeNovo)
fimenquanto
escreva("Digite o nome do capitao: ")
leia(capitaoNovo)
enquanto capitaoNovo = "" faca
escreva("O capitao nao pode ficar vazio. Digite novamente: ")
leia(capitaoNovo)
fimenquanto
quantidadeEquipes <- quantidadeEquipes + 1
times[quantidadeEquipes].codigo <- codigoNovo
times[quantidadeEquipes].nome <- nomeNovo
times[quantidadeEquipes].capitao <- capitaoNovo
times[quantidadeEquipes].vitorias <- 0
times[quantidadeEquipes].empates <- 0
times[quantidadeEquipes].derrotas <- 0
times[quantidadeEquipes].pontosMarcados <- 0
times[quantidadeEquipes].pontosSofridos <- 0
times[quantidadeEquipes].saldo <- 0
times[quantidadeEquipes].pontuacao <- 0
escreval("Equipe cadastrada com sucesso!")
fimse
fimse
fimprocedimento

procedimento listarEquipes()
var
i: inteiro

inicio
se quantidadeEquipes = 0 entao
escreval("Nenhuma equipe cadastrada!")
senao
escreval("===== EQUIPES CADASTRADAS =====")
para i de 1 ate quantidadeEquipes faca
escreval("------------------------------")
escreval("Codigo: ", times[i].codigo)
escreval("Nome: ", times[i].nome)
escreval("Capitao: ", times[i].capitao)
escreval("Vitorias: ", times[i].vitorias)
escreval("Empates: ", times[i].empates)
escreval("Derrotas: ", times[i].derrotas)
escreval("Pontuacao: ", times[i].pontuacao)
fimpara
escreval("------------------------------")

fimse
fimprocedimento

procedimento consultarEquipe()
var
codigoBusca, i: inteiro
encontrada: logico

inicio
se quantidadeEquipes = 0 entao
escreval("Nenhuma equipe cadastrada!")
senao
escreva("Digite o codigo da equipe que deseja consultar: ")
leia(codigoBusca)

encontrada <- falso
para i de 1 ate quantidadeEquipes faca
se times[i].codigo = codigoBusca entao
encontrada <- verdadeiro
escreval("===== DADOS DA EQUIPE =====")
escreval("Codigo: ", times[i].codigo)
escreval("Nome: ", times[i].nome)
escreval("Capitao: ", times[i].capitao)
escreval("Vitorias: ", times[i].vitorias)
escreval("Empates: ", times[i].empates)
escreval("Derrotas: ", times[i].derrotas)
escreval("Pontos marcados: ", times[i].pontosMarcados)
escreval("Pontos sofridos: ", times[i].pontosSofridos)
escreval("Saldo: ", times[i].saldo)
escreval("Pontuacao: ", times[i].pontuacao)
fimse
fimpara
se encontrada = falso entao
escreval("Equipe nao encontrada!")
fimse
fimse
fimprocedimento

procedimento registrarPartida()
var
codigo1, codigo2: inteiro
indice1, indice2, i: inteiro
pontos1, pontos2: inteiro

inicio
se quantidadeEquipes < 2 entao
escreval("Cadastre pelo menos duas equipes!")
senao
escreval("===== REGISTRAR PARTIDA =====")
escreva("Codigo da primeira equipe: ")
  leia(codigo1)
  
escreva("Codigo da segunda equipe: ")
leia(codigo2)
indice1 <- 0
indice2 <- 0
para i de 1 ate quantidadeEquipes faca
se times[i].codigo = codigo1 entao
indice1 <- i
fimse
se times[i].codigo = codigo2 entao
indice2 <- i
fimse
fimpara
se (indice1 = 0) ou (indice2 = 0) entao
escreval("Uma ou ambas as equipes nao foram encontradas!")
senao
se indice1 = indice2 entao
escreval("Uma equipe nao pode jogar contra ela mesma!")
senao
escreva("Pontos marcados pela primeira equipe: ")
leia(pontos1)
escreva("Pontos marcados pela segunda equipe: ")
leia(pontos2)
enquanto (pontos1 < 0) ou (pontos2 < 0) faca
escreval("Os pontos nao podem ser negativos!")
escreva("Pontos da primeira equipe: ")
leia(pontos1)
escreva("Pontos da segunda equipe: ")
leia(pontos2)
fimenquanto
times[indice1].pontosMarcados <- times[indice1].pontosMarcados + pontos1
times[indice1].pontosSofridos <- times[indice1].pontosSofridos + pontos2
times[indice2].pontosMarcados <- times[indice2].pontosMarcados + pontos2
times[indice2].pontosSofridos <- times[indice2].pontosSofridos + pontos1
times[indice1].saldo <- times[indice1].pontosMarcados - times[indice1].pontosSofridos
times[indice2].saldo <- times[indice2].pontosMarcados - times[indice2].pontosSofridos
se pontos1 > pontos2 entao
times[indice1].vitorias <- times[indice1].vitorias + 1
times[indice2].derrotas <- times[indice2].derrotas + 1
times[indice1].pontuacao <- times[indice1].pontuacao + pontos_vitoria
times[indice2].pontuacao <- times[indice2].pontuacao + pontos_derrota
senao
se pontos2 > pontos1 entao
times[indice2].vitorias <- times[indice2].vitorias + 1
times[indice1].derrotas <- times[indice1].derrotas + 1
times[indice2].pontuacao <- times[indice2].pontuacao + pontos_vitoria
times[indice1].pontuacao <- times[indice1].pontuacao + pontos_derrota
senao
times[indice1].empates <- times[indice1].empates + 1
times[indice2].empates <- times[indice2].empates + 1
times[indice1].pontuacao <- times[indice1].pontuacao + pontos_empate
times[indice2].pontuacao <- times[indice2].pontuacao + pontos_empate
fimse
fimse
matrizPontos[indice1, indice2] <- pontos1
matrizPontos[indice2, indice1] <- pontos2
escreval("Partida registrada com sucesso!")
fimse
fimse
fimse
fimprocedimento

procedimento classificacaoGeral()
var
i, j: inteiro
aux: equipe
trocar: logico

inicio
se quantidadeEquipes = 0 entao
escreval("Nenhuma equipe cadastrada!")
senao
para i de 1 ate quantidadeEquipes - 1 faca
para j de 1 ate quantidadeEquipes - i faca
trocar <- falso
se times[j].pontuacao < times[j + 1].pontuacao entao
trocar <- verdadeiro
senao
se times[j].pontuacao = times[j + 1].pontuacao entao
se times[j].saldo < times[j + 1].saldo entao
trocar <- verdadeiro
senao
se times[j].saldo = times[j + 1].saldo entao
se times[j].pontosMarcados < times[j + 1].pontosMarcados entao
trocar <- verdadeiro
fimse
fimse
fimse
fimse
fimse
se trocar = verdadeiro entao
aux <- times[j]
times[j] <- times[j + 1]
times[j + 1] <- auxiliar
fimse
fimpara
fimpara
escreval("===== CLASSIFICACAO GERAL =====")
para i de 1 ate quantidadeEquipes faca
escreval(i, " lugar: ", times[i].nome)
escreval("Pontuacao: ", times[i].pontuacao)
escreval("Vitorias: ", times[i].vitorias)
escreval("Empates: ", times[i].empates)
escreval("Derrotas: ", times[i].derrotas)
escreval("Saldo: ", times[i].saldo)
escreval("------------------------------")
fimpara
fimse
fimprocedimento

procedimento exibirEstatisticas()
var
i: inteiro
maiorVitorias, maiorPontos: inteiro
indiceVitorias, indicePontos: inteiro

inicio
escreval("===== ESTATISTICAS DO CAMPEONATO =====")
escreval("Total de equipes cadastradas: ", quantidadeEquipes)

se quantidadeEquipes = 0 entao
escreval("Cadastre equipes para gerar estatisticas!")
senao
maiorVitorias <- times[1].vitorias
indiceVitorias <- 1
maiorPontos <- times[1].pontosMarcados
indicePontos <- 1

para i de 2 ate quantidadeEquipes faca
se times[i].vitorias > maiorVitorias entao
maiorVitorias <- times[i].vitorias
indiceVitorias <- i
fimse
se times[i].pontosMarcados > maiorPontos entao
maiorPontos <- times[i].pontosMarcados
indicePontos <- i
fimse
fimpara
escreval("------------------------------")
escreval("Equipe com mais vitorias: ", times[indiceVitorias].nome)
escreval("Quantidade de vitorias: ", maiorVitorias)
escreval("------------------------------")
escreval("Equipe com mais pontos marcados: ", times[indicePontos].nome)
escreval("Pontos marcados: ", maiorPontos)
fimse
fimprocedimento

procedimento consultarConfrontos()
var
codigo1, codigo2: inteiro
indice1, indice2, i: inteiro

inicio
se quantidadeEquipes < 2 entao
escreval("Cadastre pelo menos duas equipes!")
senao
escreva("Codigo da primeira equipe: ")
leia(codigo1)
escreva("Codigo da segunda equipe: ")
leia(codigo2)

indice1 <- 0
indice2 <- 0
para i de 1 ate quantidadeEquipes faca
se times[i].codigo = codigo1 entao
indice1 <- i
fimse
se times[i].codigo = codigo2 entao
indice2 <- i
fimse
fimpara
se (indice1 = 0) ou (indice2 = 0) entao
escreval("Equipe nao encontrada!")
senao
se indice1 = indice2 entao
escreval("Escolha duas equipes diferentes!")
senao
se matrizPontos[indice1, indice2] = -1 entao
escreval("Esse confronto ainda nao foi registrado!")
senao
escreval("===== RESULTADO DO CONFRONTO =====")
escreval(times[indice1].nome, ": ", matrizPontos[indice1,indice2])
escreval(times[indice2].nome, ": ", matrizPontos[indice2,indice1])
fimse
fimse
fimse
fimse
fimprocedimento

procedimento somarVitoriasRecursivo(posicao: inteiro)
inicio
se posicao > 0 entao
totalVitorias <- totalVitorias + times[posicao].vitorias
somarVitoriasRecursivo(posicao - 1)
fimse
fimprocedimento
procedimento executarRecursividade()
inicio
totalVitorias <- 0
somarVitoriasRecursivo(quantidadeEquipes)
escreval("===== RECURSIVIDADE =====")
escreval("Total de vitorias das equipes: ", totalVitorias)
fimprocedimento




Inicio

 quantidadeEquipes <- 0
 
para i de 1 ate max_equipes faca
para j de 1 ate max_equipes faca
matrizPontos[i,j] <- -1
fimpara
fimpara
 
 repita
 
escreval("==============================")
escreval("   ARENA CODE CHAMPIONSHIP")
escreval("==============================")
escreval("1. Cadastrar equipe")
escreval("2. Listar equipes")
escreval("3. Registrar resultado de partida")
escreval("4. Consultar equipe")
escreval("5. Exibir classificacao geral")
escreval("6. Exibir estatisticas")
escreval("7. Consultar confrontos")
escreval("8. Executar recurso recursivo")
escreval("9. Encerrar sistema")
escreval("==============================")
escreva("Escolha uma opcao: ")
leia(opcao)
escolha opcao
caso 1
cadastrarEquipe()
caso 2
listarEquipes()
caso 3
registrarPartida()
caso 4
consultarEquipe()
caso 5
classificacaoGeral()
caso 6
exibirEstatisticas()
caso 7
consultarConfrontos()
caso 8
executarRecursividade()
caso 9
escreval("Encerrar o sistema...")
outrocaso
escreval("Opcao invalida!")
fimescolha
ate opcao = 9



Fimalgoritmo