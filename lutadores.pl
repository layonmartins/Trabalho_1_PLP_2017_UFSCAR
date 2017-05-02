%% TRABALHO 1 programacao Prolog - Rachacuca
%Prof. Dr. Daniel Lucrédio.
%Disciplina PLP 2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Autores do trabalho: 
autores('Layon Martins Fonseca - RA 11414570').
autores('Jaime Freire de Souza - 11415010').
autores('Isaque Elcio de Souza - 11414545').
autores('Warteruzannan Soyer Cunha - 11415118').

%Problema nível normal - Lutadores de Judô
% https://rachacuca.com.br/logica/problemas/lutadores-de-judo/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Instruções %%%%%%%%%%%%%%%
%Para execultar, carrego o programa lutadores.pl no SWI-prolog
%Depois basta apenas chamar a cláusula "?- main."
%Pronto apenas aguarde o programa processar as informações, e o resultado será impresso na tela.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% INÍCIO DO PROGRAMA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
main :- write(' @_  @ ############# LUTARORES DE JUDÔ ################\n'),
		write('/|  /|\\ \n/ \\ / |  Aguarde...\n\n'),
		lutadores([V,W,X,Y,Z]),	imprime([V,W,X,Y,Z]).
%Explicação: 
%			- Execução principal do programa.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% DOCUMENTAÇÃO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% As regras retiras do site estão listadas com uma númeração no final do arquivo.
% Estas regras são aplicadas durante o código e refenciadas pelo número.

%%%%%%%%%%%%%%% LUTADORES %%%%%%%%%%%%%%%%%%%%
lutadores([
		  (Faixa_1, Nome_1, Idade_1, Peso_1, Altura_1, Estado_1),
		  (Faixa_2, Nome_2, Idade_2, Peso_2, Altura_2, Estado_2),
		  (Faixa_3, Nome_3, Idade_3, Peso_3, Altura_3, Estado_3),
		  (Faixa_4, Nome_4, Idade_4, Peso_4, Altura_4, Estado_4),
		  (Faixa_5, Nome_5, Idade_5, Peso_5, Altura_5, Estado_5)
		]) :- 
