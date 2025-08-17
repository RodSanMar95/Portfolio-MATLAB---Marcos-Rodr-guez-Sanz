% clear all
% close all

% Cargar la matriz Netflix
A = Netflix;  
A = double(A);  % Convertir la matriz de tipo int a tipo double

% Calcular el rango de la matriz A
r = rank(A);

% Imprimir el rango de la matriz con fprintf
fprintf('Rango de la matriz: %d\n', r);

% Calcular la descomposición en valores singulares de A
[U, S, V] = svd(A);

% Establecer los umbrales
valor_singular_umbral = 3;  % Valor singular mayor que 3
elemento_umbral = 0.3;      % Elementos mayores que 0.3 en U y V

% Inicializar variables para los grupos
grupos = {};  % Lista para almacenar los grupos

% Buscar valores singulares mayores que 3
for i = 1:min(size(S))  % Recorrer los valores singulares
    valor_singular = S(i, i);  % Valor singular en la posición i
    
    if valor_singular > valor_singular_umbral
        % Buscar los elementos de la columna i de U y V mayores que 0.3
        filas_U = find(abs(U(:, i)) > elemento_umbral);  % Índices de filas en U
        filas_V = find(abs(V(:, i)) > elemento_umbral);  % Índices de filas en V
        
        % Guardar el grupo de filas asociado a este valor singular
        grupos{end+1} = struct('valor_singular', valor_singular, ...
                               'filas_U', filas_U, ...
                               'filas_V', filas_V);
    end
end

% Mostrar los resultados
for i = 1:length(grupos)
    fprintf('Grupo asociado al valor singular %.2f:\n', grupos{i}.valor_singular);
    fprintf('Filas de U: %s\n', mat2str(grupos{i}.filas_U));
    fprintf('Filas de V: %s\n\n', mat2str(grupos{i}.filas_V));
end
