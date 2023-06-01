%% Descri��o
%{
Autor: Thiago Martins Firmo
T�tulo: VNS
Par�metros de entrada: inst�ncia com localiza��o das cidades;
Par�metro de sa�da: menor rota;
%}

%% Prepara��o
clc                                             % limpeza do prompt de comando
clear all                                       % limpeza das vari�veis armazenadas
close all                                       % fecha todas figuras

%% Leitura de dados
%a=load('a280.txt');                            % carrega os dados do txt na vari�vel "a"
%a=load('pr76.txt');                             
a=load('att48.txt');
%a=load('dantzig42.txt');
%a=load('bayg29.txt');
%a=load('burma14.txt');

[nl,~]=size(a);                                 % n�mero de linhas
nl2=nl+1;                                       % acrescenta mais uma linha para fechar um ciclo
nl_aux=randperm(nl)';                           % faz uma mistura no n�mero de linhas
a(:,:)=a(nl_aux,:);                             % carrega o novo vetor "a" misturado

%% Plotagem Cidades
plot(a(:,2),a(:,3),'*');                        % plota as cidades
line(a(:,2),a(:,3));                            % plota a rota entre cidades

%% Inicializa��o de Vari�veis
dist_atual=inf;                                 % inicializa a dist�ncia como infinita
cond=0;                                         % inicializa condi��o para o m�todo VNS
k=2;                                            % vari�vel inicial para o m�todo k-opt
cont=1;                                         % inicializa contador
parada=1;                                       % inicializa condi��o de parada do m�todo VNS

%% Solu��o Inicial
[a] = greedy(a,nl);                        % constru��o da solu��o inicial/ fun��o gulosa
