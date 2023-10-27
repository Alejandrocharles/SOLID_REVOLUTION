PYTHON EN GOOGLE COLLAB: 
https://colab.research.google.com/drive/1lEhzgO-d1RnTugZ2xsmx6g36-ocF0ver?usp=sharing

  # se importan librerias 
  import numpy as np
  import matplotlib.pyplot as plt
  from mpl_toolkits.mplot3d import Axes3D

  # Crea una malla de valores para u y v
  u = np.linspace(-0.002, 16, 150)
  v = np.linspace(0, 2*np.pi, 100)
  u, v = np.meshgrid(u, v)

  # Define las funciones para y2, x, y, z
  x = u
  y2 = np.piecewise(x,
                    [(-0.0011 <= x) & (x <= -0.001),
                    (0 <= x) & (x <= 2),
                    (2 <= x) & (x <= 9),
                    (9 <= x) & (x <= 16)],
                    [lambda x: 25000*x + 28,
                      lambda x: 0.075*x + 3,
                      lambda x: 0.0020*x**2-0.1153*x+3.2724,
                      lambda x: 0.0246*x**2-0.4031*x+4.1280])
  y = np.sin(v)*y2
  z = np.cos(v)*y2

  # Crea la figura y el subplot para el gráfico 3D
  fig = plt.figure(figsize=(8, 6))
  sub_plot = fig.add_subplot(1, 1, 1, projection='3d')

  # Grafica la superficie
  surf = sub_plot.plot_surface(x, y, z, cmap='coolwarm', linewidth=0, antialiased=False)

  # otra vista del vaso 
  fig = plt.figure(figsize=(8, 6))
  ax = fig.add_subplot(1, 1, 1, projection='3d')
  surf = ax.plot_surface(y, x, z, cmap='coolwarm', linewidth=0, antialiased=False)

  # Configura las etiquetas de los ejes y el título del gráfico
  sub_plot.set_xlabel('x')
  sub_plot.set_ylabel('y')
  sub_plot.set_zlabel('z')
  sub_plot.set_title('DISEÑO VASO 3D')

  # Agrega límites a los ejes
  sub_plot.set_xlim([0, 16])
  sub_plot.set_ylim([-4, 4])
  sub_plot.set_zlim([-4, 4])

  # Muestra el gráfico
  plt.show()
