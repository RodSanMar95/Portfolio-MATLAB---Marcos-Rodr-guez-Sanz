close all;
clear all;

% Cargar los datos del archivo .mat
load('datos_simulados.mat');

% Graficar los datos originales
plot(x, y, 'o');  % Graficar puntos de datos originales
hold on;

% Construir la matriz de diseño para el ajuste cuadrático
A = [x.^2, x, ones(length(x), 1)];  % Matriz de diseño: [x^2, x, 1]

% Resolver el sistema usando el método de mínimos cuadrados
coef = A'*A\A'*y;
y_fit = A*coef;

e_res = sum((y-y_fit).^2); % Cálculo del residuo

% Graficar la curva ajustada
plot(x, y_fit, '-r', 'LineWidth', 2);  % Graficar la curva ajustada

% Etiquetas y leyenda
legend('Datos', 'Ajuste mínimos cuadrados');
xlabel('x');
ylabel('y');
title('Ajuste por mínimos cuadrados - Función cuadrática - Residuo: ', num2str(e_res));
hold off;