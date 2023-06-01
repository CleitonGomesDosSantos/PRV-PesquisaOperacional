%% Descri��o
%{
Autor: Thiago Martins Firmo
T�tulo: K-opt
Par�metros de entrada: a[matriz de localiza��o das cidades],nl[n�mero de linhas da matriz "a" com rota completa];
k[mudan�a k]
Par�metro de sa�da: b[nova matriz de percurso];
%}

%% fun��o
function [b]=K_opt(a,nl,k)
k1=2*k;                             % par�metro para gera��o do vetor de trocas
b=a;                                % backup da matriz a
aux=zeros(1,k1);                    % cria��o do vetor de armazenamento das posi��es de troca

while length(unique(aux))~=k1       % condi��o para n�o repeti��o de elementos para troca
    rng('shuffle');                % par�metro para mudan�a da aleatoriedade
    aux=randi([2,nl-1],1,k1);       % gera��o aleat�ria de trocas
end

for j=1:k                           % troca das posi��es
     aux1=b(aux(1,j+2),:);
     aux2=b(aux(1,j),:);
     b(aux(1,j),:)=aux1;
     b(aux(1,j+2),:)=aux2;
end
end