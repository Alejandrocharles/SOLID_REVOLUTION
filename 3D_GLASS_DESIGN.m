PYTHON EN GOOGLE COLLAB: 
https://colab.research.google.com/drive/1lEhzgO-d1RnTugZ2xsmx6g36-ocF0ver?usp=sharing

CODIGO IMPLEMENTADO EN MATLAB:
% Crea una malla de valores para u y v
u = linspace(-0.002, 16, 150);
v = linspace(0, 2*pi, 100);
[u, v] = meshgrid(u, v);

% Define las funciones para y2, x, y, z
x = u;
y2 = calcularY2(x);
y = sin(v).*y2;
z = cos(v).*y2;

% Crea la figura y el subplot para el gráfico 3D
crearGrafica3D(x, y, z);

function y2 = calcularY2(x)
    % Calcula los valores de y2 en función de x
    y2 = zeros(size(x));
    y2((-0.0011 <= x) & (x <= -0.001)) = 25000*x((-0.0011 <= x) & (x <= -0.001)) + 28;
    y2((0 <= x) & (x <= 2)) = 0.075*x((0 <= x) & (x <= 2)) + 3;
    y2((2 <= x) & (x <= 9)) = 0.0020*x((2 <= x) & (x <= 9)).^2 - 0.1153*x((2 <= x) & (x <= 9)) + 3.2724;
    y2((9 <= x) & (x <= 16)) = 0.0246*x((9 <= x) & (x <= 16)).^2 - 0.4031*x((9 <= x) & (x <= 16)) + 4.1280;
end

function crearGrafica3D(x, y, z)
    % Crea la figura y el subplot para el gráfico 3D
    figure('Position', [100, 100, 800, 600]);
    sub_plot = subplot(1, 1, 1, 'Parent', gcf, 'Projection', 'perspective');

    % Utiliza el método mesh para graficar la superficie
    mesh(sub_plot, x, y, z, 'EdgeColor', 'interp', 'FaceColor', 'none');

    % Configura el mapa de colores
    colormap(sub_plot, [linspace(1,0,256)', linspace(0,0,256)', linspace(0,1,256)']);

    % Configura las etiqueatas de los ejes y el título del gráfico
    xlabel(sub_plot, 'Eje X');
    ylabel(sub_plot, 'Eje Y');
    zlabel(sub_plot, 'Eje Z');
    title(sub_plot, 'Diseño de Vaso en MATLAB');

    % Agrega límites a los ejes
    xlim(sub_plot, [0, 16]);
    ylim(sub_plot, [-4, 4]);
    zlim(sub_plot, [-4, 4]);

    % Muestra el gráfico
    view(sub_plot, [-120,60]);
end
