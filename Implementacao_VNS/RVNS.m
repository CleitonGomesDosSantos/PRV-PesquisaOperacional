  %% Descrição
%{
Autor: Thiago Martins Firmo
Título: VNS
Parâmetros de entrada: instância com localização das cidades;
Parâmetro de saída: menor rota;
%}

%% Preparação
clc                                             % limpeza do prompt de comando
clear all                                       % limpeza das variáveis armazenadas
close all                                       % fecha todas figuras

%% Leitura de dados
%a=load('a280.txt');                            % carrega os dados do txt na variável "a"
%a=load('pr76.txt');                             
%a=load('att48.txt');
%a=load('dantzig42.txt');
%a=load('bayg29.txt');
a=load('burma14.txt');

[nl,~]=size(a);                                 % número de linhas
nl2=nl+1;                                       % acrescenta mais uma linha para fechar um ciclo
nl_aux=randperm(nl)';                           % faz uma mistura no número de linhas
a(:,:)=a(nl_aux,:);                             % carrega o novo vetor "a" misturado

%% Plotagem Cidades
plot(a(:,2),a(:,3),'*');                        % plota as cidades
line(a(:,2),a(:,3));                            % plota a rota entre cidades

%% Inicialização de Variáveis
dist_atual=inf;                                 % inicializa a distância como infinita
cond=0;                                         % inicializa condição para o método VNS
k=2;                                            % variável inicial para o método k-opt
cont=1;                                         % inicializa contador
parada=1;                                       % inicializa condição de parada do método VNS

%% Solução Inicial
[a] = greedy(a,nl);                             % construção da solução inicial/ função gulosa
 a(nl2,:)=a(1,:);                               % acrescenta a última linha / fechamento do ciclo
 pause(1.0);                                    % pausa para apresentação do resultado da função gulosa

%% Método RVNS
while cond==0
[b]=K_opt(a,nl2,k);
[dist]=distancia(b,nl2);
    if cont==3
        k=3;
    else if cont==4
            k=4;
        else if cont==5
                cont=2;
            end
        end
    end

    if dist<dist_atual
        dist_atual=dist;
        a=b;
        plot(b(:,2),b(:,3),'*');                        
        line(b(:,2),b(:,3));
        cont=1;
        parada=1;
        pause(0.001);
    end
    if parada>2000000
        cond=1;
    end
    
    cont=cont+1;
    parada=parada+1
end