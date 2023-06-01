%% Descri��o
%{
Autor: Thiago Martins Firmo
T�tulo: greedy
Par�metros de entrada: a[matriz de localiza��o das cidades],nl[n�mero de linhas da matriz "a"];
Par�metro de sa�da: a1[nova matriz de percurso];
%}

%% fun��o
function [a1] = greedy(a,nl)
[~,aux2]=sort(a(:,1));          % inicio de organiza��o da matriz "a"/ encontra ordem dos termos 

for j=1:nl                      % reorganiza��o dos termos
    b(j,:)=a(aux2(j,1),:);
end
x=b(:,2);                       % nomea��o dos termos
y=b(:,3);
cont=1;

for j=1:nl                      % gera��o de uma matriz de dist�ncias entre todas as cidades
    for k=1:nl
        dist(j,k)=hypot(x(j,1)-x(k,1),y(j,1)-y(k,1));
        if dist(j,k)==0
            dist(j,k)=inf;
        end
    end
end
a1(1,:)=b(1,:);                  % primeiro termo da matriz solu��o
dist(:,1)=inf;                   % anula coluna 1
procura=1;                       % inicializa��o de termo de procura
while cont<nl                    % procura em todas linhas
   [~,ind]=min(dist(procura,:)); % indice do menor valor de dist�ncia da linha 
    a1(cont+1,:)=b(ind,:);       % aloca��o do termo "cont+1" na matriz solu��o
    cont=cont+1;                 % incremento do contador
    dist(:,ind)=inf;             % anula��o da linha referente ao indice procurado
    procura=ind;                 % procura recebe a pr�xima linha a ser sondada EX: (1,2)-(2,7)-(7,1)-(1,9)
end
a1(nl+1,:)=a1(1,:);              % �ltimo termo recebe o primeiro / fechamento do ciclo
plot(a1(:,2),a1(:,3),'*');       % plota pontos/ cidades

for j=2:length(a1)               % plota os caminhos entre as cidades
    line(a1(j-1:j,2),a1(j-1:j,3));
    pause(0.15)
end
end