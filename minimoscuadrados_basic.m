clear all;
close all;

% Cargar los datos del archivo .mat
load('datos_simulados.mat');

% Graficar los datos originales
plot(x, y, 'o');  % Graficar puntos de datos originales
hold on;

% Construir la matriz de diseño para el ajuste cuadrático
A = [x.^2, x, ones(length(x), 1)];  % Matriz de diseño: [x^2, x, 1]

% Resolver el sistema usando el método de mínimos cuadrados
p = A \ y;  % p contendrá los coeficientes [a; b; c] del ajuste

% Extraer los coeficientes del polinomio
a = p(1);  % Coeficiente de x^2
b = p(2);  % Coeficiente de x
c = p(3);  % Término independiente (constante)

% Graficar la curva ajustada
x_fit = linspace(min(x), max(x), 100);  % Valores de x para la curva ajustada
y_fit = a * x_fit.^2 + b * x_fit + c;  % Evaluar el polinomio ajustado

y_fit = y_fit'; %Trasponer a vextor columna

plot(x, y_fit, '-r', 'LineWidth', 2);  % Graficar la curva ajustada

e_res = sum((y-y_fit).^2); % Cálculo del residuo

% Etiquetas y leyenda
legend('Datos', 'Ajuste mínimos cuadrados');
xlabel('x');
ylabel('y');
title('Ajuste por mínimos cuadrados - Función cuadrática - Residuo: ', num2str(e_res));
hold off;
