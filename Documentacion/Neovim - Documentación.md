<img alt="Neovim Logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Neovim-mark.svg/1680px-Neovim-mark.svg.png"  align="left" width="60" style="margin-right:30px">

# My Neovim Customization

<!-- vim-markdown-toc GFM -->

* [Movimientos básicos](#movimientos-básicos)
    * [Nivel 1 - hjkl](#nivel-1---hjkl)
    * [Nivel 2 - Avanzar dentro de la linea](#nivel-2---avanzar-dentro-de-la-linea)
    * [Nivel 3 - Avanzar por caracteres](#nivel-3---avanzar-por-caracteres)
    * [Nivel 4 - Desplazarse](#nivel-4---desplazarse)
    * [Nivel 5 - Help pages](#nivel-5---help-pages)
* [Comandos Básicos](#comandos-básicos)
    * [Nivel 1 - Abrir y guardar archivos](#nivel-1---abrir-y-guardar-archivos)
    * [Nivel 2 - Búsqueda, reemplazo y acciones](#nivel-2---búsqueda-reemplazo-y-acciones)
    * [Nivel 3 - Otros](#nivel-3---otros)
* [Atajos](#atajos)
    * [Básicos](#básicos)
    * [No tan básicos](#no-tan-básicos)
        * [Ejemplo de conjugación de atajos](#ejemplo-de-conjugación-de-atajos)
    * [Tabs](#tabs)
    * [Buffers](#buffers)
    * [Folds](#folds)
    * [Tamaño de la Ventana](#tamaño-de-la-ventana)
    * [Moverse entre ventanas](#moverse-entre-ventanas)
    * [Mover bloques de texto](#mover-bloques-de-texto)
    * [Macros](#macros)
    * [Marks](#marks)
    * [Juntar lineas](#juntar-lineas)
    * [Números](#números)
    * [Sort](#sort)
    * [Surround](#surround)
    * [Modo Diff (`vimdiff` o `nvim -d`)](#modo-diff-vimdiff-o-nvim--d)
    * [Registros - tipos](#registros---tipos)
    * [Compilar archivos](#compilar-archivos)
        * [Mi forma](#mi-forma)
        * [Forma VIM](#forma-vim)
    * [Otros atajos](#otros-atajos)
* [Plugins](#plugins)
    * [Photos](#photos)
    * [Venn](#venn)
    * [TableMode (Markdown)](#tablemode-markdown)
        * [CSV](#csv)
        * [Cómo construir una tabla](#cómo-construir-una-tabla)
    * [Telescope](#telescope)
        * [Movimientos](#movimientos)
        * [Extensiones/Funciones](#extensionesfunciones)
    * [NvimTree](#nvimtree)
    * [Hop](#hop)
    * [TagBar](#tagbar)
    * [ToggleTerm](#toggleterm)
    * [Packer](#packer)
    * [Startify](#startify)
    * [ZenMode](#zenmode)
    * [Multiple-Cursors](#multiple-cursors)
    * [Terminal](#terminal)
    * [Git](#git)
    * [LSP](#lsp)
    * [Oil](#oil)
    * [BufferLine](#bufferline)
    * [UndoTree](#undotree)
    * [Comment](#comment)
    * [DAP](#dap)
        * [Mappings](#mappings)
        * [Mappings de las ventanas más importantes](#mappings-de-las-ventanas-más-importantes)
            * [Breakpoints (Frena la ejecución)](#breakpoints-frena-la-ejecución)
            * [Scopes (Muestra los Scopes y variables)](#scopes-muestra-los-scopes-y-variables)
            * [Watch (Permite vigilar bajo demanda ciertas variables)](#watch-permite-vigilar-bajo-demanda-ciertas-variables)
    * [Neorg](#neorg)
        * [Dentro de un archivo de Neorg](#dentro-de-un-archivo-de-neorg)
            * [Tareas](#tareas)
            * [Listas](#listas)
            * [Modos](#modos)
            * [Integración con Telescope](#integración-con-telescope)
            * [Otros](#otros)
        * [Globales](#globales)
    * [Mkdnflow (Markdown)](#mkdnflow-markdown)
* [Datos útiles](#datos-útiles)
* [Buffer <-> Tab <-> Session](#buffer---tab---session)
* [Ejemplos de RegEx en Neovim](#ejemplos-de-regex-en-neovim)

<!-- vim-markdown-toc -->

## Movimientos básicos

### Nivel 1 - hjkl

|  Atajo  | Significado |
|:-------:|-------------|
| **`h`** | ⇦           |
| **`j`** | ⇩           |
| **`k`** | ⇧           |
| **`l`** | ⇨           |

### Nivel 2 - Avanzar dentro de la linea

|   Atajo  | Significado                                            |
|:--------:|--------------------------------------------------------|
|  **`w`** | Avanza una Palabra (Sobre el principio de la misma)    |
|  **`b`** | Retrocede una Palabra (Sobre el principio de la misma) |
|  **`e`** | Avanza una palabra (Apuntando al final de la palabra)  |
| **`ge`** | retrocede palabra por palabra en el final de la misma  |
|  **`0`** | Principio de la Linea                                  |
| **`gh`** | Principio de la Linea                                  |
|  **`$`** | Final de la Linea                                      |
| **`gl`** | Final de la Linea                                      |
|  **`^`** | Va al primer carácter no vacío                         |

### Nivel 3 - Avanzar por caracteres

|      Atajo     | Significado                                |
|:--------------:|--------------------------------------------|
| **`f[Letra]`** | Se mueve a la siguiente letra              |
| **`F[Letra]`** | Se mueve a la anterior letra               |
| **`t[Letra]`** | Va un caracter antes de la siguiente letra |
| **`T[Letra]`** | Va un caracter antes de la anterior letra  |
|     **`;`**    | Siguiente resultado de ‘t’ o ‘f’           |
|     **`,`**    | Anterior resultado de ‘t’ o ‘f’            |

### Nivel 4 - Desplazarse

|       Atajo      | Significado                                                               |
|:----------------:|---------------------------------------------------------------------------|
|      **`o`**     | En modo Visual, mueve hacia la otra punta de la selección                 |
|      **`{`**     | Salta un Párrafo atrás                                                    |
|      **`}`**     | Salta un Párrafo adelante                                                 |
|     **`]s`**     | Avanza por los errores gramaticales                                       |
|     **`[s`**     | Retrocede por los errores gramaticales                                    |
|     **`[{`**     | Va hacia el anterior '{'                                                  |
|     **`cs`**     | Va a la anterior linea modificada                                         |
|     **`cd`**     | Va a la siguiente linea modificada                                        |
|      **`M`**     | Moverse a la parte media de la pantalla                                   |
|      **`%`**     | Dirige a la llave, paréntesis, etc. (que está debajo del cursor) opuesto. |
| **`[Numero] %`** | Va al porcentaje del documento                                            |
| **`[Numero]gg`** | Va a la línea que se ingresó                                              |
|  **`m[letra]`**  | Pone una Marca en el punto sobre el que el cursor está                    |
|  **`'[Letra]`**  | Va hacia esa marca                                                        |

### Nivel 5 - Help pages

|        Atajo       | Significado                                              |
|:------------------:|----------------------------------------------------------|
| **`:help [ALGO]`** | Ir a la ayuda del 'ALGO'                                 |
|   **`[Ctrl] ]`**   | Ir a la etiqueta (definición) que está debajo del cursor |
|    **`[Ctrl]o`**   | Regresa a la anterior posición                           |


## Comandos Básicos

### Nivel 1 - Abrir y guardar archivos
|         Comando        | Significado                                    |
|:----------------------:|------------------------------------------------|
|        **`:w`**        | Guardar                                        |
|        **`:q`**        | Salir                                          |
|        **`:q!`**       | Salir forzadamente                             |
|        **`:wq`**       | Guardar y Salir                                |
|        **`:x`**        | Igual que :wq                                  |
|       **`:wq!`**       | Lo mismo que :wq pero para archivos de lectura |
|     **`:e [RUTA]`**    | Abre el archivo ([RUTA] = ruta del archivo)    |
| **`:browse oldfiles`** | Busca entre archivos recientemente abiertos    |

### Nivel 2 - Búsqueda, reemplazo y acciones

|               Comando              | Significado                                                                                                                                                   |
|:----------------------------------:|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
|     **`:s/Palabra/Reemplazo`**     | Realiza 1 solo reemplazo                                                                                                                                      |
|    **`:s/Palabra/Reemplazo/g`**    | Reemplaza todas las ocurrencias DE LA LINEA                                                                                                                   |
| **`S == :%s/Palabra/Reemplazo/g`** | Reemplaza todas las ocurrencias DEL ARCHIVO (Atajo de teclado: `S`)                                                                                           |
|   **`:%s/Palabra/Reemplazo/gc`**   | Reemplaza todas las ocurrencias del archivo, consultando una por una la acción.                                                                               |
|            **`:%s/\n/\r\r/g`**           | Para reemplazar 1 linea con 2 nuevas lineas                                                                                                                   |
|     **`:g/[Patrón]/[Comando]`**    | Busca un Patrón y Realiza una acción (`:g/Texto_Basura/d` Busca el Texto y elimina la linea. Con `:!g` realiza lo inverso (Elimina lo que no es coincidente)) |

### Nivel 3 - Otros

|            Comando           | Significado                                                                                                                                  |
|:----------------------------:|----------------------------------------------------------------------------------------------------------------------------------------------|
|           **`q:`**           | Abre un buffer con el historial de comandos, para poder editarlos y ejecutarlos con enter (se pueden seleccionar varios comandos a ejecutar) |
|    **`:![Comando Bash]`**    | Ejecuta comando de Terminal                                                                                                                  |
|     **`:read [Comando]`**    | Lee un Comando y lo importa al texto (Ejemplo comando: !date o un archivo como “Texto.txt”)                                                  |
|      **`:earlier 10m`**      | Retrocede los cambios según en el tiempo especificado.                                                                                       |
| **`:verbose map [MAPPING]`** | Muestra a qué corresponde el mapping y donde fueron declarados por última vez                                                                |


## Atajos

> `⎵` significa la tecla Espacio

### Básicos

|      Atajo      | Significado                                                                                      |
|:---------------:|--------------------------------------------------------------------------------------------------|
|     **`i`**     | Entra en Insertar antes del cursor                                                               |
|     **`ii`**    | Sale del modo Insertar                                                                           |
|     **`I`**     | Entra en Insertar al Principio de la linea                                                       |
|     **`a`**     | Entra en Insertar después del cursor                                                             |
|     **`A`**     | Entra en Insertar al Final de la Linea                                                           |
|     **`/`**     | Permite buscar texto. Con **`n`** y **`N`** va al siguiente y anterior resultado respectivamente |
|     **`?`**     | Lo mismo que **`/`** pero con en sentido contrario                                               |
|     **`yy`**    | Copia una Linea                                                                                  |
|     **`dd`**    | Elimina (Corta) una Linea                                                                        |
|     **`p`**     | Pega el contenido abajo o a la derecha del cursor                                                |
|     **`P`**     | Como ‘p’ pero en la linea de arriba o antes del cursor                                           |
|     **`⎵p`**    | En visual mode, pega lo que se copio, sin que sea reemplazado por lo que se eliminó              |
|     **`u`**     | Deshacer                                                                                         |
|  **`[Ctrl] r`** | Rehacer                                                                                          |
|     **`v`**     | Modo Visual                                                                                      |
|     **`V`**     | Modo Visual Line                                                                                 |
|  **`[Ctrl] v`** | Modo Visual Block                                                                                |
|     **`R`**     | Modo Reemplazo                                                                                   |
|     **`gv`**    | Vuelve al ultimo texto seleccionado en Visual Mode                                               |
|     **`gi`**    | Vuelve al ultima linea en la que estuvo con modo Insert                                          |
|     **`⎵h`**    | Dividir Horizontalmente                                                                          |
|     **`⎵v`**    | Dividir Verticalmente                                                                            |
|     **`⎵q`**    | Mismo que :q                                                                                     |
|     **`⎵w`**    | Mismo que :wq                                                                                    |
|     **`⎵s`**    | Mismo que :w                                                                                     |
|     **`s`**     | Reemplaza el caracter debajo del cursor o varios caracteres (en visual mode)                     |
|     **`cc`**    | Reemplaza la linea y pone en modo Insertar                                                       |
|     **`o`**     | Insertar una nueva linea DEBAJO y entrar en insertar                                             |
|     **`O`**     | Mismo que ‘o’ pero Arriba                                                                        |
|     **`*`**     | Búsqueda rápida de la palabra que está debajo del cursor                                         |
|     **`#`**     | Lo mismo que `*` pero al revés                                                                   |
|     **`gf`**    | Abre el archivo sobre el que el cursor esta posicionado                                          |
|     **`gF`**    | Lo mismo que ‘gf’ pero abriéndolo en una cierta linea especificada (Ej: “archivo.c:75”)          |
|     **`.`**     | Rehace la ultima acción. Por ejemplo: ejecutando «ci" hola», para repetirlo, presiona « . »      |
| **`"[Letra]y`** | Copia un texto dentro de una tecla (registro)                                                    |
| **`"[Letra]p`** | Pega un texto que fue copiado dentro de una tecla (registro)                                     |

### No tan básicos

|            Atajo            | Significado                                                           |
|:---------------------------:|-----------------------------------------------------------------------|
|              gp             | Misma acción que **`p`**, pero dejando el cursor donde estaba antes   |
|              gP             | Misma acción que **`P`**, pero dejando el cursor donde estaba antes   |
|     **`:norm [ACCION]`**    | Para realizar la acción dentro de cada línea de una selección         |
|           **`zz`**          | Centrar texto en pantalla                                             |
|           **`zt`**          | Texto en la parte superior de la pantalla                             |
|           **`zb`**          | Texto en la parte inferior de la pantalla                             |
|   **`g[Flechas o hjkl]`**   | Sube por renglones visibles, no por lineas (compatible con 0 y $).    |
|        **`[Ctrl]o`**        | Permite entrar un comando Normal en INSERT                            |
|       **`[Ctrl]r "`**       | Pega lo que está en el portapapeles. SOLO FUNCIONA EN MODO COMANDOS!! |
|        **`[Ctr]r p`**       | Escribe el resultado de PWD. Utilización igual al que `[Ctrl + r] "`  |
|        **`Ctrl + g`**       | Información sobre el Documento                                        |
|           **`zg`**          | Agrega palabra al diccionario                                         |
|          **`zug`**          | Elimina palabra del diccionario                                       |
| **`[Ctrl] r = [Ecuacion]`** | Inserta el resultado de la ecuación escrita en el documento           |
|           **`⎵S`**          | Reemplaza la palabra que esta debajo del cursor                       |
|           **`⎵i`**          | Marca en rojo los caracteres no ASCII (ideal para *debuggear*)        |

#### Ejemplo de conjugación de atajos

|           Atajo           | Significado                                                                                            |
|:-------------------------:|--------------------------------------------------------------------------------------------------------|
|          **`d$`**         | Elimina (corta) hasta el final de la línea (incluyendo sobre la que está el cursor)                    |
|         **`y6y`**         | Copia 6 lineas hacia abajo (incluyendo sobre la que está el cursor)                                    |
|         **`y6l`**         | Copia 6 caracteres (incluyendo sobre la que está el cursor)                                            |
|          **`dG`**         | Elimina las lineas hasta el final del archivo (incluyendo sobre la que está el cursor)                                                       |
| **`[Accion]i[Caracter]`** | Ejecuta la Acción dentro de los carateres. Puede ser llamado a distancia[^1] o dentro de los mismos    |
| **`[Accion]a[Caracter]`** | Ejecuta la Acción alrededor de los carateres. Puede ser llamado a distancia[^1] o dentro de los mismos |
|         **`di(`**         | Elimina dentro de los paréntesis (dejando los paréntesis)                                              |
|         **`da[`**         | Elimina alrededor de los corchetes (eliminando los corchetes)                                          |
|         **`ci{`**         | Reemplaza dentro de las llaves                                                                         |
|         **`ciw`**         | Reemplaza Palabra y pone en modo Insertar                                                              |
|         **`<ap`**         | Indenta el párrafo hacia la izquierda                                                                  |
|         **`yi"`**         | Copia el contenido dentro de los " "                                                                   |

### Tabs

|            Atajo           | Significado             |
|:--------------------------:|-------------------------|
|     **`[Ctrl]t [Tab]`**    | Cambia al siguiente TAB |
| **`[Ctrl]t [Shift][Tab]`** | Cambia al anterior TAB  |
|       **`[Ctrl]t t`**      | Crea un nuevo TAB       |

### Buffers

|        Atajo        | Significado        |
|:-------------------:|--------------------|
|     **`[Tab]`**     | Siguiente Buffer   |
| **`[Shift] [Tab]`** | Anterior Buffer    |
|       **`T`**       | Nuevo Buffer vacío |

### Folds

|      Atajo      | Significado                         |
|:---------------:|-------------------------------------|
|     **`zo`**    | Abre el siguiente fold              |
|     **`zc`**    | Cierra el siguiente fold            |
|     **`za`**    | Toggle de los dos anteriores        |
|     **`zr`**    | Abre los folds del siguiente NIVEL  |
|     **`zm`**    | Cierra los folds del anterior nivel |
|     **`zR`**    | Abre todos los folds                |
|     **`zM`**    | Cierra todos los folds              |
| **`[Espacio]`** | Abre y cierra los folds             |


### Tamaño de la Ventana

|                Atajo               | Significado                    |
|:----------------------------------:|--------------------------------|
| **`[Shift] ⇦`** == **`[Shift] h`** | Disminuye el tamaño horizontal |
| **`[Shift] ⇨`** == **`[Shift] i`** | Aumenta el tamaño horizontal   |
| **`[Shift] ⇧`** == **`[Shift] k`** | Disminuye el tamaño vertical   |
| **`[Shift] ⇩`** == **`[Shift] j`** | Aumenta el tamaño vertical     |
|              **`⎵O`**              | Maximiza una ventana           |
|              **`⎵o`**              | Minimiza una ventana           |

### Moverse entre ventanas

|               Atajo              | Significado                                  |
|:--------------------------------:|----------------------------------------------|
| **`[Ctrl] ⇦`** == **`[Ctrl] h`** | Enfoca la ventana de la izquierda            |
| **`[Ctrl] ⇨`** == **`[Ctrl] l`** | Enfoca la ventana de la derecha              |
| **`[Ctrl] ⇧`** == **`[Ctrl] k`** | Enfoca la ventana de arriba                  |
| **`[Ctrl] ⇩`** == **`[Ctrl] j`** | Enfoca la ventana de abajo                   |
|         **`[Ctrl]w R`**          | Para rotar ventanas hacia arriba/izquierda   |
|         **`[Ctrl]w r`**          | Para rotar ventanas hacia abajo/derecha      |

### Mover bloques de texto

|                  Atajo                  | Significado                                          |
|:---------------------------------------:|------------------------------------------------------|
|                 **`>>`**                | Aumenta la sangría de una linea                      |
|                 **`<<`**                | Disminuye la sangría de una linea                    |
|      `[Shift] ⇨` == **`[Shift] l`**     | Aumenta la sangría EN VISUAL MODE                    |
|      `[Shift] ⇦` == **`[Shift] h`**     | Disminuye la sangría EN VISUAL MODE                  |
|  **`[Shift] k`** == **`[Shift] [Up]`**  | Sube un renglón un texto seleccionado EN VISUAL MODE |
| **`[Shift] j`** == **`[Shift] [Down]`** | Baja un renglón un texto seleccionado EN VISUAL MODE |

### Macros

|                Atajo                | Significado                |
|:-----------------------------------:|----------------------------|
|            **`q[Tecla]`**           | Grabar Macro               |
|            **`@[Tecla]`**           | Ejecutar Macro             |
| **`:let @[Letra]='[C-r [Letra]]'`** | Permite modificar la macro |

### Marks

|      Atajo      | Significado                             |
|:---------------:|-----------------------------------------|
|  **`m[Letra]`** | Crea una Marca sobre la linea           |
|  **`'[Letra]`** | Va a la Marca anteriormente creada      |
| **`dm[Letra]`** | Elimina la Marca                        |
|     **`]'`**    | Avanza a la próxima linea con marca     |
|     **`['`**    | Retrocede a la anterior linea con marca |

### Juntar lineas

|   Atajo   | Significado                                                                                  |
|:---------:|----------------------------------------------------------------------------------------------|
|  **`⎵j`** | Agrupa las linea seleccionadas en una linea (agregando un espacio por cada linea que agrupa) |
|  **`⎵J`** | Agrupa las linea seleccionadas en una linea (sin agregar espacios).                          |
| **`⎵gq`** | Separa lineas largas en varias lineas pequeñas                                               |

### Números

|   Atajo  | Significado                                                                                       |
|:--------:|---------------------------------------------------------------------------------------------------|
| **`++`** | Aumenta el valor de un número cercano en la línea o sobre él. Puede ser llamado a distancia[^1]   |
| **`--`** | Disminuye el valor de un número cercano en la línea o sobre él. Puede ser llamado a distancia[^1] |
| **`**`** | Aumenta el valor de números de manera ascendente. Puede ser llamado a distancia[^1]               |
| **`__`** | Disminuye el valor de números de manera ascendente. Puede ser llamado a distancia[^1]             |

### Sort

|     Atajo     | Significado                                              |
|:-------------:|----------------------------------------------------------|
|    **`rr`**   | Ordenar lineas Random                                    |
|  **`:sort`**  | Ordenar lineas alfabéticamente A-Z                       |
|  **`:!sort`** | Ordenar lineas alfabéticamente Z-A                       |
|  **`:sort`**  | Ordenar lineas alfabéticamente y Eliminar las repetidas  |
| **`:sort u`** | Ordena las lineas y elimina aquellas que están repetidas |

### Surround

Para poder rodear la palabra con el caracter deseado, estos atajos utilizan el registro `z` para poder almacenar la información seleccionada, por lo tanto, **se eliminará cualquier contenido que haya en el registro `z`**

|      Atajo     | Significado                                                                 |
|:--------------:|-----------------------------------------------------------------------------|
|    **`ñ(`**    | En visual mode, inserta al inicio un `(` y al final un `)`                  |
|    **`ñ[`**    | En visual mode, inserta al inicio un `[` y al final un `]`                  |
|    **`ñ{`**    | En visual mode, inserta al inicio un `{` y al final un `}`                  |
|    **`ñ'`**    | En visual mode, inserta al inicio un `'` y al final un `'`                  |
| **``` ñ` ```** | En visual mode, inserta al inicio un `` ` `` y al final un `` ` ``          |
|    **`ñc`**    | La misma función que **``` ñ` ```**                                         |
|    **`ñ"`**    | En visual mode, inserta al inicio un `"` y al final un `"`                  |
|    **`ñ)`**    | En visual mode, **lo mismo que `(`**, pero agregando un espacio en el medio |
|    **`ñ]`**    | En visual mode, **lo mismo que `[`**, pero agregando un espacio en el medio |
|    **`ñ}`**    | En visual mode, **lo mismo que `{`**, pero agregando un espacio en el medio |

### Modo Diff (`vimdiff` o `nvim -d`)

| Atajo | Significado                                                       |
|:-----:|-------------------------------------------------------------------|
|   dp  | En modo normal, pone (pasa) las diferencias de un archivo al otro |
|   Dp  | En modo visual, pone (pasa) las diferencias de un archivo al otro |

### Registros - tipos

|      Atajo     | Significado              |
|:--------------:|--------------------------|
|    **`“0`**    | Último Yank              |
| **`”1 al “9`** | Historial de los Deletes |
|    **`“”`**    | Portapapeles             |

### Compilar archivos
#### Mi forma

|    Atajo   | Significado                         |
|:----------:|-------------------------------------|
| **`⎵c `** | Compila el archivo                             |
| **`⎵cc`** | Compila y/o Ejecuta el Archivo Automáticamente |

#### Forma VIM

|             Atajo            | Significado             |
|:----------------------------:|-------------------------|
| **`:compiler [compilador]`** | Establece el compilador |
|          **`:make`**         | Compila el archivo      |

### Otros atajos

|         Atajo        | Significado                                                                               |
|:--------------------:|-------------------------------------------------------------------------------------------|
| **`⎵m`** == **`gu`** | Cambia el texto a minúscula.                                                              |
| **`⎵M`** == **`gU`** | Cambia el texto a mayúsculas                                                              |
|       **`g~`**       | Invierte la mayúscula por minúscula y viceversa                                           |
|       **`⎵,`**       | Limpia el Resaltado de la Búsqueda                                                        |
|       **`⎵.`**       | Establece el directorio actual como el de trabajo                                         |
|       **`''`**       | Vuelve a la ultima linea en donde se encontraba el cursor (con `` va a la columna y fila) |
|       **`F6`**       | Ver cambios del archivo actual                                                            |
|  **`[Shift] [F7]`**  | Volver  a la ventana de edición del archivo                                               |
|       **`g??`**      | Encripta una linea                                                                        |
|      [ACCION]gn      | Salta a la siguiente coincidencia (de la búsqueda) y realizar una operación (Ej.: dgn)    |
|       **`⎵ç`**       | cambia la tecla ç por < y la Ç por >                                                      |
|       **`⎵Ç`**       | Revierte los cambios hecho por **`⎵j`**                                                   |
|       **`⎵d`**       | Elimina lo seleccionado de manera permanente                                              |

## Plugins

### Photos

| Atajo | Significado                                                                                      |
|:-----:|--------------------------------------------------------------------------------------------------|
| [F10] | Con el texto/código **seleccionado**, crea una imagen de presentación con https://carbon.now.sh/ |
| [F10] | Con el archivo abierto, crea una imagen de presentación con https://carbon.now.sh/               |
| [F11] | Con el texto/código **seleccionado**, crea un HTML de presentación                               |
| [F11] | Con el archivo abierto, crea un HTML de presentación                                             |

### Venn

|     Atajo    | Significado                              |
|:------------:|------------------------------------------|
|   **`⎵V`**   | Enciende y apaga a Venn                  |
| **`[HJKL]`** | Sirven para dibujar lineas               |
|    **`f`**   | **En modo visual**, dibuja un rectángulo |

### TableMode (Markdown)

|    Atajo   | Significado                         |
|:----------:|-------------------------------------|
|  **`⎵tm`** | Activa/Desactiva el plugin          |
| **`⎵tdd`** | Elimina Fila                        |
| **`⎵tdc`** | Elimina Columna                     |
| **`⎵tic`** | Inserta Columna después del cursor  |
| **`⎵tiC`** | Inserta Columna antes del cursor    |
|  **`[\|`** | Moverse a la celda de la izquierda  |
|  **`]\|`** | Moverse a la celda de la derecha    |
|  **`{\|`** | Moverse a la celda de arriba        |
|  **`}\|`** | Moverse a la celda de abajo         |
| **`ci\|`** | Ejecuta ‘change’ dentro de la celda |

#### CSV
En un texto separado por comas, se selecciona, se presiona ⎵tt y lo ordena en una tabla

#### Cómo construir una tabla
- Comenzar a construir la tabla (header)
- En una nueva línea, escribiendo **`||`** crea la división entre el header y los registros
- Según la alineación, se pone dos puntos en la barra del header (en la linea creada con **`||`**)

```markdown
| Izquierda | Centrado | Derecha |
|:----------|:--------:|--------:|
| item 1    |  item 2  |  item 3 |
| item 4    |  item 5  |  item 6 |
```
### Telescope

#### Movimientos

|     Atajo     | Significado                          |
|:-------------:|--------------------------------------|
| **`[Ctrl]n`** | Avanza por el historial de búsquedas |
| **`[Ctrl]p`** | Atrasa por el historial de búsquedas |
| **`[Ctrl]j`** | Baja por la lista de coincidencias   |
| **`[Ctrl]k`** | Sube por la lista de coincidencias   |
| **`[Ctrl]h`** | Sube por el texto de ‘preview’       |
| **`[Ctrl]l`** | Baja por el texto de ‘preview’       |
|  **`[Esc]`**  | Sale de Telescope                    |

#### Extensiones/Funciones

|   Atajo   | Significado                                                           |
|:---------:|-----------------------------------------------------------------------|
|  **`⎵z`** | Muestra la lista del autocorregtor (z=)                               |
|  **`⎵b`** | Buscador entre buffers abiertos                                       |
| **`⎵ds`** | Buscador de Archivos Recursivos                                       |
| **`⎵dg`** | Buscador de Archivos Recursivos pero con ripgrep                      |
| **`⎵de`** | Muestra un explorador de archivos                                     |
| **`⎵do`** | Muestra los archivos abiertos recientemente                           |
| **`⎵df`** | Selecciona el tipo de archivo (extención) manualmente (para sintaxis) |
| **`⎵dl`** | Busqueda fuzzy dentro del archivo actual (buffer) por lineas          |
| **`⎵dh`** | Buscador entre las ayudas disponibles de :help de vim                 |
| **`⎵dk`** | Muestra la lista de keymaps                                           |
| **`⎵dd`** | Lista de errores, advertencias y sugerencias del LSP                  |
| **`⎵dt`** | Muestra la lista con variables y funciones que encontró TreeSitter    |
| **`⎵dc`** | Portapapeles                                                          |
| **`⎵dr`** | Cambia el nombre a una variable (de manera inteligente)               |
| **`⎵d/`** | Historial de Comandos                                                 |
| **`⎵dq`** | Muestra la lista de macros grabadas                                   |
| **`⎵dQ`** | Muestra la lista de los registros                                     |

### NvimTree

|    Atajo   | Significado                                                      |
|:----------:|------------------------------------------------------------------|
| **`[F2]`** | Muestra el Árbol de Archivos                                     |
| **`[F3]`** | Muestra el Árbol de Archivos desde la carpeta del archivo actual |

### Hop

|         Atajo         | Significado                                            |
|:---------------------:|--------------------------------------------------------|
| **`⎵f [Dos Letras]`** | Salta entre palabras que comienzen con esas dos letras |
|        **`⎵F`**       | Salta entre todas las palabras                         |

### TagBar

|   Atajo  | Significado                                      |
|:--------:|--------------------------------------------------|
| **`F8`** | Ctags con funciones, clases y variables globales |

### ToggleTerm

|   Atajo  | Significado                            |
|:--------:|----------------------------------------|
| **`⎵x`** | Abre una terminal flotante persistente |
| **`⎵T`** | Abre una terminal vertical persistente |

### Packer

|         Atajo        | Significado                                            |
|:--------------------:|--------------------------------------------------------|
| **`:PackerInstall`** | Instala los plugins no instalados, descritos en .vimrc |
|  **`:PackerClean`**  | Elimina los plugins instalados, no descritos en .vimrc |
|  **`:PackerUpdate`** | Actualiza los Plugins                                  |
| **`:PackerCompile`** | Actualiza el listado de plugins, para instalarlos      |

### Startify

|   Atajo   | Significado                                         |
|:---------:|-----------------------------------------------------|
|  **`b`**  | Abre en la misma pestaña                            |
|  **`s`**  | Lo abre como split horizonal                        |
|  **`v`**  | Lo abre como split vertical                         |
|  **`i`**  | Abre un nuevo buffer (como ‘e’) pero en Insert Mode |
| **`⎵ks`** | Guarda Sesión                                       |
| **`⎵rs`** | Eliminar Sesión                                     |

### ZenMode

|   Atajo  | Significado        |
|:--------:|--------------------|
| **`⎵a`** | Activa el modo Zen |

### Multiple-Cursors

|    Atajo    | Significado                                                           |
|:-----------:|-----------------------------------------------------------------------|
|   **`v`**   | marcar region que se va a buscar                                      |
| **`[C-n]`** | agregue un cursor virtual, seleccionando en la siguiente coincidencia |
|   **`q`**   | elimina el cursor seleccionado                                        |

### Terminal

|   Atajo  | Significado                            |
|:--------:|----------------------------------------|
| **`⎵x`** | Abre una terminal flotante persistente |
| **`⎵X`** | Abre una terminal vertical persistente |

### Git

|     Atajo     | Significado                                                                 |
|:-------------:|-----------------------------------------------------------------------------|
|   **`⎵gl`**   | Git pull                                                                    |
|   **`⎵gs`**   | Ventana de gestión de Git (*)                                               |
|   **`⎵gp`**   | Git Push                                                                    |
|   **`⎵gd`**   | Git Diff                                                                    |
|   **`⎵gb`**   | Muestra quien y cuando escribió la linea y en qué commit                    |
|   **`⎵gB`**   | Muestra el Git Blame del archivo entero                                     |
|   **`⎵gc`**   | Muestra los commits del archivo abierto                                     |
|   **`⎵gc`**   | En **visual mode**, Muestra los commits relacionados a la linea del archivo |
|   **`⎵gC`**   | Muestra los commits del repositorio                                         |
|   **`⎵gr`**   | Muestra los *branches*                                                      |
|    **`]g`**   | Avanza por los cambios del archivo (con git)                                |
|    **`[g`**   | Retrocede por los cambios del archivo (con git)                             |
|  **`:G log`** | Muestra el log de git y muestra los cambios de los commits                  |
|  **`:Gread`** | Es parecido a `:git reset`, pero permite hacer un *undo* con `u`            |
| **`:Gwrite`** | Realiza un `:git add` al archivo entero                                     |

> (*) Comando dentro de la gestión del repositorio...
> - `s`  --> agregar al commit
> - `u`  --> quitar del commit
> - `=`  --> para ver el diff
> - `cc` --> crear un commit

### LSP

|     Atajo     | Significado                                                                 |
|:-------------:|-----------------------------------------------------------------------------|
|    **`+e`**   | Próximo error del Compilador                                                |
|    **`-e`**   | Anterior error del Compilador                                               |
|    **`⎵e`**   | Muestra el error en formato cartel                                          |
| **`[Ctrl]n`** | Llama al autocompletado del LSP                                             |
|    **`gd`**   | Lista las definiciones de la variable/función (con Telescope)               |
|    **`gr`**   | Lista de implementaciones (llamadas) de la variable/función (con Telescope) |
|   **`⎵di`**   | Muestra información del objeto debajo del cursor                            |

### Oil
Se puede modificar los archivos como si fuera un buffer de texto

|   Atajo   | Significado                                  |
|:---------:|----------------------------------------------|
| **`⎵--`** | Abre la carpeta actual en un buffer flotante |
|  **`⎵-`** | Abre la carpeta actual como un buffer        |

### BufferLine

|        Atajo       | Significado                               |
|:------------------:|-------------------------------------------|
| **`⎵b [Flechas]`** | Mueve el buffer por la barra              |
|     **`⎵b e`**     | Acomoda los buffers según su extensión    |
|     **`⎵b d`**     | Acomoda los buffers según sus directorios |

### UndoTree

|   Atajo  | Significado                             |
|:--------:|-----------------------------------------|
| **`F5`** | Para el historial de Undo de un archivo |

### Comment

|   Atajo   | Significado                                             |
|:---------:|---------------------------------------------------------|
| **`gcc`** | Comentar una linea                                      |
| **`gbb`** | Comenta una linea en modo bloque                        |
|  **`gc`** | Comenta la región seleccionada                          |
|  **`gb`** | Comenta la región seleccionada en modo bloque           |
| **`gcO`** | Crea una nueva linea de comentario en la parte superior |
| **`gco`** | Crea una nueva linea de comentario en la parte superior |
| **`gcA`** | Crea un comentario al final de la linea                 |

### DAP

**Si lo que se va a ejecutar es una binario**, se debe COMPILAR CON **`⎵c`** PARA OBTENER UN BINARIO CON 'Debug instructions' QUE PUEDE SER LEÍDO POR EL DAP (Ejemplo de compilación de c: `gcc ej.c -o ej -g`)

#### Mappings

|     Atajo    | Significado                                                                                     |
|:------------:|-------------------------------------------------------------------------------------------------|
| **`[C-s]d`** | Abre y cierra el debugger.                                                                      |
| **`[C-s]b`** | Agrega un breakpoint                                                                            |
| **`[C-s]c`** | Comienza la ejecución                                                                           |
| **`[C-s]n`** | Continúa a la siguiente instrucción                                                             |
| **`[C-s]i`** | Entra dentro de la función que está sobre la línea que se está ejecutando                       |
| **`[C-s]o`** | Sale dentro de la función que se entró con [C-d]i                                               |
| **`[C-s]B`** | Pone un breakpoint, donde **solamente** se frena la ejecución cuando se cumple cierta condición |
| **`[C-s]s`** | Detiene la ejecución del DAP                                                                    |
| **`[C-s]r`** | Resetea el Layout original de la interfaz del DAP                                               |

#### Mappings de las ventanas más importantes

##### Breakpoints (Frena la ejecución)

|  Atajo  | Significado                        |
|:-------:|------------------------------------|
| **`o`** | Se posiciona en el breakpoint      |
| **`t`** | Habilita/Deshabilita el breakpoint |

##### Scopes (Muestra los Scopes y variables)

|     Atajo     | Significado                                    |
|:-------------:|------------------------------------------------|
|    **`e`**    | Edita el valor de la variable                  |
| **`[Enter]`** | Muestra la herencia de la variable             |
|    **`r`**    | Envía la variable a REPL (desconozco utilidad) |

##### Watch (Permite vigilar bajo demanda ciertas variables)

|     Atajo     | Significado                                         |
|:-------------:|-----------------------------------------------------|
| **`[Enter]`** | Muestra la herencia de la variable                  |
|    **`d`**    | Elimina la expresión                                |
|    **`e`**    | Edita la expresión o cambia el valor de la variable |
|    **`r`**    | Envía la variable a REPL (desconozco utilidad)      |

### Neorg
#### Dentro de un archivo de Neorg
##### Tareas
|    Atajo   | Significado    |
|:----------:|----------------|
| **`,t u`** | Undone task    |
| **`,t a`** | Ambiguous task |
| **`,t d`** | Done task      |
| **`,t d`** | Important task |
| **`,t r`** | Recurring task |
| **`,t p`** | Pending task   |
| **`,t h`** | on Hold task   |
| **`,t c`** | Canceled task  |

##### Listas
|    Atajo   | Significado                                                                                                                            |
|:----------:|----------------------------------------------------------------------------------------------------------------------------------------|
|  **`,lt`** | Toggle between ordered and unordered lists block                                                                                       |
| **`,li`** | Toggle for each line between ordered and unordered lists (for when you have combined ordered an unordered lists inside the same block) |

##### Modos
|    Atajo   | Significado                              |
|:----------:|------------------------------------------|
| **`,m h`** | use `j` and `k` to jump between headings |
| **`,m n`** | Normal mode                              |
##### Integración con Telescope
|    Atajo   | Significado                                  |
|:----------:|----------------------------------------------|
| **`,i l`** | Insert a Link to a heading, definition, etc. |
| **`,i f`** | Insert a link to a File                      |
| **`,s l`** | Search between heading, definition, etc.     |
| **`,s f`** | Search between `.norg` files                 |
| **`,s h`** | Search between Headers                       |
| **`,s w`** | Switch between workspaces                    |

##### Otros
|             Atajo             | Significado                                                 |
|:-----------------------------:|-------------------------------------------------------------|
|       **`>>` and `<<`**       | Indent recursively                                          |
|       **`>.` and `<.`**       | Indent NOT recursively, just the line                       |
| **`Ctrl + t` and `Ctrl + d`** | Indent while in insert mode                                 |
|       **`Alt + Enter`**       | if it's in a list (for example) make a new line with a list |
|            **`==`**           | Auto indent line (Accepts range)                            |
|            **`za`**           | Toggle folds                                                |


#### Globales
|   Atajo   | Significado           |
|:---------:|-----------------------|
| **`⎵ n`** | Abre el bloc de notas |


### Mkdnflow (Markdown)
| Atajo                 | Significado                                                                                                                                                                                                       |
| :-----------------:   | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`[Enter]`**         | Abre el link, o crea un link con la palabra SELECCIONADA (puede ser: # Titulo ; una palabra - crea un nuevo archivo markdown -)                                                                                   |
| **`[Enter]`**         | También abre y cierra *folds* el los titulos (headings)                                                                                                                                                           |
| **`[BackSpace]`**     | Cuando entre a un archivo con `[Enter]`, vuelve al archivo anterior                                                                                                                                               |
| **`[Alt] [Enter]`**   | Destruye el link debajo del cursor                                                                                                                                                                                |
| **`[[`** y **`]]`**   | Salta entre los títulos del archivo                                                                                                                                                                               |
| **`[l`** y **`]l`**   | Salta entre los links del archivo                                                                                                                                                                                 |
| **`⎵ [Shift] p`**     | Convierte el texto SELECCIONADO en un link, siendo la dirección el contenido del portapapeles                                                                                                                     |
| **`<F2>`**            | Si el cursor está sobre un link a un archivo, puede moverlo de lugar o cambiar el nombre (si la dirección de la carpeta ingresada no existe, creara la carpeta, pero tiene que reingresar la dirección de vuelta) |
| **`+`** y **`-`**     | Sube y baja el nivel de los títulos (Headings)                                                                                                                                                                    |
| **`⎵ f`**             | Cierra el fold del título (heading) más cercano al cursor                                                                                                                                                         |
| **`⎵ ts`**            | Cambia entre los estados de las tareas (Tasks/ToDos). Si está sobre un párrafo, lo convertirá a tarea. Funciona también en visual mode (Pero no en Line-Visual ni Block-Visual )                                  |
| **`⎵ tf`**            | Formatea (acomoda) las tablas - no me funcionó -                                                                                                                                                                  |
| **`[\|`** y **`]\|`** | Navega entre los campos de una tabla                                                                                                                                                                              |
## Datos útiles

- Si se está el cursor debajo de una palabra y se apreta **`*`**, busca la palabra, y si se presiona **`S/`** Busca y reemplaza el termino.
- En caso de que **el sistema falle o la electricidad se interrumpa**, se puede recuperar los cambios del archivo si abrimos el archivo en el que estábamos así: `nvim -r archivo.txt`. También se puede listar los archivos con `vim –r` y se repite el paso anterior colocando la ruta del archivo temporal con el nombre del `.swp`

## Buffer <-> Tab <-> Session

<!-- <img src="./VIM Buffs Tabs Sessions Cuadro Conseptual - Light.png"> -->
<img src="./VIM Buffs Tabs Sessions Cuadro Conseptual - Dark.png">

---

## Ejemplos de RegEx en Neovim

|          Atajo          | Significado                                                                                |
|:-----------------------:|--------------------------------------------------------------------------------------------|
| **`:s/<\(.*\)>/(\1)/`** | Reemplaza los \<div\> por (div)                                                            |
|     **`/([0-9]*)`**     | Busca por ejemplo: (2), (88), etc.                                                         |
|       **`/^Hola`**      | Busca las lineas que comiencen por 'Hola'. Si contiene, pero no al principio, NO lo cuenta |

[^1]:
    > Con 'a distancia', me refiero a dentro de la misma linea pero fuera de los caracteres, ya que busca los () más cercanos hacia adelante (no funciona en todos los comandos).
    >
    >  Por ejemplo, unos (), donde pueden ser llamados desde afuera, salta hacia ellos y ejecuta la opción. Demostración (| es el cursor), ejecutando `ci"`
    >
    > > Language java |= new Language("Boilerplate code");
    >
    > Quedará...
    >
    > > Language java = new Language("|");
