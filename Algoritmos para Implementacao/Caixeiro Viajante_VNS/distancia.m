%% Descrição
%{
Autor: Thiago Martins Firmo
Título: distancia
Parâmetros de entrada: a[matriz de localização das cidades],nl[número de linhas da matriz "a" com rota completa];
Parâmetro de saída: dist[distância total da rota];
%}

%% função
function [dist]=distancia(a,nl)
dist=0;                                                 % inicialização da distância
x=a(:,2);                                               % troca de nome das variáveis horizontais
y=a(:,3);                                               % troca de nome das variáveis verticais
for j=1:nl-1
    dist=dist+hypot(x(j+1,1)-x(j,1),y(j+1,1)-y(j,1));   % cálculo da distância total
end
end