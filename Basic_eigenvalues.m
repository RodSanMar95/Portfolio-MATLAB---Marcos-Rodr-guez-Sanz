clear all;
close all;

% Car Hiring company between 3 cities
% A = [0.8 0.2 0.15; 0.09 0.65 0.35; 0.11 0.15 0.5]; % Matriz de transición
% EN REDES DE MARKOV => sum(columnas) = 1
 A =[0.9 0.5;0.1 0.5];
% Sumar las columnas e imprimir
for i = 1:2
    fprintf('Suma de la columna %d: %.2f\n', i, sum(A(:,i)));
end

% Encontrar los autovalores y autovectores de la matriz
[V, D] = eig(A);

% Primer autovector (estado estacionario) correspondiente al autovalor 1
x0 = V(:,1);
x0 = x0 / sum(x0);  % Normalizar para que la suma de los elementos sea 1

% Imprimir el estado estacionario
disp('Estado estacionario:');
disp(x0);