%Explicação:
% 			- o que é isso? modelo de dados?? Uma lista??


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Define que deve ser uma faixa:
	faixa(Faixa_1),
	faixa(Faixa_2),
	faixa(Faixa_3),
	faixa(Faixa_4),
	faixa(Faixa_5),
	saoDiferentes([Faixa_1, Faixa_2, Faixa_3, Faixa_4, Faixa_5]), %este predicado se encontra no final.
	%%Regras
	(Faixa_1 == branca), %Regra: 21 - O lutador faixa Branca está na primeira posição.
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Define que deve ser um nome
	nome(Nome_1),
	nome(Nome_2),
	nome(Nome_3),
	nome(Nome_4),
	nome(Nome_5),
	saoDiferentes([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),
	%%Regras:
	(Nome_2 == felipe), %Regra: 19 - Felipe está na segunda posição.
	%Regra: 17 - Milton é faixa Amarela: 
	(
		%(Nome_1 == milton, Faixa_1 == amarela); %Já sei que Faixa_1 é branca pela regra 21.
		%(Nome_2 == milton, Faixa_2 == amarela); %tbm por sei que Nome_2 é felipe pela regra 19.
		(Nome_3 == milton , Faixa_3 == amarela);
		(Nome_4 == milton , Faixa_4 == amarela);
		(Nome_5 == milton , Faixa_5 == amarela)
	),
	%Regra: 20 - Emerson está em algum lugar à direita do lutador faixa Branca. Obs: pela regra 21 o faixa branca está na primeiro e pela regra 19 felipe está na segunda.
	(Nome_3 == emerson; Nome_4 == emerson; Nome_5 == emerson),
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Define que deve ser uma idade
	idade(Idade_1),
	idade(Idade_2),
	idade(Idade_3),
	idade(Idade_4),
	idade(Idade_5),
	saoDiferentes([Idade_1, Idade_2, Idade_3, Idade_4, Idade_5]),
	%%Regras
	(Idade_5 == 32), %Regra: 15 - O mais velho é do estado de SP. Obs: SP está na 5° pela regra 2.
	(Idade_4 == 30), %Regra: 14 - O lutador de 30 anos está exatamente à esquerda do lutador mais baixo. Obs: pela 5 sei que na 5° está o mais baixo.
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Define que deve ser um peso
	peso(Peso_1),
	peso(Peso_2),
	peso(Peso_3),
	peso(Peso_4),
	peso(Peso_5),
	saoDiferentes([Peso_1, Peso_2, Peso_3, Peso_4, Peso_5]),
	%%Regras
	%Regra: 18 - Renato pesa 79 kg.
	(
		(Nome_1 == renato, Peso_1 == 79);
		% (Nome_2 == renato, Peso_2 == 79); %pela regra 19 sei que Nome_2 é felipe.
		(Nome_3 == renato, Peso_3 == 79);
		(Nome_4 == renato, Peso_4 == 79);
		(Nome_5 == renato, Peso_5 == 79)
	),
	%Regra: 12 - O lutador faixa Azul pesa 87 kg.
	(
		%(Faixa_1 == azul, Peso_1 == 87); % Obs: pela regra 21 sei que Faixa_1 não é azul
		(Faixa_2 == azul, Peso_2 == 87);
		(Faixa_3 == azul, Peso_3 == 87);
		(Faixa_4 == azul, Peso_4 == 87);
		(Faixa_5 == azul, Peso_5 == 87)
	),
	%Regra: 9 - O lutador de 81 kg está em uma das pontas.
	(Peso_5 == 81; Peso_1 == 81),
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Define que deve ser uma Altura
	altura(Altura_1),
	altura(Altura_2),
	altura(Altura_3),
	altura(Altura_4),
	altura(Altura_5),
	saoDiferentes([Altura_1, Altura_2, Altura_3, Altura_4, Altura_5]),
	%%Regras:
	(Altura_5 == 1.75), %Regra: 5 - Na quinta posição está o lutador mais baixo.
	(Altura_3 == 1.84), %Regra: 7 - O lutador de 1,84 m está na terceira posição.
	(Altura_1 == 1.78), %Regra: 8 - Em uma das pontas está o lutador de 1,78 m. Obs: Porém já sei que não é na 5° regra 5.
	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Define que deve ser um Estado
	estado(Estado_1),
	estado(Estado_2),
	estado(Estado_3),
	estado(Estado_4),
	estado(Estado_5),
	saoDiferentes([Estado_1, Estado_2, Estado_3, Estado_4, Estado_5]),
	%%Regras:
	(Estado_5 == sp), %Regra: 2 - O lutador de São Paulo está na quinta posição.
	(Estado_1 == rj), %Regra: 4 - O lutador do Rio de Janeiro é faixa Branca. Obs: sei que é Estado_1 pela regra 21.
	
	
%%OUTRAS REGRAS que só funciona não sei porque aqui no final! Acho que é pq elas usam fatos que ainda não foram descobertos pelo prolog na ordem em que foram declarados. Então passei elas para baixo e funcionou.
%Regra: 1 - O lutador de 79 kg está ao lado do que veio do Espírito Santo.
	(
		(Peso_1 == 79, Estado_2 == es);
		(Peso_2 == 79, (Estado_1 == es ; Estado_3 == es));
		(Peso_3 == 79, (Estado_2 == es ; Estado_4 == es));
		(Peso_4 == 79, (Estado_3 == es ; Estado_5 == es));
		(Peso_5 == 79, Estado_4 == es)
	),
	
%Regra: 3 - O dono da faixa Vermelha está exatamente à direita do lutador de Goiás.
	(
		(Estado_1 == go, Faixa_2 == vermelha);
		(Estado_2 == go, Faixa_3 == vermelha);
		(Estado_3 == go, Faixa_4 == vermelha);
		(Estado_4 == go, Faixa_5 == vermelha)
	),
	
%Regra: 13 - O lutador de 75 kg está exatamente à esquerda do lutador de 25 anos.
	(
		(Peso_1 == 75, Idade_2 == 25);
		(Peso_2 == 75, Idade_3 == 25);
		(Peso_3 == 75, Idade_4 == 25);
		(Peso_4 == 75, Idade_5 == 25)
	),

%Regra: 16 - O lutador de 28 anos está exatamente à direita do lutador de GO.
	(
		(Estado_1 == go, Idade_2 == 28);
		(Estado_2 == go, Idade_3 == 28);
		(Estado_3 == go, Idade_4 == 28);
		(Estado_4 == go, Idade_5 == 28)
	),
	
%Regra: 10 - O faixa Vermelha está em algum lugar à esquerda do lutador de 84 kg.
	(
		%(Faixa_1 == vermelha, Peso_2 == 84); % pela regra 21 sei que Faixa_1 é branca
		(Faixa_2 == vermelha, Peso_3 == 84);
		(Faixa_3 == vermelha, Peso_4 == 84);
		(Faixa_4 == vermelha, Peso_5 == 84)
		%(Faixa_5 == vermelha, Peso_4 == 84) %para ele estar a esq não pode ser o ultimo
	),
	
%Regra: 6 - Emerson está ao lado do lutador mais alto.
	(
		(Nome_3 ==  emerson, (Altura_2 == 1.87 ; Altura_4 == 1.87));
		%(Nome_4 ==  emerson, Altura_3 == 1.87); %sei que Altura_3 e Altura_5 é diferente de 1.87 pelas regras 5 e 7.
		(Nome_5 == emerson, Altura_4 == 1.87)
	),

%Regra 11 - Os lutadores de GO e RS estão lado a lado.
	(
		%(Estado_1 == go, Estado_2 == rs); %sei que Estado_1 == rj pela regra 4.
		(Estado_2 == go, Estado_3 == rs);
		(Estado_2 == rs, Estado_3 == go);
		(Estado_3 == go, Estado_4 == rs);
		(Estado_3 == rs, Estado_4 == go)
		%(Estado_4 == go, Estado_5 == rs) %pela regra 2 sei que sp está na 5°.
	)
	
. %%% <== PONTO FINAL, FIM DO PREDICADO LUTADORES(...)
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% BASE DE DADOS - FATOS %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%Faixas
	faixa(amarela).
	faixa(azul).
	faixa(branca).
	faixa(verde).
	faixa(vermelha).
	
%%%Nomes
	nome(diego).
	nome(emerson).
	nome(felipe).
	nome(milton).
	nome(renato).
	
%%%Idade
	idade(23).
	idade(25).
	idade(28).
	idade(30).
	idade(32).
	
%%%Peso
	peso(75).
	peso(79).
	peso(81).
	peso(84).
	peso(87).		

%%%Altura
	altura(1.75).
	altura(1.78).
	altura(1.80).
	altura(1.84).
	altura(1.87).

%%%Estado
	estado(es).
	estado(go).
	estado(rj).
	estado(rs).
	estado(sp).


	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% SÃO DIFERENTES? %%%%%%%
	saoDiferentes([]).
	saoDiferentes([H|T]):- not(member(H,T)),
	                      saoDiferentes(T).
%Explicação:
%			?	                      	                      
	                      
%%%%%% Imprimir a Lista %%%%%%%%%%%%%%%%%%%%%
	imprime([]):- write('\n *-* \n').
	imprime([H|T]):- 
		write('\n['),
	        write(H), write(']'),
	        imprime(T).
%Explicação:
%			-?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% Regras %%%%%%%%%%%%%%%%%%%%%%%%%
/*
Regras obtidas do site, com add de númeração.

1 - O lutador de 79 kg está ao lado do que veio do Espírito Santo.
2 -	O lutador de São Paulo está na quinta posição.
3 - O dono da faixa Vermelha está exatamente à direita do lutador de Goiás.
4 - O lutador do Rio de Janeiro é faixa Branca.
5 -	Na quinta posição está o lutador mais baixo.
6 - Emerson está ao lado do lutador mais alto.
7 - O lutador de 1,84 m está na terceira posição.
8 -	Em uma das pontas está o lutador de 1,78 m.
9 - O lutador de 81 kg está em uma das pontas.
10 - O faixa Vermelha está em algum lugar à esquerda do lutador de 84 kg.
11 - Os lutadores de GO e RS estão lado a lado.
12 - O lutador faixa Azul pesa 87 kg.
13 - O lutador de 75 kg está exatamente à esquerda do lutador de 25 anos.
14 - O lutador de 30 anos está exatamente à esquerda do lutador mais baixo.
15 - O mais velho é do estado de SP.
16 - O lutador de 28 anos está exatamente à direita do lutador de GO.
17 - Milton é faixa Amarela.
18 - Renato pesa 79 kg.
19 - Felipe está na segunda posição.
20 - Emerson está em algum lugar à direita do lutador faixa Branca.
21 - O lutador faixa Branca está na primeira posição.
*/


%%% Fimmmm
