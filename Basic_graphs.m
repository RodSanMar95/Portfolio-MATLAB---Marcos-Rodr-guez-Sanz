clear all;
close all;

% Matriz Laplaciana
% L = [1 -1 0; -1 2 -1; 0 -1 1];
% L = [2 -1 -1 0 0 0;-1 2 -1 0 0 0;-1 -1 3 -1 0 0;0 0 -1 3 -1 -1;0 0 0 -1 2 -1;0 0 0 -1 -1 2];
L = [2 -1 -1 0 0;-1 3 -1 0 -1; -1 -1 3 -1 0; 0 0 -1 2 -1;0 -1 0 -1 2];
% Calcular autovalores y autovectores
[V, D] = eig(L);

% Establecer una tolerancia para considerar los autovalores y autovectores cercanos a cero
tolerancia = 1e-4;  % Tolerancia de 0.0001

% Extraer los autovalores de la diagonal de D
autovalores = diag(D);

% Ignorar los autovalores que sean menores que la tolerancia (considerados "cero")
autovalores_no_cero = autovalores(abs(autovalores) > tolerancia);

% Obtener el autovalor más pequeño distinto de cero
[min_autovalor, idx] = min(autovalores_no_cero);  % Autovalor mínimo distinto de cero

% Encontrar la columna correspondiente al autovalor más pequeño en D
columna_autovalor_min = find(abs(autovalores - min_autovalor) < tolerancia);

% Extraer el autovector correspondiente al autovalor más pequeño
autovector_min = V(:, columna_autovalor_min);

% Agrupar las filas según el signo de los elementos en el autovector
grupo_positivos = [];  % Inicializar grupo de elementos positivos
grupo_negativos = [];  % Inicializar grupo de elementos negativos
grupo_indif =[]; % Inicializar grupo elementos que pueden estar en cualquier grupo

for i = 1:length(autovector_min)
    if autovector_min(i) > tolerancia
        grupo_positivos = [grupo_positivos, i];  % Filas con valores positivos
    elseif autovector_min(i) < -tolerancia
        grupo_negativos = [grupo_negativos, i];  % Filas con valores negativos
    else
        % Si está cerca de cero, lo asignamos al grupo de indiferentes
        grupo_indif = [grupo_indif, i];
    end
end

% Mostrar resultados
disp('Autovalor más pequeño distinto de cero:');
disp(min_autovalor);

disp('Agrupación de filas según el autovector correspondiente:');
disp('Grupo de filas con valores positivos o cercanos a cero:');
disp(grupo_positivos);

disp('Grupo de filas con valores negativos:');
disp(grupo_negativos);

disp('Elemtos que pueden estar en un grupo o en otro:')
disp(grupo_indif);
% Crear la matriz de adyacencia para el gráfico
Adj = diag(diag(L)) - L;
G = graph(Adj);

% Graficar el gráfico de la matriz de adyacencia
figure;
plot(G);
title('Grafo asociado a la matriz de adyacencia');
