%% Descri��o
%{
Autor: Thiago Martins Firmo
T�tulo: distancia
Par�metros de entrada: a[matriz de localiza��o das cidades],nl[n�mero de linhas da matriz "a" com rota completa];
Par�metro de sa�da: dist[dist�ncia total da rota];
%}

%% fun��o
function [dist]=distancia(a,nl)
dist=0;                                                 % inicializa��o da dist�ncia
x=a(:,2);                                               % troca de nome das vari�veis horizontais
y=a(:,3);                                               % troca de nome das vari�veis verticais
for j=1:nl-1
    dist=dist+hypot(x(j+1,1)-x(j,1),y(j+1,1)-y(j,1));   % c�lculo da dist�ncia total
end
end