\documentclass[a4paper]{article}
\usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
\usepackage{palatino}
\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref}
\usepackage{graphicx}
\usepackage{cp1819t}
\usepackage{subcaption}
\usepackage{adjustbox}
\usepackage{color}
%================= local x=====================================================%
\def\getGif#1{\includegraphics[width=0.3\textwidth]{cp1819t_media/#1.png}}
\let\uk=\emph
\def\aspas#1{``#1"}
%================= lhs2tex=====================================================%
%include polycode.fmt 
%format (expn (a) (n)) = "{" a "}^{" n "}"
%format (div (x)(y)) = x "\div " y
%format succ = "\succ "
%format ==> = "\Longrightarrow "
%format map = "\map "
%format length = "\length "
%format fst = "\p1"
%format p1  = "\p1"
%format snd = "\p2"
%format p2  = "\p2"
%format Left = "i_1"
%format Right = "i_2"
%format i1 = "i_1"
%format i2 = "i_2"
%format >< = "\times"
%format >|<  = "\bowtie "
%format |-> = "\mapsto"
%format . = "\comp "
%format (kcomp (f)(g)) = f "\kcomp " g
%format -|- = "+"
%format conc = "\mathsf{conc}"
%format summation = "{\sum}"
%format (either (a) (b)) = "\alt{" a "}{" b "}"
%format (frac (a) (b)) = "\frac{" a "}{" b "}"
%format (uncurry f) = "\uncurry{" f "}"
%format (const f) = "\underline{" f "}"
%format TLTree = "\mathsf{TLTree}"
%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
%format (split (x) (y)) = "\conj{" x "}{" y "}"
%format (for (f) (i)) = "\for{" f "}\ {" i "}"
%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
\def\ana#1{\mathopen{[\!(}#1\mathclose{)\!]}}
%format (cataA (f) (g)) = "\cata{" f "~" g "}_A"
%format (anaA (f) (g)) = "\ana{" f "~" g "}_A"
%format (cataB (f) (g)) = "\cata{" f "~" g "}_B"
%format (anaB (f) (g)) = "\ana{" f "~" g "}_B"
%format Either a b = a "+" b 
%format fmap = "\mathsf{fmap}"
%format NA   = "\textsc{na}"
%format NB   = "\textsc{nb}"
%format inT = "\mathsf{in}"
%format outT = "\mathsf{out}"
%format Null = "1"
%format (Prod (a) (b)) = a >< b
%format fF = "\fun F "
%format e1 = "e_1 "
%format e2 = "e_2 "
%format Dist = "\fun{Dist}"
%format IO = "\fun{IO}"
%format BTree = "\fun{BTree} "
%format LTree = "\mathsf{LTree}"
%format inNat = "\mathsf{in}"
%format (cataNat (g)) = "\cata{" g "}"
%format Nat0 = "\N_0"
%format muB = "\mu "
%format (frac (n)(m)) = "\frac{" n "}{" m "}"
%format (fac (n)) = "{" n "!}"
%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
%format matrix = "matrix"
%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
%format `ominus` = "\mathbin{\ominus}"
%format % = "\mathbin{/}"
%format <-> = "{\,\leftrightarrow\,}"
%format <|> = "{\,\updownarrow\,}"
%format `minusNat`= "\mathbin{-}"
%format ==> = "\Rightarrow"
%format .==>. = "\Rightarrow"
%format .<==>. = "\Leftrightarrow"
%format .==. = "\equiv"
%format .<=. = "\leq"
%format .&&&. = "\wedge"
%format cdots = "\cdots "
%format pi = "\pi "

%---------------------------------------------------------------------------

\title{
            Cálculo de Programas
\\
        Trabalho Prático
\\
        MiEI+LCC --- 2018/19
}

\author{
        \dium
\\
        Universidade do Minho
}


\date\mydate

