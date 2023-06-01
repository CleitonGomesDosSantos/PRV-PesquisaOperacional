%% Descrição
%{
Autor: Thiago Martins Firmo
Título: K-opt
Parâmetros de entrada: a[matriz de localização das cidades],nl[número de linhas da matriz "a" com rota completa];
k[mudança k]
Parâmetro de saída: b[nova matriz de percurso];
%}

%% função
function [b]=K_opt(a,nl,k)
k1=2*k;                             % parâmetro para geração do vetor de trocas
b=a;                                % backup da matriz a
aux=zeros(1,k1);                    % criação do vetor de armazenamento das posições de troca

while length(unique(aux))~=k1       % condição para não repetição de elementos para troca
    rng('shuffle');                % parâmetro para mudança da aleatoriedade
    aux=randi([2,nl-1],1,k1);       % geração aleatória de trocas
end

for j=1:k                           % troca das posições
     aux1=b(aux(1,j+2),:);
     aux2=b(aux(1,j),:);
     b(aux(1,j),:)=aux1;
     b(aux(1,j+2),:)=aux2;
end
end