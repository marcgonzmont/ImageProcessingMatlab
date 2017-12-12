# Image processing with MATLAB

Conjunto de scripts para procesamiento de imágenes con MATLAB.

## Blur Detection

Corresponde al script *main1*. Primero realiza un filtro gaussiano sobre el conjunto de entrada que se le da, guardando las imágenes en el directorio especificado. Después toma el directorio de salida para medir la varianza de la imagen y eliminarla si es superior a un valor.

Con imágenes de una densidad de píxeles grnde, el valor de la varianza se muestra demasiado pequeño.

### Parameters

* *main1*: directorios original y destino, nivel de *blur*, tamaño del *kernel* para el filtro gaussiano
* *blurrer*: busca **sólo imágenes png**
* *blurdetect*: busca **sólo imágenes png**

## Color Tracking

Corresponde al script *main2*. Diferencia si se utiliza un fichero de vídeo o un directorio con los *frames*. Alpica una máscara de selección de color, busca el contorno de mayor área y dibuja el círculo que lo contiene junto su centroide.

### Parameters

* *main2*: ruta del fichero de vídeo o el directorio de *frames*, límites superior e inferior para el color (HSV), dimensión del *kernel* para operación morfológica, número de veces que se realiza cada operación morfológica.

## Codebar Detector

Corresponde al script *main3*. Lee cada imagen que se encuentra en un directorio, aplica varias operaciones morfológicas, el gradiente de la imagen, busca el contorno de mayor área y dibuja el rectángulo que lo encierra.

No se ha utilizado el *threshold* de referencia por los pobres resultados que presenta. En su lugar se ha optado por un *threshold* Otsu basado en el histograma de la imagen. Aun así, no presenta buenos resultados cuando hay más contornos con mayor área. Para solventarlo, se podría incluir un detector de líneas y que las mismas corten  (las máximas posibles) a la *bounding box* de interés.

### Parameters

* *main3*: ruta del directorio de **imágenes en jpg**, dimensiones de los *kernel* para operaciones morfológicas, número de veces que se realiza cada operación morfológica (erosión y dilatación), factor de escalada para redimensionamiento de la imagen.

## Versioning

I use [GitKraken client](https://www.gitkraken.com/) for versioning. For the versions available, see the [commits on this repository](https://github.com/marcgonzmont/ImageProcessingMatlab/commits/master). 

## Authors

* **Marcos González** - *ImageProcMATLAB* - [marcgonzmont](https://github.com/marcgonzmont)

## License

This project is licensed under the Creative Commons License - see the [LICENSE.md](LICENSE.md) file for details
