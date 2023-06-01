%% Descrição
%{
Autor: Thiago Martins Firmo
Título: greedy
Parâmetros de entrada: a[matriz de localização das cidades],nl[número de linhas da matriz "a"];
Parâmetro de saída: a1[nova matriz de percurso];
%}

%% função
function [a1] = greedy(a,nl)
[~,aux2]=sort(a(:,1));          % inicio de organização da matriz "a"/ encontra ordem dos termos 

for j=1:nl                      % reorganização dos termos
    b(j,:)=a(aux2(j,1),:);
end
x=b(:,2);                       % nomeação dos termos
y=b(:,3);
cont=1;

for j=1:nl                      % geração de uma matriz de distâncias entre todas as cidades
    for k=1:nl
        dist(j,k)=hypot(x(j,1)-x(k,1),y(j,1)-y(k,1));
        if dist(j,k)==0
            dist(j,k)=inf;
        end
    end
end
a1(1,:)=b(1,:);                  % primeiro termo da matriz solução
dist(:,1)=inf;                   % anula coluna 1
procura=1;                       % inicialização de termo de procura
while cont<nl                    % procura em todas linhas
   [~,ind]=min(dist(procura,:)); % indice do menor valor de distância da linha 
    a1(cont+1,:)=b(ind,:);       % alocação do termo "cont+1" na matriz solução
    cont=cont+1;                 % incremento do contador
    dist(:,ind)=inf;             % anulação da linha referente ao indice procurado
    procura=ind;                 % procura recebe a próxima linha a ser sondada EX: (1,2)-(2,7)-(7,1)-(1,9)
end
a1(nl+1,:)=a1(1,:);              % último termo recebe o primeiro / fechamento do ciclo
plot(a1(:,2),a1(:,3),'*');       % plota pontos/ cidades

for j=2:length(a1)               % plota os caminhos entre as cidades
    line(a1(j-1:j,2),a1(j-1:j,3));
    pause(0.15)
end
end