\makeindex
\newcommand{\rn}[1]{\textcolor{red}{#1}}
\begin{document}

\maketitle

\begin{center}\large
\begin{tabular}{ll}
\textbf{Grupo} nr. & 26
\\\hline
a85227 & João Pedro Rodrigues Azevedo  
\\
a83719 & Pedro Filipe Costa Machado  
\\
a85729 & Paulo Jorge da Silva Araújo 
\end{tabular}
\end{center}

\section{Preâmbulo}

A disciplina de \CP\ tem como objectivo principal ensinar
a progra\-mação de computadores como uma disciplina científica. Para isso
parte-se de um repertório de \emph{combinadores} que formam uma álgebra da
programação (conjunto de leis universais e seus corolários) e usam-se esses
combinadores para construir programas \emph{composicionalmente}, isto é,
agregando programas já existentes.
  
Na sequência pedagógica dos planos de estudo dos dois cursos que têm
esta disciplina, restringe-se a aplicação deste método à programação
funcional em \Haskell. Assim, o presente trabalho prático coloca os
alunos perante problemas concretos que deverão ser implementados em
\Haskell.  Há ainda um outro objectivo: o de ensinar a documentar
programas, validá-los, e a produzir textos técnico-científicos de
qualidade.

\section{Documentação} Para cumprir de forma integrada os objectivos
enunciados acima vamos recorrer a uma técnica de programa\-ção dita
``\litp{literária}'' \cite{Kn92}, cujo princípio base é o seguinte:
\begin{quote}\em Um programa e a sua documentação devem coincidir.
\end{quote} Por outras palavras, o código fonte e a documentação de um
programa deverão estar no mesmo ficheiro.

O ficheiro \texttt{cp1819t.pdf} que está a ler é já um exemplo de \litp{programação
literária}: foi gerado a partir do texto fonte \texttt{cp1819t.lhs}\footnote{O
suffixo `lhs' quer dizer \emph{\lhaskell{literate Haskell}}.} que encontrará
no \MaterialPedagogico\ desta disciplina descompactando o ficheiro \texttt{cp1819t.zip}
e executando
\begin{Verbatim}[fontsize=\small]
    $ lhs2TeX cp1819t.lhs > cp1819t.tex
    $ pdflatex cp1819t
\end{Verbatim}
em que \href{https://hackage.haskell.org/package/lhs2tex}{\texttt\LhsToTeX} é
um pre-processador que faz ``pretty printing''
de código Haskell em \Latex\ e que deve desde já instalar executando
\begin{Verbatim}[fontsize=\small]
    $ cabal install lhs2tex
\end{Verbatim}
Por outro lado, o mesmo ficheiro \texttt{cp1819t.lhs} é executável e contém
o ``kit'' básico, escrito em \Haskell, para realizar o trabalho. Basta executar
\begin{Verbatim}[fontsize=\small]
    $ ghci cp1819t.lhs
\end{Verbatim}

%if False
\begin{code}
{-# OPTIONS_GHC -XNPlusKPatterns #-}
{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable, FlexibleInstances #-}
module Cp1819t where 
import Cp
import List  hiding (fac)
import Nat  
import Data.List hiding (find)
import Data.Typeable
import Data.Ratio
import Data.Bifunctor
import Data.Maybe
import Data.Matrix hiding ((!))
import Test.QuickCheck hiding ((><),choose)
import qualified Test.QuickCheck as QuickCheck
import System.Random  hiding (split)
import System.Process
import GHC.IO.Exception
import qualified Graphics.Gloss as G
import Control.Monad
import Control.Applicative hiding ((<|>))
import Data.Either
import Data.Char
import Exp
\end{code}
%endif

\noindent Abra o ficheiro \texttt{cp1819t.lhs} no seu editor de texto preferido
e verifique que assim é: todo o texto que se encontra dentro do ambiente
\begin{quote}\small\tt
\verb!\begin{code}!
\\ ... \\
\verb!\end{code}!
\end{quote}
vai ser seleccionado pelo \GHCi\ para ser executado.

\section{Como realizar o trabalho}
Este trabalho teórico-prático deve ser realizado por grupos de três alunos.
Os detalhes da avaliação (datas para submissão do relatório e sua defesa
oral) são os que forem publicados na \cp{página da disciplina} na \emph{internet}.

Recomenda-se uma abordagem participativa dos membros do grupo
de trabalho por forma a poderem responder às questões que serão colocadas
na \emph{defesa oral} do relatório.

Em que consiste, então, o \emph{relatório} a que se refere o parágrafo anterior?
É a edição do texto que está a ser lido, preenchendo o anexo \ref{sec:resolucao}
com as respostas. O relatório deverá conter ainda a identificação dos membros
do grupo de trabalho, no local respectivo da folha de rosto.

Para gerar o PDF integral do relatório deve-se ainda correr os comando seguintes,
que actualizam a bibliografia (com \Bibtex) e o índice remissivo (com \Makeindex),
\begin{Verbatim}[fontsize=\small]
    $ bibtex cp1819t.aux
    $ makeindex cp1819t.idx
\end{Verbatim}
e recompilar o texto como acima se indicou. Dever-se-á ainda instalar o utilitário
\QuickCheck,
que ajuda a validar programas em \Haskell\ e a biblioteca \gloss{Gloss} para
geração de gráficos 2D:
\begin{Verbatim}[fontsize=\small]
    $ cabal install QuickCheck gloss
\end{Verbatim}
Para testar uma propriedade \QuickCheck~|prop|, basta invocá-la com o comando:
\begin{verbatim}
    > quickCheck prop
    +++ OK, passed 100 tests.
\end{verbatim}

Qualquer programador tem, na vida real, de ler e analisar (muito!) código
escrito por outros. No anexo \ref{sec:codigo} disponibiliza-se algum
código \Haskell\ relativo aos problemas que se seguem. Esse anexo deverá
ser consultado e analisado à medida que isso for necessário.

\Problema

Um compilador é um programa que traduz uma linguagem dita de
\emph{alto nível} numa linguagem (dita de \emph{baixo nível}) que
seja executável por uma máquina.
Por exemplo, o \gcc{GCC} compila C/C++ em código objecto que
corre numa variedade de arquitecturas.

Compiladores são normalmente programas complexos.
Constam essencialmente de duas partes:
o \emph{analisador sintático} que lê o texto de entrada
(o programa \emph{fonte} a compilar) e cria uma sua representação
interna, estruturada em árvore;
e o \emph{gerador de código} que converte essa representação interna
em código executável.
Note-se que tal representação intermédia pode ser usada para outros fins,
por exemplo,
para gerar uma listagem de qualidade (\uk{pretty print}) do programa fonte.

O projecto de compiladores é um assunto complexo que
será assunto de outras disciplinas.
Neste trabalho pretende-se apenas fazer uma introdução ao assunto,
mostrando como tais programas se podem construir funcionalmente à custa de
cata/ana/hilo-morfismos da linguagem em causa.

Para cumprirmos o nosso objectivo, a linguagem desta questão terá que ser, naturalmente,
muito simples: escolheu-se a das expressões aritméticas com inteiros,
\eg\ \( 1 + 2 \), \( 3 * (4 + 5) \) etc.
Como representação interna adopta-se o seguinte tipo polinomial, igualmente simples:
%
\begin{spec}
data Expr = Num Int | Bop Expr Op Expr 
data Op = Op String
\end{spec}

\begin{enumerate}
\item
Escreva as definições dos \{cata, ana e hilo\}-morfismos deste tipo de dados
segundo o método ensinado nesta disciplina (recorde módulos como \eg\ |BTree| etc).
\item
Como aplicação do módulo desenvolvido no ponto 1,
defina como \{cata, ana ou hilo\}-morfismo a função seguinte:
\begin{itemize}
\item |calcula :: Expr -> Int| que calcula o valor
de uma expressão;
\begin{propriedade}
O valor zero é um elemento neutro da adição.
\begin{code}
prop_neutro1 :: Expr -> Bool
prop_neutro1 = calcula . addZero .==. calcula where
            addZero e = Bop (Num 0) (Op "+") e
prop_neutro2 :: Expr -> Bool
prop_neutro2 = calcula . addZero .==. calcula where
            addZero e = Bop e (Op "+") (Num 0) 
\end{code}
\end{propriedade}  
\begin{propriedade}
As operações de soma e multiplicação são comutativas.
\begin{code}
prop_comuta = calcula . mirror .==. calcula where
            mirror = cataExpr (either Num g2)
            g2 = (uncurry (uncurry Bop)) . (swap >< id) . assocl . (id >< swap)
\end{code}
\end{propriedade}  
\end{itemize}
\item
Defina como \{cata, ana ou hilo\}-morfismos as funções
\begin{itemize}
\item |compile :: String -> Codigo| - trata-se do compilador propriamente
      dito. Deverá ser gerado código posfixo para uma máquina elementar
      de \pda{stack}. O tipo |Codigo| pode ser definido à escolha.
      Dão-se a seguir exemplos de comportamentos aceitáveis para esta
      função:
\begin{verbatim}
Tp4> compile "2+4"
["PUSH 2", "PUSH 4", "ADD"]
Tp4> compile "3*(2+4)"
["PUSH 3", "PUSH 2", "PUSH 4", "ADD", "MUL"]
Tp4> compile "(3*2)+4"
["PUSH 3", "PUSH 2", "MUL", "PUSH 4", "ADD"]
Tp4> 
\end{verbatim}
\item |show' :: Expr -> String| - gera a representação textual
      de uma |Expr| pode encarar-se como o \uk{pretty printer}
      associado ao nosso compilador
\begin{propriedade}
Em anexo, é fornecido o código da função |readExp|, que é ``inversa" da função |show'|,
tal como a propriedade seguinte descreve:
\begin{code}
prop_inv :: Expr -> Bool
prop_inv = p1 . head . readExp . show' .==. id
\end{code}
\end{propriedade}  
\end{itemize}
%% \item Generalize o tipo |Expr| de forma a admitir operadores
%% unários (\eg\ \(-5\)) e repita os exercícios dos pontos anteriores.
\end{enumerate}

\paragraph{Valorização}
Em anexo é apresentado código \Haskell\ que permite declarar
|Expr| como instância da classe |Read|. Neste contexto,  
|read| pode ser vista como o analisador
sintático do nosso minúsculo compilador de expressões aritméticas.

Analise o código apresentado, corra-o e escreva no seu relatório uma explicação
\textbf{breve} do seu funcionamento, que deverá saber defender aquando da
apresentação oral do relatório.

Exprima ainda o analisador sintático |readExp| como um anamorfismo.

\Problema

Pretende-se neste problema definir uma linguagem gráfica \aspas{brinquedo}
a duas dimensões (2D) capaz de especificar e desenhar agregações de
caixas que contêm informação textual.
Vamos designar essa linguagem por |L2D| e vamos defini-la como um tipo
 em \Haskell:
\begin{code}
type L2D = X Caixa Tipo 
\end{code}
onde |X| é a estrutura de dados
\begin{code}
data X a b = Unid a | Comp b (X a b) (X a b) deriving Show
\end{code}
e onde:
\begin{code}
type Caixa = ((Int,Int),(Texto,G.Color))
type Texto = String
\end{code}
Assim, cada caixa de texto é especificada pela sua largura, altura, o seu
texto e a sua côr.\footnote{Pode relacionar |Caixa| com as caixas de texto usadas
nos jornais ou com \uk{frames} da linguagem \Html\ usada na Internet.}
Por exemplo,
\begin{spec}
((200,200),("Caixa azul",col_blue))
\end{spec}
designa a caixa da esquerda da figura \ref{fig:L2D}.

O que a linguagem |L2D| faz é agregar tais caixas tipográficas
umas com as outras segundo padrões especificados por vários
\aspas{tipos}, a saber,
\begin{code}
data Tipo = V | Vd | Ve | H | Ht | Hb 
\end{code}
com o seguinte significado:
\begin{itemize}
\item[|V|] - agregação vertical alinhada ao centro
\item[|Vd|] - agregação vertical justificada à direita
\item[|Ve|] - agregação vertical justificada à esquerda
\item[|H|] - agregação horizontal alinhada ao centro
\item[|Hb|] - agregação horizontal alinhada pela base
\item[|Ht|] - agregação horizontal alinhada pelo topo
\end{itemize}
Como |L2D| instancia o parâmetro |b| de |X| com
|Tipo|, é fácil de ver que cada \aspas{frase} da linguagem
|L2D| é representada por uma árvore binária em que cada nó
indica qual o tipo de agregação a aplicar às suas duas sub-árvores.
%
Por exemplo, a frase
\begin{code}
ex2= Comp Hb  (Unid ((100,200),("A",col_blue)))
              (Unid ((50,50),("B",col_green)))
\end{code}
deverá corresponder à imagem da direita da figura \ref{fig:L2D}.
E poder-se-á ir tão longe quando a linguagem o permita. Por exemplo, pense na
estrutura da frase que representa o \uk{layout} da figura \ref{fig:L2D1}.

\begin{figure}
\centering
\begin{picture}(190.00,130.00)(-15,-15)
\put(00.00,0.00){$(0,0)$}
\put(80.00,50.00){$(200,200)$}
\put(20.00,-10.00){
  \includegraphics[width=70\unitlength]{cp1819t_media/ex3.png}
}
\end{picture}
%
\includegraphics[width=0.2\textwidth]{cp1819t_media/ex2.png}
%
\caption{Caixa simples e caixa composta.\label{fig:L2D}}
\end{figure}

\begin{figure}
\centering
\includegraphics[width=0.6\textwidth]{cp1819t_media/ex.png}
\caption{\uk{Layout} feito de várias caixas coloridas.\label{fig:L2D1}}
\end{figure}

É importante notar que cada ``caixa'' não dispõe informação relativa
ao seu posicionamento final na figura. De facto, é a posição relativa
que deve ocupar face às restantes caixas que irá determinar a sua
posição final. Este é um dos objectivos deste trabalho:
\emph{calcular o posicionamento absoluto de cada uma das caixas por forma a
respeitar as restrições impostas pelas diversas agregações}. Para isso vamos
considerar um tipo de dados que comporta a informação de todas as
caixas devidamente posicionadas (i.e. com a informação adicional da
origem onde a caixa deve ser colocada).

\begin{spec}
type Fig = [(Origem,Caixa)]
type Origem = (Float, Float)
\end{spec}
%
A informação mais relevante deste tipo é a referente à lista de
``caixas posicionadas'' (tipo |(Origem,Caixa)|). Regista-se aí a origem
da caixa que, com a informação da sua altura e comprimento, permite
definir todos os seus pontos (consideramos as caixas sempre paralelas
aos eixos). 

\begin{enumerate}
\item Forneça a definição da função |calc_origems|, que calcula as
coordenadas iniciais das caixas no plano:
\begin{spec}
calc_origems :: (L2D,Origem) -> X (Caixa,Origem) ()
\end{spec}
\item Forneça agora a definição da função |agrup_caixas|, que agrupa
todas as caixas e respectivas origens numa só lista:
\begin{spec}
agrup_caixas :: X (Caixa,Origem) () -> Fig
\end{spec}
\end{enumerate}

Um segundo problema neste projecto é \emph{descobrir como visualizar a
informação gráfica calculada por |desenho|}. A nossa estratégia para
superar o problema baseia-se na biblioteca \gloss{Gloss}, que permite a geração
de gráficos 2D. Para tal disponibiliza-se a função
\begin{spec}
crCaixa :: Origem  -> Float -> Float -> String -> G.Color -> G.Picture
\end{spec}
que cria um rectângulo com base numa coordenada, um valor para a largura, um valor
para a altura, um texto que irá servir de etiqueta, e a cor pretendida.
Disponibiliza-se também a função
\begin{spec}
display :: G.Picture -> IO ()
\end{spec}
que dado um valor do tipo |G.picture| abre uma janela com esse valor desenhado. O objectivo
final deste exercício é implementar então uma função 
\begin{spec}
mostra_caixas :: (L2D,Origem) -> IO ()
\end{spec}
que dada uma frase da linguagem |L2D| e coordenadas iniciais apresenta
o respectivo desenho no ecrã.
%
\textbf{Sugestão}: 
Use a função |G.pictures| disponibilizada na biblioteca \gloss{Gloss}.

\Problema

Nesta disciplina estudou-se como fazer \pd{programação dinâmica} por cálculo,
recorrendo à lei de recursividade mútua.\footnote{Lei (\ref{eq:fokkinga})
em \cite{Ol18}, página \pageref{eq:fokkinga}.}

Para o caso de funções sobre os números naturais (|Nat0|, com functor |fF
X = 1 + X|) é fácil derivar-se da lei que foi estudada uma
  \emph{regra de algibeira}
  \label{pg:regra}
que se pode ensinar a programadores que não tenham estudado
\cp{Cálculo de Programas}. Apresenta-se de seguida essa regra, tomando como exemplo o
cálculo do ciclo-\textsf{for} que implementa a função de Fibonacci, recordar
o sistema
\begin{spec}
fib 0 = 1
fib(n+1) = f n

f 0 = 1
f (n+1) = fib n + f n
\end{spec}
Obter-se-á de imediato
\begin{code}
fib' = p1 . for loop init where
   loop(fib,f)=(f,fib+f)
   init = (1,1)
\end{code}
usando as regras seguintes:
\begin{itemize}
\item O corpo do ciclo |loop| terá tantos argumentos quanto o número de funções mutuamente recursivas.
\item Para as variáveis escolhem-se os próprios nomes das funções, pela ordem
que se achar conveniente.\footnote{Podem obviamente usar-se outros símbolos, mas numa primeiraleitura
dá jeito usarem-se tais nomes.}
\item Para os resultados vão-se buscar as expressões respectivas, retirando a variável |n|.
\item Em |init| coleccionam-se os resultados dos casos de base das funções, pela mesma ordem.
\end{itemize}
Mais um exemplo, envolvendo polinómios no segundo grau a $x^2 + b x + c$ em |Nat0|.
Seguindo o método estudado nas aulas\footnote{Secção 3.17 de \cite{Ol18}.},
de $f\ x = a x^2 + b x + c$ derivam-se duas funções mutuamente recursivas:
\begin{spec}
f 0 = c
f (n+1) = f n + k n

k 0 = a + b
k(n+1) = k n + 2 a
\end{spec}
Seguindo a regra acima, calcula-se de imediato a seguinte implementação, em Haskell:
\begin{code}
f' a b c = p1 . for loop init where
  loop(f,k) = (f+k,k+2*a)
  init = (c,a+b) 
\end{code}

Qual é o assunto desta questão, então? Considerem fórmula que dá a série de Taylor da
função coseno:
\begin{eqnarray*}
  cos\ x = \sum_{i=0}^\infty \frac{(-1)^i}{(2i)!} x^{2i}
\end{eqnarray*}
Pretende-se o ciclo-\textsf{for} que implementa a função 
|cos' x n| que dá o valor dessa série tomando |i| até |n| inclusivé:
\begin{spec}
cos' x = cdots . for loop init where cdots
\end{spec}
%
\textbf{Sugestão}: Começar por estudar muito bem o processo de cálculo dado
no anexo \ref{sec:recmul} para o problema (semelhante) da função exponencial.

\begin{propriedade}
Testes de que |cos' x| calcula bem o coseno de |pi| e o coseno de |pi/2|:
\begin{code}
prop_cos1 n = n >= 10 ==> abs(cos pi - cos' pi n) < 0.001
prop_cos2 n = n >= 10 ==> abs(cos (pi/2) - cos' (pi/2) n) < 0.001
\end{code}
\end{propriedade}

\paragraph{Valorização} Transliterar |cos'| para a linguagem C; compilar
e testar o código. Conseguia, por intuição apenas, chegar a esta função?

\Problema

Pretende-se nesta questão desenvolver uma biblioteca de funções para
manipular \emph{sistemas de ficheiros} genéricos.
Um sistema de ficheiros será visto como uma associação de \emph{nomes}
a ficheiros ou \emph{directorias}.
Estas últimas serão vistas como sub-sistemas de ficheiros e assim
recursivamente.
Assumindo que |a| é o tipo dos identificadores dos ficheiros e
directorias, e que |b| é o tipo do conteúdo dos ficheiros,
podemos definir um tipo indutivo de dados para representar sistemas de
ficheiros da seguinte forma:
\begin{code}
data FS a b = FS [(a,Node a b)] deriving (Eq,Show)
data Node a b = File b | Dir (FS a b) deriving (Eq,Show)
\end{code}
Um caminho (\emph{path}) neste sistema de ficheiros pode ser representado pelo
seguinte tipo de dados:
\begin{code}
type Path a = [a]
\end{code}
Assumindo estes tipos de dados, o seguinte termo
\begin{spec}
FS [("f1", File "Ola"),
    ("d1", Dir (FS [("f2", File "Ole"),
                    ("f3", File "Ole")
                   ]))
   ]
\end{spec}
representará um sistema de ficheiros em cuja raíz temos um ficheiro chamado
|f1| com conteúdo |"Ola"| e uma directoria chamada |"d1"| constituída por dois
ficheiros, um chamado |"f2"| e outro chamado |"f3"|, ambos com conteúdo |"Ole"|.
%
Neste caso, tanto o tipo dos identificadores como o tipo do conteúdo dos
ficheiros é |String|. No caso geral, o conteúdo de um ficheiro é arbitrário:
pode ser um binário, um texto, uma colecção de dados, etc.

A definição das usuais funções |inFS| e |recFS| para este tipo é a seguinte:
\begin{code}
inFS = FS . map (id >< inNode) 
inNode = either File Dir

recFS f = baseFS id id f
\end{code}
Suponha que se pretende definir como um |catamorfismo| a função que
conta o número de ficheiros existentes num sistema de ficheiros. Uma
possível definição para esta função seria:
\begin{code}
conta :: FS a b -> Int
conta = cataFS (sum . map ((either (const 1) id) . snd))
\end{code}
O que é para fazer:
\begin{enumerate}
\item Definir as funções |outFS|, |baseFS|, |cataFS|, |anaFS| e |hyloFS|.

\item Apresentar, no relatório, o diagrama de |cataFS|.

\item Definir as seguintes funções para manipulação de sistemas de
  ficheiros usando, obrigatoriamente, catamorfismos, anamorfismos ou
  hilomorfismos:

  \begin{enumerate}
  \item Verificação da integridade do sistema de ficheiros (i.e. verificar
    que não existem identificadores repetidos dentro da mesma directoria). \\
    |check :: FS a b -> Bool|
  \begin{propriedade}
    A integridade de um sistema de ficheiros não depende da ordem em que os    
    últimos são listados na sua directoria:
\begin{code}
prop_check :: FS String String -> Bool
prop_check = check . (cataFS (inFS . reverse)).==. check
\end{code}
  \end{propriedade}  
  \item Recolha do conteúdo de todos os ficheiros num arquivo indexado pelo \emph{path}.\\
    |tar :: FS a b -> [(Path a, b)]|
  \begin{propriedade}
    O número de ficheiros no sistema deve ser igual ao número de ficheiros
    listados pela função |tar|.
\begin{code}
prop_tar :: FS String String -> Bool
prop_tar = length . tar .==. conta 
\end{code}
  \end{propriedade}  
  \item Transformação de um arquivo com o conteúdo dos ficheiros
    indexado pelo \emph{path} num sistema de ficheiros.\\
    |untar :: [(Path a, b)] -> FS a b| \\
  \textbf{Sugestão}: Use a função |joinDupDirs| para juntar directorias que estejam na mesma
  pasta e que possuam o mesmo identificador.
  \begin{propriedade}
    A composição |tar . untar| preserva o número de ficheiros no sistema.
\begin{code}
prop_untar :: [(Path String, String)] -> Property
prop_untar = validPaths .==>. ((length . tar . untar) .==. length)
validPaths :: [(Path String, String)] -> Bool
validPaths = (== 0) . length . (filter (\(a,_) -> length a == 0))
\end{code}
\end{propriedade}  
  \item Localização de todos os \emph{paths} onde existe um
    determinado ficheiro.\\
    |find :: a -> FS a b -> [Path a]|
  \begin{propriedade}
    A composição |tar . untar| preserva todos os ficheiros no sistema.
\begin{code}
prop_find :: String -> FS String String -> Bool
prop_find = curry $ 
      length . (uncurry find) .==. length . (uncurry find) . (id >< (untar . tar))
\end{code}
  \end{propriedade}  
  \item Criação de um novo ficheiro num determinado \emph{path}.\\
    |new :: Path a -> b -> FS a b -> FS a b|
  \begin{propriedade}
A adição de um ficheiro não existente no sistema não origina ficheiros duplicados.
\begin{code}
prop_new :: ((Path String,String), FS String String) -> Property
prop_new = ((validPath .&&&. notDup) .&&&. (check . p2)) .==>. 
      (checkFiles . (uncurry (uncurry new)))  where
      validPath = (/=0) . length . p1 . p1
      notDup = not . (uncurry elem) . (p1 >< ((fmap p1) . tar))
\end{code}
\textbf{Questão}: Supondo-se que no código acima se substitui a propriedade
|checkFiles| pela propriedade mais fraca |check|, será que a propriedade
|prop_new| ainda é válida? Justifique a sua resposta. 
\end{propriedade}
 
\begin{propriedade}
  A listagem de ficheiros logo após uma adição nunca poderá ser menor que a listagem
  de ficheiros antes dessa mesma adição.
\begin{code}
prop_new2 :: ((Path String,String), FS String String) -> Property
prop_new2 = validPath .==>. ((length . tar . p2) .<=. (length . tar . (uncurry (uncurry new)))) where
      validPath = (/=0) . length . p1 . p1
\end{code}
  \end{propriedade}  
  \item Duplicação de um ficheiro.\\
    |cp :: Path a -> Path a -> FS a b -> FS a b|
  \begin{propriedade}
    A listagem de ficheiros com um dado nome não diminui após uma duplicação.
\begin{code}
prop_cp :: ((Path String, Path String),  FS String String) -> Bool
prop_cp =   length . tar . p2 .<=. length . tar . (uncurry (uncurry cp))
\end{code}
  \end{propriedade}  
  \item Eliminação de um ficheiro.\\
    |rm :: Path a -> FS a b -> FS a b|

  \textbf{Sugestão}: Construir um anamorfismo |nav :: (Path a, FS a b) -> FS a b|
  que navegue por um sistema de ficheiros tendo como base o |path| dado como argumento.
    \begin{propriedade}
    Remover duas vezes o mesmo ficheiro tem o mesmo efeito que o remover apenas uma vez.
\begin{code}
prop_rm :: (Path String, FS String String) -> Bool
prop_rm = (uncurry rm ) . (split p1 (uncurry rm)) .==. (uncurry rm)
\end{code}
\end{propriedade}
\begin{propriedade}
Adicionar um ficheiro e de seguida remover o mesmo não origina novos ficheiros no sistema.
\begin{code}
prop_rm2 :: ((Path String,String), FS String String) -> Property
prop_rm2 = validPath  .==>. ((length . tar . (uncurry rm) . (split (p1. p1) (uncurry (uncurry new)))) 
         .<=. (length . tar . p2)) where
         validPath = (/=0) . length . p1 . p1
\end{code}
\end{propriedade}  
  \end{enumerate}
\end{enumerate}

\paragraph{Valorização} 

Definir uma função para visualizar em \graphviz{Graphviz}
a estrutura de um sistema de ficheiros. A Figura~\ref{ex_prob1}, por exemplo,
apresenta a estrutura de um sistema com precisamente dois ficheiros dentro
de uma directoria chamada |"d1"|. 

Para realizar este exercício será necessário apenas  escrever o anamorfismo
\begin{quote}
|cFS2Exp :: (a, FS a b) -> (Exp () a)| 
\end{quote}
que converte a estrutura de um sistema de ficheiros numa árvore de expressões
descrita em \href{http://wiki.di.uminho.pt/twiki/pub/Education/CP/MaterialPedagogico/Exp.hs}{Exp.hs}.
A função |dotFS| depois tratará de passar a estrutura do sistema de ficheiros para o visualizador.
\begin{figure}
\centering
\includegraphics[scale=0.5]{cp1819t_media/fs.png}
\caption{Exemplo de um sistema de ficheiros visualizado em \graphviz{Graphviz}.}
\label{ex_prob1}
\end{figure}

%----------------- Programa, bibliotecas e código auxiliar --------------------%

\newpage

\part*{Anexos}

\appendix

\section{Como exprimir cálculos e diagramas em LaTeX/lhs2tex}
Estudar o texto fonte deste trabalho para obter o efeito:\footnote{Exemplos tirados de \cite{Ol18}.} 
\begin{eqnarray*}
\start
  |id = split f g|
%
\just\equiv{ universal property }
%
        |lcbr(
    p1 . id = f
  )(
    p2 . id = g
  )|
%
\just\equiv{ identity }
%
        |lcbr(
    p1 = f
  )(
    p2 = g
  )|
\qed
\end{eqnarray*}

Os diagramas podem ser produzidos recorrendo à \emph{package} \LaTeX\ 
\href{https://ctan.org/pkg/xymatrix}{xymatrix}, por exemplo: 
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Nat0|
           \ar[d]_-{|cataNat g|}
&
    |1 + Nat0|
           \ar[d]^{|id + (cataNat g)|}
           \ar[l]_-{|inNat|}
\\
     |B|
&
     |1 + B|
           \ar[l]^-{|g|}
}
\end{eqnarray*}

\section{Programação dinâmica por recursividade múltipla}\label{sec:recmul}
Neste anexo dão-se os detalhes da resolução do Exercício \ref{ex:exp} dos apontamentos da
disciplina\footnote{Cf.\ \cite{Ol18}, página \pageref{ex:exp}.},
onde se pretende implementar um ciclo que implemente
o cálculo da aproximação até |i=n| da função exponencial $exp\ x = e^x$
via série de Taylor:
\begin{eqnarray}
  exp\ x 
& = &
  \sum_{i=0}^{\infty} \frac {x^i} {i!}
\end{eqnarray}
Seja $e\ x\ n = \sum_{i=0}^{n} \frac {x^i} {i!}$ a função que dá essa aproximação.
É fácil de ver que |e x 0 = 1| e que $|e x (n+1)| = |e x n| + \frac {x^{n+1}} {(n+1)!}$.
Se definirmos $|h x n| = \frac {x^{n+1}} {(n+1)!}$ teremos |e x| e |h x| em recursividade
mútua. Se repetirmos o processo para |h x n| etc obteremos no total três funções nessa mesma
situação:
\begin{spec}
e x 0 = 1
e x (n+1) = h x n + e x n

h x 0 = x
h x (n+1) = x/(s n) * h x n

s 0 = 2
s (n+1) = 1 + s n
\end{spec}
Segundo a \emph{regra de algibeira} descrita na página \ref{pg:regra} deste enunciado,
ter-se-á, de imediato:
\begin{code}
e' x = prj . for loop init where
     init = (1,x,2)
     loop(e,h,s)=(h+e,x/s*h,1+s)
     prj(e,h,s) = e
\end{code}

\section{Código fornecido}\label{sec:codigo}

\subsection*{Problema 1}
Tipos:
\begin{code}
data Expr = Num Int 
               | Bop Expr Op Expr  deriving  (Eq,Show)

data Op = Op String deriving (Eq,Show)

type Codigo = [String]
\end{code}
Functor de base:
\begin{code}
baseExpr f g = id -|- (f >< (g >< g))
\end{code}
Instâncias:
\begin{code}
instance Read Expr where
   readsPrec _ = readExp
\end{code}
Read para Exp's:
\begin{code}
readOp :: String -> [(Op,String)]
readOp input = do 
                 (x,y) <- lex input
                 return ((Op x),y)

readNum :: ReadS Expr
readNum  = (map (\ (x,y) -> ((Num x), y))).reads

readBinOp :: ReadS Expr
readBinOp = (map (\ ((x,(y,z)),t) -> ((Bop x y z),t))) .
                   ((readNum `ou` (pcurvos readExp))
                    `depois` (readOp `depois` readExp))


readExp :: ReadS Expr
readExp = readBinOp `ou` (
          readNum `ou` (
          pcurvos readExp))
\end{code}
Combinadores:
\begin{code}

depois :: (ReadS a) -> (ReadS b) -> ReadS (a,b)
depois _ _ [] = []
depois r1 r2 input = [((x,y),i2) | (x,i1) <- r1 input , 
                                   (y,i2) <- r2 i1]

readSeq :: (ReadS a) -> ReadS [a]
readSeq r input 
  = case (r input) of
    [] -> [([],input)]
    l -> concat (map continua l)
         where continua (a,i) = map (c a) (readSeq r i)
               c x (xs,i) = ((x:xs),i)                     

ou :: (ReadS a) -> (ReadS a) -> ReadS a
ou r1 r2 input = (r1 input) ++ (r2 input)

senao :: (ReadS a) -> (ReadS a) -> ReadS a
senao r1 r2 input = case (r1 input) of
                     [] -> r2 input
                     l  -> l

readConst :: String -> ReadS String
readConst c = (filter ((== c).fst)) . lex

pcurvos = parentesis '(' ')'
prectos = parentesis '[' ']'
chavetas = parentesis '{' '}'

parentesis :: Char -> Char -> (ReadS a) -> ReadS a
parentesis _ _ _ [] = []
parentesis ap pa r input 
  = do 
      ((_,(x,_)),c) <- ((readConst [ap]) `depois` (
                        r                `depois` (
                        readConst [pa])))           input
      return (x,c)
\end{code}

\subsection*{Problema 2}
Tipos:
\begin{code}
type Fig = [(Origem,Caixa)]
type Origem = (Float, Float)
\end{code}
``Helpers":
\begin{code}
col_blue = G.azure
col_green = darkgreen

darkgreen = G.dark (G.dark G.green)
\end{code}
Exemplos:
\begin{code}
ex1Caixas = G.display (G.InWindow "Problema 4" (400, 400) (40, 40)) G.white $
          crCaixa (0,0) 200 200 "Caixa azul" col_blue

ex2Caixas =  G.display (G.InWindow "Problema 4" (400, 400) (40, 40)) G.white $
          caixasAndOrigin2Pict ((Comp Hb bbox gbox),(0.0,0.0)) where
          bbox = Unid ((100,200),("A",col_blue))
          gbox = Unid ((50,50),("B",col_green))

ex3Caixas = G.display (G.InWindow "Problema 4" (400, 400) (40, 40)) G.white mtest where
          mtest = caixasAndOrigin2Pict $ (Comp Hb (Comp Ve bot top) (Comp Ve gbox2 ybox2), (0.0,0.0))
          bbox1 = Unid ((100,200),("A",col_blue))
          bbox2 = Unid ((150,200),("E",col_blue))
          gbox1 = Unid ((50,50),("B",col_green))
          gbox2 = Unid ((100,300),("F",col_green))
          rbox1 = Unid ((300,50),("C",G.red))
          rbox2 = Unid ((200,100),("G",G.red))
          wbox1 = Unid ((450,200),("",G.white)) 
          ybox1 = Unid ((100,200),("D",G.yellow))
          ybox2 = Unid ((100,300),("H",G.yellow))
          bot = Comp Hb wbox1 bbox2 
          top = (Comp Ve (Comp Hb bbox1 gbox1) (Comp Hb rbox1 (Comp H ybox1 rbox2)))

\end{code}
A seguinte função cria uma caixa a partir dos seguintes parâmetros: origem,
largura, altura, etiqueta e côr de preenchimento.
\begin{code}
crCaixa :: Origem  -> Float -> Float -> String -> G.Color -> G.Picture
crCaixa (x,y) w h l c = G.Translate (x+(w/2)) (y+(h/2)) $  G.pictures [caixa, etiqueta] where
                    caixa = G.color c (G.rectangleSolid w h)
                    etiqueta = G.translate calc_trans_x calc_trans_y $ 
                             G.Scale calc_scale calc_scale $ G.color G.black $ G.Text l
                    calc_trans_x = (- ((fromIntegral (length l)) * calc_scale) / 2 )*base_shift_x
                    calc_trans_y = (- calc_scale / 2)*base_shift_y
                    calc_scale = bscale * (min h w) 
                    bscale = 1/700
                    base_shift_y = 100
                    base_shift_x = 64
\end{code}
Função para visualizar resultados gráficos:
\begin{code}
display = G.display (G.InWindow "Problema 4" (400, 400) (40, 40)) G.white 
\end{code}

\subsection*{Problema 4}
Funções para gestão de sistemas de ficheiros:
\begin{code}
concatFS = inFS . (uncurry (++)) . (outFS >< outFS)
mkdir (x,y) = FS [(x, Dir y)]
mkfile (x,y) = FS [(x, File y)]

joinDupDirs :: (Eq a) => (FS a b) -> (FS a b)
joinDupDirs  = anaFS (prepOut . (id >< proc) . prepIn) where 
         prepIn = (id >< (map (id >< outFS))) . sls . (map distr) . outFS
         prepOut = (map undistr) . (uncurry (++)) . ((map i1) >< (map i2)) . (id >< (map (id >< inFS)))
         proc = concat . (map joinDup) . groupByName
         sls = split lefts rights

joinDup :: [(a,[b])] -> [(a,[b])]
joinDup = cataList (either nil g) where g = return . (split (p1 . p1) (concat . (map p2) . (uncurry (:))))

createFSfromFile :: (Path a, b) -> (FS a b)
createFSfromFile ([a],b) = mkfile(a,b)
createFSfromFile (a:as,b) = mkdir(a, createFSfromFile (as,b))
\end{code}
Funções auxiliares:
\begin{code}
checkFiles :: (Eq a) => FS a b -> Bool
checkFiles = cataFS ((uncurry (&&)) . (split f g)) where
           f = nr . (fmap p1) . lefts . (fmap distr)
           g = and . rights . (fmap p2)

groupByName :: (Eq a) => [(a,[b])] -> [[(a,[b])]]
groupByName = (groupBy (curry p)) where
            p = (uncurry (==)) . (p1 >< p1)

filterPath :: (Eq a) => Path a -> [(Path a, b)] -> [(Path a, b)]
filterPath = filter . (\p -> \(a,b) -> p == a)
\end{code}
Dados para testes:
\begin{itemize}
\item Sistema de ficheiros vazio:
\begin{code}
efs = FS []
\end{code}
\item Nível 0
\begin{code}
f1 = FS [("f1", File "hello world")]
f2 = FS [("f2", File "more content")]
f00 = concatFS (f1,f2)
f01 = concatFS (f1, mkdir("d1", efs))
f02 = mkdir("d1",efs)
\end{code}
\item Nível 1
\begin{code}
f10 = mkdir("d1", f00)
f11 = concatFS(mkdir("d1", f00), mkdir("d2", f00))
f12 = concatFS(mkdir("d1", f00), mkdir("d2", f01))
f13 = concatFS(mkdir("d1", f00), mkdir("d2", efs))
\end{code}
\item Nível 2
\begin{code}
f20 = mkdir("d1", f10)
f21 = mkdir("d1", f11)
f22 = mkdir("d1", f12)
f23 = mkdir("d1", f13)
f24 = concatFS(mkdir("d1",f10), mkdir("d2",f12))
\end{code}
\item Sistemas de ficheiros inválidos:
\begin{code}
ifs0 = concatFS (f1,f1)
ifs1 = concatFS (f1, mkdir("f1", efs))
ifs2 = mkdir("d1", ifs0)
ifs3 = mkdir("d1", ifs1)
ifs4 = concatFS(mkdir("d1",ifs1), mkdir("d2",f12))
ifs5 = concatFS(mkdir("d1",f1), mkdir("d1",f2))
ifs6 = mkdir("d1",ifs5)
ifs7 = concatFS(mkdir("d1",f02),mkdir("d1",f02))
\end{code}
\end{itemize}
Visualização em \graphviz{Graphviz}:
\begin{code}
dotFS :: FS String b -> IO ExitCode
dotFS = dotpict . bmap (const "") id . (cFS2Exp "root")
\end{code}
\def\omitted{``Automagically" generated:
\begin{code}
instance (Arbitrary a, Arbitrary b) => Arbitrary (FS a b) where
   arbitrary = sized genfs  where
             genfs 0 = liftM (inFS . (map (id >< (i1)))) QuickCheck.arbitrary
             genfs n = oneof [liftM (inFS . (map (id >< (i1)))) QuickCheck.arbitrary,
                     liftM (inFS . return . (id >< (i2))) (liftM2 (,) 
                     QuickCheck.arbitrary (genfs (n - 1))),
                     liftM3 genAux QuickCheck.arbitrary (genfs (n - 1)) (genfs (n - 1))]
             genAux a x y = inFS [(a, i2 x), (a, i2 y)]

instance Arbitrary Expr where
   arbitrary = (genExpr 10)  where
             genExpr 0 = liftM (inExpr . i1) QuickCheck.arbitrary
             genExpr n = oneof [liftM (inExpr . i1) QuickCheck.arbitrary,
                       liftM (inExpr . i2 . (uncurry genAux1)) 
                       $ liftM2 (,)  (genExpr (n-1)) (genExpr (n-1)),
                       liftM (inExpr . i2 . (uncurry genAux2)) 
                       $ liftM2 (,)  (genExpr (n-1)) (genExpr (n-1))
                     ]
             genAux1 x y = (Op "+",(x,y))
             genAux2 x y = (Op "*",(x,y))
\end{code}}

\subsection*{Outras funções auxiliares}
%----------------- Outras definições auxiliares -------------------------------------------%
Lógicas:
\begin{code}
infixr 0 .==>.
(.==>.) :: (Testable prop) => (a -> Bool) -> (a -> prop) -> a -> Property
p .==>. f = \a -> p a ==> f a

infixr 0 .<==>.
(.<==>.) :: (a -> Bool) -> (a -> Bool) -> a -> Property
p .<==>. f = \a -> (p a ==> property (f a)) .&&. (f a ==> property (p a))

infixr 4 .==.
(.==.) :: Eq b => (a -> b) -> (a -> b) -> (a -> Bool)
f .==. g = \a -> f a == g a

infixr 4 .<=.
(.<=.) :: Ord b => (a -> b) -> (a -> b) -> (a -> Bool)
f .<=. g = \a -> f a <= g a

infixr 4 .&&&.
(.&&&.) :: (a -> Bool) -> (a -> Bool) -> (a -> Bool)
f .&&&. g = \a -> ((f a) && (g a))
\end{code}
Compilação e execução dentro do interpretador:\footnote{Pode ser útil em testes
envolvendo \gloss{Gloss}. Nesse caso, o teste em causa deve fazer parte de uma função
|main|.}
\begin{code}

run = do { system "ghc cp1819t" ; system "./cp1819t" }
\end{code}

%----------------- Soluções dos alunos -----------------------------------------%

\section{Soluções dos alunos}\label{sec:resolucao}
Os alunos devem colocar neste anexo as suas soluções aos exercícios
propostos, de acordo com o "layout" que se fornece. Não podem ser
alterados os nomes ou tipos das funções dadas, mas pode ser adicionado texto e/ou 
outras funções auxiliares que sejam necessárias.

\subsection*{Problema 1}

\par

\subsubsection*{Pergunta 1 - Definições base para o tipo de dados}

\hspace{0.5cm}

\begin{code}

inExpr :: Either Int (Op,(Expr,Expr)) -> Expr
inExpr = either Num bopCase 
  where bopCase (a, (b, c)) = Bop b a c

outExpr :: Expr -> Either Int (Op,(Expr,Expr))
outExpr (Num a) = Left a
outExpr (Bop a op b) =  Right(op,(a, b))

recExpr f = baseExpr id f
cataExpr g = g . (recExpr(cataExpr g)) . outExpr
anaExpr g = inExpr . (recExpr(anaExpr g)) . g
hiloExpr h g = cataExpr h . anaExpr g

\end{code}

\subsubsection*{Pergunta 2 - Calcular o valor de uma expressão}

\hspace{0.5cm} Calcular um valor de uma expressão passa por dois casos, explicitados no tipo de dados. Ou temos um \textit{Num} ou um \textit{Bop} e trata-se de uma operação de redução desse tipo a um número, daí a solução passar por um catamorfismo.

Segue-se o diagrama mais apropriado para descrever este catamorfismo:

\begin{eqnarray*}
\xymatrix@@C=4cm{
    |Expr|
           \ar[d]_-{|f = cataExpr g|}
           \ar[r]_-{|outExpr|}
&
    |Num + Op >< Expr >< Expr|
           \ar[d]^-{|id + id >< f >< f|}
\\
     |Int|
&
    |Num + Op >< Int >< Int|
           \ar[l]^-{|g = either id parseOp|}
}
\end{eqnarray*}

\hspace{0.5cm} Aqui \textit{parseOp} auxilia a função calcula em converter uma operação e um par de Inteiros no resultado respetivo.

\begin{code}

calcula :: Expr -> Int
calcula = cataExpr (either id parseOp)

--

parseOp :: (Op,(Int,Int)) -> Int
parseOp (Op op,(a,b)) | op == "+"   = a + b  
                      | op == "-"   = a - b  
                      | op == "*"   = a * b  
                      | op == "mod" = mod a b 
\end{code}

\subsubsection*{Pergunta 3 - \textit{Pretty printer} show' e a compile}

\hspace{0.5cm} Para converter um tipo de dados \textit{Expr} na sua representação \textit{String} basta-o converter para uma representação literal infixa. Um catamorfismo, mais uma vez, serviu para o caso.

\begin{code}

show' = cataExpr (either cnvNum cnvPar)

--

cnvNum :: (Num a, Ord a, Show a) => a -> String
cnvNum a | a < 0 = "(" ++ show a ++ ")"
         | otherwise = show a                    

--

cnvPar :: (Op, (String, String)) -> String
cnvPar (Op op, (s1, s2)) = "(" ++ s1 ++ op ++ s2 ++ ")"

\end{code}

\hspace{0.5cm} A operação de \textbf{compilar} uma \textit{String} torna-se trivial após se conseguir obter a representação da \textit{String} num \textit{Expr}, tendo para isso, a função \textit{readExp} fornecida. \par
Após isso, basta apenas fazer um catamorfismo sobre o tipo de modo a explorar a recursividade.

\begin{code}

compile = cataExpr (either numToComp bopToCompile) . fst . head . readExp
  where numToComp a                 = ["PUSH " ++ show a]
        bopToCompile (op, (s1, s2)) = s1 ++ s2 ++ [opToCodigo op]

--

opToCodigo :: Op -> String
opToCodigo (Op op) | op == "+" = "ADD"
                   | op == "-" = "SUB"
                   | op == "*" = "MUL"
                   | op == "mod" = "MOD"

-- 

\end{code}
\par
\hspace{0.5cm} Para melhor representar a operação de compile, ou seja, converter \textit{Expr} em instruções \textbf{stack} segue-se o diagrama do catamorfismo implementado.

\begin{eqnarray*}
\xymatrix@@C=4cm{
    |Expr|
           \ar[d]_-{|f = cataExpr g|}
           \ar[r]_-{|outExpr|}
&
    |Num + Op >< Expr >< Expr|
           \ar[d]^-{|id + id >< f >< f|}
\\
     |[String]|
&
    |Num + Op >< [String] >< [String]|
           \ar[l]^-{|g = either numToComp bopToCompile|}
}
\end{eqnarray*}


\par
\vspace{1cm}
\hspace{0.5cm} Incluem-se aqui alguns testes aplicavéis às funções implementadas anteriormente: \par

\begin{code}

exp_test :: Expr
exp_test = Bop (Bop (Num 5) (Op "*") (Num 6)) (Op "+") (Num (-1))

string_codigo_1 :: String
string_codigo_1 = "2 + 3 * 4"

string_codigo_2 :: String
string_codigo_2 = "2 + 1 * 3 + 4"

\end{code}

\subsection*{Problema 2}

\subsubsection*{Definições base do tipo de dados L2D}

\hspace{0.5cm} 

Este problema utilizava um tipo de dados que em muito se assemelhava com um tipo já conhecido por todos, as BTrees, daí ter sido mais fácil interpretar a estrutura de dados. Deste modo, as operações de \textit{in} e \textit{out}, entre outras, são semelhantes.

O diagrama que representa um catamorfismo para este tipo é o seguinte:

\begin{eqnarray*}
\xymatrix@@C=4cm{
    |L2D|
           \ar[d]_-{|f = cataL2D g|}
           \ar[r]_-{|outL2D|}
&
    |Unid + b >< L2D >< L2D|
           \ar[d]^-{|id + id >< f >< f|}
\\
     |X|
&
    |Unid + b >< X >< X|
           \ar[l]^-{|g|}
}
\end{eqnarray*}


\begin{code}

inL2D :: Either a (b, (X a b,X a b)) -> X a b
inL2D = either casoUnid casoComp
  where casoUnid a = Unid a
        casoComp (b, (l, r)) = Comp b l r 

--

outL2D :: X a b -> Either a (b, (X a b,X a b))
outL2D (Unid a) = Left a
outL2D (Comp b l r) = Right (b, (l, r))

--

recL2D f = baseL2D id f
baseL2D f g = id -|- (f >< (g >< g))
cataL2D g = g . (recL2D (cataL2D g)) . outL2D
anaL2D g = inL2D . (recL2D (anaL2D g) ) . g

\end{code}

\subsubsection*{Definições de funções dadas como undefined neste documento}

\hspace{0.5cm} Algumas das definições necessárias para a implementação daquela que seria a função principal \textit{calcOrigins} foram disponibilizadas no ficheiro fornecido e, deste modo, serviram para facilitar o anamorfismo que definia esta função.

\begin{code}

collectLeafs (Unid a) = [a]
collectLeafs (Comp b l r) = (collectLeafs l) ++ (collectLeafs r) 

--

dimen :: X Caixa Tipo -> (Float, Float)
dimen = cataL2D (either casoUnid casoComp)

casoUnid a = (fromIntegral (fst (fst a)), fromIntegral (snd (fst a))) 
casoComp (Hb, ((x1, y1), (x2, y2))) = (x1 + x2, max y1 y2)   
casoComp (H, ((x1, y1), (x2, y2))) = (x1 + x2, max y1 y2)   
casoComp (Ht, ((x1, y1), (x2, y2))) = (x1 + x2, max y1 y2)   
casoComp (V, ((x1, y1), (x2, y2))) = (max x1 x2, y1 + y2)   
casoComp (Ve, ((x1, y1), (x2, y2))) = (max x1 x2, y1 + y2)   
casoComp (Vd, ((x1, y1), (x2, y2))) = (max x1 x2, y1 + y2)   

\end{code}

\hspace{0.5cm} Segue-se, então, o diagrama que define um anamorfismo neste tipo de dados:

\begin{eqnarray*}
\xymatrix@@C=2.5cm{
&
    |X (Caixa, Origem) ()|
&
    |(Unid, O) + ((), (X (Caixa, O) (), X (Caixa, O) ())|
        \ar[l]^-{|inL2D|}
\\
&
    |(L2D, O)|
        \ar[u]^-{|f = anaL2D|}
        \ar[r]_-{|g|}
&
    |(Unid, O) + ((), ((L2D, O), (L2D, O)))|
        \ar[u]_-{|id + id >< f >< f|}
}
\end{eqnarray*}

\textit{Onde "O" representa o tipo Origem.}

\subsubsection*{Pergunta 1}

\hspace{0.5cm} Nesta pergunta era pedido uma função que dada uma origem e um conjunto de figuras em L2D fossem calculadas associações das mesmas com a origem respetiva, dados os diferentes tipo de associações.
\par
O padrão de recursividade segue mais casos e traz uma ligeira complexidade ao tipo de dados, mas contudo, este assemelha-se muito com uma BTree.
\par
Seguem-se as definições da pergunta 1:

\begin{code}

calcOrigins :: ((X Caixa Tipo), Origem) -> X (Caixa, Origem) ()
calcOrigins = anaL2D g
  where g (Unid a, or) = Left (a, or) 
        g (Comp b l r, o) = Right ((), ((l, o), (r, calc b o (dimen l))))   

\end{code}

\par

\hspace{0.5cm} Seguem-se algumas funções auxiliares que foram necessárias ser implementadas.

\begin{code}

--

convCoord :: (Int, Int) -> (Float, Float)
convCoord (x, y) = (fromIntegral x :: Float, fromIntegral y :: Float)

--

calc :: Tipo -> Origem -> (Float, Float) -> Origem
calc (Hb) orig (box_x, box_y) = ((fst orig) + box_x, snd orig)
calc (Ht) orig (box_x, box_y) = ((fst orig) + box_x, (snd orig) + box_y)
calc (H) orig (box_x, box_y)  = ((fst orig) + box_x, (snd orig) 
                              + (fromInteger $ round $ (box_y / 2) * (10^5)) / (10.0^^5))
calc (V) orig (box_x, box_y)  = ((fst orig) 
                              + (fromInteger $ round $ (box_x / 2) * (10^5)) / (10.0^^5), 
                                (snd orig) + box_y)
calc (Ve) orig (box_x, box_y)  = ((fst orig), (snd orig) + box_y)
calc (Vd) orig (box_x, box_y)  = ((fst orig) + box_x, (snd orig) + box_y)

\end{code}

\par

\subsubsection*{Pergunta 2 - Agrupar as caixas e as suas origens numa só lista}

\begin{code}

agrup_caixas :: X (Caixa, Origem) () -> Fig
agrup_caixas (Unid (ca, or)) = [(or, ca)]
agrup_caixas (Comp b l r) = (agrup_caixas l) ++ (agrup_caixas r)

\end{code}

\par

\subsubsection*{Display das caixas num gráfico 2D em gloss}

\hspace{0.5cm} Tendo as origems calculadas apenas é preciso agrupar as caixas com as suas origens, gerar as respetivas \textit{G.Picture}, convertendo tudo para apenas uma \textit{G.Picture} e apresentar na janela gloss o resultado. Para tal foi crucial ter funções como \textit{crCaixa} e \textit{display} para criar \textit{G.Picture} e apresentá-las.

\begin{code}

mostra_Caixas = display . caixasAndOrigin2Pict

caixasAndOrigin2Pict = G.pictures . criaPict . agrup_caixas . calcOrigins

criaPict :: Fig -> [G.Picture]
criaPict [] = []
criaPict (h:t)    = [(crCaixa or width height text col)] ++ (criaPict t)
  where or        = (fst h)
        width     = (toFloat (fst(fst(snd h))))
        height    = (toFloat (snd(fst(snd h))))
        text      = (fst(snd(snd h)))
        col       = (snd(snd(snd h)))
        toFloat x = fromIntegral x :: Float

\end{code}
\par
Incluem-se aqui alguns testes aplicavéis às funções implementadas anteriormente: \par

\begin{code}

testeOrigens1 :: (X Caixa Tipo, Origem)
testeOrigens1 = (caixaBas1, (0, 0))

testeOrigens2 :: (X Caixa Tipo, Origem)
testeOrigens2 = (caixaBas2, (0, 0))

unidadeA = Unid ((100, 200), ("A", col_blue))
unidadeB = Unid ((50, 50), ("B", col_green))

caixaBas1 = Comp Hb unidadeA unidadeB
caixaBas2 = Comp Hb unidadeA caixaBas1

\end{code}

\subsection*{Problema 3}

\subsubsection*{Série de Taylor do cosseno - Uma aproximação...}

\hspace{0.5cm} O objetivo do problema era implementar a série de Taylor através de uma aproximação de \textit{n} em vez de um somatório infinito, utilizando recursividade mútua.

\begin{eqnarray*}
  cos\ x = \sum_{i=0}^\infty \frac{(-1)^i}{(2i)!} x^{2i}
\end{eqnarray*}
\par
Primeiro consideramos o \textit{cos x n} como sendo \textit{c x n}, assim, podemos verificar, através do somatório que:

\begin{spec}

c x 0       = 1
c x (n + 1) = c x n + (expn ((-1)) (n+1) * (expn(x) (2*n+2)) / ((2*n + 2)!) = c x n + h x n

h x n = (expn ((-1)) (n+1) * (expn (x) (2n+2))) / ((2n + 2)!)

h x 0 = (expn ((-x)) (2) / 2 
h x (n + 1) = (h x n) * ((expn ((-x)) (2)) / ((2*n + 4) * (2*n + 3))) = (h x n) * (expn ((-x)) (2)) / (s n)

s x n = ((2*n + 4) * (2*n + 3)))

s 0 = 12
s (n + 1) = s n + 8 * n + 18 = s n + f n

f x n = 8 * n + 18

f 0 = 18
f (n + 1) = f n + 8

\end{spec}

Agora, em termos de \textit{Haskell}, podemos separar o problema em 3 funções, \textit{loop} que representa o resultado recursivo para cada função (cujo funcionamento está descrito a cima), \textit{init} que inicializa o caso base, ou seja, o caso de paragem de cada função e por fim \texti{prj} que decide a função a apresentar quando se pretende mostrar o resultado da aproximação.

\begin{code}

cos' x = prj . for loop init where
   loop (c, h, s, f) = (c+h, h*(-(x^2)/s), s+f, f+8)
   init = (1, -(x^2)/2, 12, 18)
   prj (c, h, s, f) = c

\end{code}

\subsection*{Problema 4}

\subsubsection*{Triologia ``ana-cata-hilo" - \textit{Sistema de ficheiros genéricos}}

\hspace{0.5cm} Seguindo a recomendação do enunciado deste problema, seguem-se as definições básicas para o tipo \textbf{FS a b}:

\begin{code}

outFS :: FS a b -> [(a, Either (b) (FS a b))]
outFS (FS []) = []
outFS (FS ((x,y):t)) = [(x, outNode y)] ++ outFS (FS t)

outNode :: Node a b -> Either b (FS a b)
outNode (File b) = Left(b)
outNode (Dir x)  = Right(x)

baseFS f g h = map(f >< (g -|- h))

cataFS :: ([(a, Either b c)] -> c) -> FS a b -> c
cataFS g = g . (recFS(cataFS g)) . outFS

anaFS :: (c -> [(a, Either b c)]) -> c -> FS a b
anaFS g = inFS . (recFS (anaFS g)) . g

hyloFS g h = cataFS h . anaFS g

\end{code}

E também o diagrama para um catamorfismo genérico para este tipo de dados:

\begin{eqnarray*}
\xymatrix@@C=4cm{
    |FS a b|
           \ar[d]_-{|f = cataFS g|}
           \ar[r]_-{|outFS|}
&
    |[(a, b + FS a b)]|
           \ar[d]^-{|map (id >< (id + f))|}
\\
     |X|
&
    |[(a, b + X)]|
           \ar[l]^-{|g|}
}
\end{eqnarray*}

\subsubsection*{Funções para manipulação de ficheiros}

\begin{enumerate*}

\item \textbf{a)} |check :: FS a b -> Bool|

\hspace{0.5cm} 

\begin{code}

-- \textit{Para verificar se o sistema de ficheiros é válido.}

check :: (Eq a, Eq b) => FS a b -> Bool
check = cataFS geneCheck

geneCheck :: (Eq a, Eq b) => [(a,Either b Bool)] -> Bool
geneCheck [] = True
geneCheck ((a, Left b):cauda) = naoTemRepetidos(passaLista (((a, Left b):cauda))) && geneCheck cauda
geneCheck ((a, Right bool):cauda) = bool && geneCheck cauda

-- \textit{Verifica se um par existe numa lista de pares.}

containsPair :: (Eq a, Eq b) => (a,b) -> [(a,b)] -> Bool
containsPair (a,b) [] = False
containsPair (a,b) ((h,k):t) | (a == h) && (b == k)= True
                         | otherwise = containsPair (a,b) t 

-- \textit{Verifica se uma lista de pares não tem elementos repetidos.}

naoTemRepetidos :: (Eq a, Eq b) =>  [(a,b)] -> Bool
naoTemRepetidos [x] = True
naoTemRepetidos (h:t) | containsPair h t = False
                      | otherwise = naoTemRepetidos t

-- \textit{Cria uma lista de pares no qual a primeira componente é o nome da Dir/File e a segunda componente é o conteúdo.}

passaLista  :: [(a,Either b bool)] -> [(a,b)]
passaLista [] = []
passaLista ((a, Left b):cauda) = [(a,b)] ++ passaLista cauda
passaLista ((a,Right bool):cauda) = passaLista cauda

\end{code}

\item \textbf{b)} |tar :: FS a b -> [(Path a, b)]|

\begin{code}

tar :: FS a b -> [(Path a, b)]
tar = cataFS geneTar

geneTar :: [(a, Either b [(Path a, b)])] -> [(Path a, b)]
geneTar [] = []
geneTar ((a, Left b):t) = [([a], b)] ++ geneTar t
geneTar ((a, Right l):t) = (addAllPaths a l) ++ (geneTar t)

-- \textit{Para adicionar uma diretoria à lista de diretorias existentes, onde temos uma par composto por um ficheiro e as diretorias necessárias para o alcançar.}

addAllPaths :: a -> [(Path a, b)] -> [(Path a, b)] 
addAllPaths a [] = [] 
addAllPaths a ((list, b):t) = [([a] ++ list, b)] ++ addAllPaths a t

\end{code}

\item \textbf{c)} |untar :: [(Path a, b)] -> FS a b|

\begin{code}

untar :: (Eq a) => [(Path a, b)] -> FS a b
untar = joinDupDirs . (anaFS geneUntar)

--

geneUntar :: [(Path a, b)] -> [(a, Either b ([(Path a,b)]))] 
geneUntar [] = [] 
geneUntar (([], b):cauda) = geneUntar cauda 
geneUntar (([x], b):cauda) = [(x, Left b)] ++ geneUntar cauda 
geneUntar (((h:t), b):cauda) = [(h, Right [(t, b)])] ++ geneUntar cauda 

\end{code}

A função untar utiliza um anamorfismo que é descrito de seguida:
\par
\begin{eqnarray*}
\xymatrix@@C=2.5cm{
&
    |FS a b|
&
    |[(a, b + FS a b)]|
        \ar[l]^-{|inFS|}
\\
&
    |[(Path a, b)]|
        \ar[u]^-{|f = anaFS|}
        \ar[r]_-{|g = geneUntar|}
&
    |[(a, b + [(Path a, b)])]|
        \ar[u]_-{|map (id >< (id + f))|}
}
\end{eqnarray*}

\item \textbf{d)} |find :: a -> FS a b -> [Path a ]|

\begin{code}

find :: (Eq a) => a -> FS a b -> [Path a]
find (a) (f) = findAux (a) (cataFS(gFind) (f)) 

-- \textit{Verifica se um elemento existe numa lista.}

contains :: (Eq a) => a -> [a] -> Bool
contains a [] = False
contains a (h:t) | (a == h) = True
                 | otherwise = contains a t 

-- \textit{A partir de uma lista devolve a lista de diretorias associadas ao ficheiro pretendido.}

findAux :: (Eq a) => a -> [(a, Path a)] -> [Path a]
findAux a [] = []
findAux a ((a1, l):t) | contains a l = [l] ++ (findAux a t)
                      | otherwise = (findAux a t)

-- \textit{Adiciona uma nova diretoria à lista de diretorias de um ficheiro.}

addPathA :: a -> [(a, Path a)] -> [(a, Path a)]
addPathA a [] = []
addPathA a ((a1, l):t) = [(a, [a] ++ l)] ++ addPathA a t 

--

gFind :: [(a, Either b [(a, Path a)])] -> [(a, Path a)] 
gFind [] = []
gFind ((a, Left b):t) = [(a, [a])] ++ gFind t
gFind ((a, Right p):t) = (addPathA a p) ++ gFind t

\end{code}

\item \textbf{e)} |new :: Path a -> b -> FS a b -> FS a b|

\begin{code}

new :: (Eq a) => Path a -> b -> FS a b -> FS a b
new p b fs = untar( ordenaPath (tar (fs)) (p, b) )

-- \textit{Insere um Path e correspondente ficheiro na lista de diretorias do Sistema de ficheiros de forma ordenada.}

ordenaPath :: (Eq a) => [(Path a, b)] -> (Path a, b) -> [(Path a, b)]
ordenaPath [] (l,b) = [(l,b)]
ordenaPath ((l, b):t) (l1, b1) | (take ((length l) -1)(l)) == (take ((length l) -1)(l1)) = (l,b) : (l1, b1) : t
                               | otherwise = (l,b) : ordenaPath t (l1,b1)

\end{code}

\item \textbf{f)} |cp :: Path a -> Path a -> FS a b -> FS a b|

\begin{code}

cp :: (Eq a) => Path a -> Path a -> FS a b -> FS a b 
cp list1 list2 (FS list3) = new list2 (encontraFile list1 (tar (FS list3))) (FS list3)  

-- \textit{Devolve, se encontrar, o conteúdo de um ficheiro associado a um Path.}

encontraFile :: (Eq a) => Path a -> [(Path a,b)] -> b 
encontraFile list ((x,y):t) | list == x = y 
                            | otherwise = encontraFile list t 

\end{code}

\item \textbf{g)} |rm :: Path a -> FS a b -> FS a b|

Sugestão de implementação, definição de \textit{nav}:

\begin{code}

nav :: (Eq a) => (Path a, FS a b) -> FS a b
nav = anaFS gNav

--

gNav :: (Eq a) => (Path a, FS a b) -> [(a, Either b (Path a, FS a b))]
gNav ([],FS []) = []
gNav ((h:t), FS []) = []
gNav ([], FS ((a, File b):t1)) = [(a, Left b)] ++ gNav ([], FS t1)
gNav ([], FS ((a, Dir f):t1))  = [(a, Right ([], f))] ++ gNav ([], FS t1)
gNav ((h:t), FS ((a, File b):t1) ) | (h == a) = [(a, Left b)]
                                   | otherwise = gNav (h:t, FS t1)
gNav ((h:t), FS ((a, Dir f):t1) )  | (h == a) = [(a, Right (t, f))] 
                                   | otherwise = gNav (h:t, FS t1)

--

geneRemove :: (Eq a) => (FS a b, FS a b) -> [(a, Either b (FS a b, FS a b))] 
geneRemove (FS [], _) = []
geneRemove (FS ((a, Dir f):t1), FS []) = [(a, Right (f, FS []))] ++ geneRemove (FS t1, FS [])
geneRemove (FS ((a, File b):t1), FS []) = [(a, Left b)] ++ geneRemove (FS t1, FS [])
geneRemove (FS ((a, File b):t1), FS ((a1, File b1):t2)) | a == a1 = [(a, Right (FS t1, FS[]))] 
                                                        | otherwise = [(a, Left b)] 
                                                        ++ geneRemove(FS t1, FS ((a1, File b1):t2))
geneRemove (FS ((a, Dir f1):t1), FS ((a1, Dir f2):t2)) | a == a1 = [(a, Right (FS t1, FS []))] 
                                                        ++ geneRemove(f1, f2)
                                                       | otherwise = [(a, Right (f1, FS[]))] 
                                                        ++ geneRemove(FS t1, FS ((a1, Dir f2):t2))
geneRemove (FS ((a, File b):t1), FS ((a1, Dir f2):t2)) | a /= a1 = [(a, Left b)] 
                                                        ++ geneRemove (FS t1, FS ((a1, Dir f2):t2))
geneRemove (FS ((a, Dir f1):t1), FS ((a1, File b):t2)) | a /= a1 = [(a, Right (f1, FS []))] 
                                                        ++ geneRemove(FS t1, FS ((a1, File b):t2))

\end{code}

Definição de \textit{rm}:

\begin{code}

rm :: (Eq a) => (Path a) -> (FS a b) -> FS a b
rm p f = anaFS (geneRemove) (f,  nav (p, f))

\end{code}

\item Definições extras:

\begin{code}

auxJoin :: ([(a, Either b c)],d) -> [(a, Either b (d,c))]
auxJoin = undefined

cFS2Exp :: a -> FS a b -> (Exp () a)
cFS2Exp = undefined

\end{code}

\end{enumerate*}

%----------------- Fim do anexo com soluções dos alunos ------------------------%

%----------------- Índice remissivo (exige makeindex) -------------------------%

\printindex

%----------------- Bibliografia (exige bibtex) --------------------------------%

\bibliographystyle{plain}
\bibliography{cp1819t}

%----------------- Fim do documento -------------------------------------------%
\end{document}
