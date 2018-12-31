Crea la estructura para un informe en latex en la que se puede compilar el archivo total o partes mas pequenias por separado. 
Crea un archivo para caratula y uno para el preambulo, los cuales no pueden compilarse por separado. 

El nombre del archivo principal se pasa como primer parametro. 
Los nombres de la secciones del informe (sin contar la caratula) se pasan a partir del segundo parametro.

Crea un directorio principal con el nombre del primer parametro. Este contiene:
*Un archivo con el mismo nombre, que al compilarlo se compila el informe completo
*Una carpeta extra llamada "extra" que contiene la caratula y el preambulo
*Una carpeta por cada seccion pasada como parametro con el mismo nombre de la seccion. Estas carpetas a su vez contienen:
    - Un archivo con el mismo nombre que la carpeta. Al compilarlo se compila solamente esa seccion
    - Una carpeta "figures" para guardar cualquier imagen que se quiera poner en los archivos de las secciones.

Ejemplo de uso:

new_report_latex tp_4 intro marcoTeorico mediciones analisis conclusion


No se puede usar espacios para los nombres porque revienta todo.