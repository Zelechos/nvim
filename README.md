# Welcome to The Vim Project

## Ubicacion donde debe estar el repositorio para aplicar y gestionar cambios
------------------------------------------------------
En Windows:

La ruta de configuración en Windows suele ser:

```
    C:\Users\<tu-usuario>\AppData\Local\nvim\init.vim
```
Para Lua, podrías tener un archivo:

```
    C:\Users\<tu-usuario>\AppData\Local\nvim\init.lua
```
## Plugins Actualmente intalados: 
------------------------------------------------------

    ● cmp-buffer 17.67ms  nvim-cmp
    ● cmp-cmdline 5.27ms  nvim-cmp
    ● cmp-git 0.28ms  nvim-cmp
    ● cmp-nvim-lsp 5.28ms  nvim-cmp
    ● cmp-path 4.76ms  nvim-cmp
    ● cmp_luasnip 9.53ms  nvim-cmp
    ● gitsigns.nvim 25.31ms  start
    ● lazy.nvim 20.19ms  init.lua
    ● lua-async-await 1.47ms  nvim-java
    ● lualine.nvim 3.46ms  start
    ● LuaSnip 15.86ms  start
    ● mason.nvim 7.6ms  nvim-lspconfig
    ● neodev.nvim 0.15ms  nvim-lspconfig
    ● nui.nvim 1.85ms  nvim-java
    ● nvim-autopairs 0.28ms  nvim-cmp
    ● nvim-cmp 53.09ms  VeryLazy
    ● nvim-dap 2.57ms  nvim-java
    ● nvim-java 47.14ms 󰢱 java  nvim-lspconfig
    ● nvim-java-core 1.57ms  nvim-java
    ● nvim-java-dap 1.7ms  nvim-java
    ● nvim-java-refactor 1.57ms  nvim-java
    ● nvim-java-test 2.22ms  nvim-java
    ● nvim-lspconfig 146.23ms  start
    ● nvim-treesitter 60.86ms  VeryLazy
    ● nvim-treesitter-textobjects 21.03ms  nvim-treesitter
    ● nvim-web-devicons 3.2ms  lualine.nvim
    ● plenary.nvim 6.14ms  telescope.nvim
    ● spring-boot.nvim 2.14ms  nvim-java
    ● telescope-file-browser.nvim 11.76ms  telescope.nvim
    ● telescope.nvim 34.09ms  VeryLazy
    ● vim-enfocado 20.92ms  start


## Movimientos y comandos basicos de Vim
------------------------------------------------------
Ingresar a modo de Escritura & tambien para empezar a escribir en el inicio de una palabra

```properties
 press key -> [i]

 sometimes key -> [i] 
 
```
Ingresar a modo Visual (modo que se usar usualmente para seleccionar texto)

```properties
press key -> [v]

```
Para ingresar al modo Visual Line (el mismo modo solo que selecciona por linea)

```properties
press keys -> [shift] + [v]

```
Como salir de VIM 

```properties 
 press keys -> [:q] 
 press keys -> [:q!]

```
Como guardar tus cambios

```properties
press key -> [:w]

```
Como guardar tus cambios y salir de vim al mismo tiempo 

```properties
 press keys -> [:wq]

```
Cursor de teclas

```properties
press key -> [k] to up

press key -> [j] to down

press key -> [h] to left

press key -> [l] to right

```
Para navegar grandes distancias con el cursor sobre con las teclas 

```properties
press keys -> [any number] + [key action] for example [j],[k],[h],[l],etc

```
Para Escribir despues de una letra a una palabra

```properties
press key -> [a]

```
Para Escribir al final de la linea

```properties
press keys -> [shift] + [a]

```
Para Escribir con un salto de linea el primer caracter en la siguiente linea

```properties
press key [o]

```

## Movimientos de cursor entre palabras
------------------------------------------------------
Para saltar a la primera letra de cada palabra para adelante

```properties
press key -> [w]

```
Para salta a la primera letra de cada palabra hacia atras

```properties
press key -> [b]

```
Para saltar a la ultima letra de cada palabra hacia adelante

```properties
press key -> [e]

```

## Movimientos de cursor verticales
------------------------------------------------------
Para saltar a la primer linea del archivo

```properties
press keys [g] + [g]

```
Para saltar a la ultima linea del archivo

```properties
press keys [shift] + [g]

```
Para saltar a un numero de linea especifico

```properties
press keys -> [line number] + [shift] + [g]

```
Para saltar un parrafo hacia arriba

```properties
press keys -> [shift] + [h]

```
Para saltar un parrafo al medio

```properties
press keys -> [shift] + [m]

```
Para saltar un parrafo hacia abajo

```properties
press keys -> [shift] + [l]

```
## Eliminacion de texto y sus diferentes variaciones
------------------------------------------------------
Para eliminar texto caracter por caracter

```properties
press key -> [x]

```
Para eliminar una palabra completa

```properties
press keys -> [d] + [w]

```
Para eliminar una linea desde la posicion del cursor para adelante

```properties
press keys -> [d] + [shift] + [4]

```
Para eliminar para adelante una palabra

```properties 
press keys -> [d] + [e]

```
Para eliminar para adelante la palabra y el espacio para llegar a la siguiente palabra
    
```properties
press keys -> [d] + [w]

```
Para eliminar para atras una palabra

```properties
press keys -> [d] + [b]

```
Para eliminar con movimientos de cursor

```properties
press keys -> [d] + [h] to delete one character to left
press keys -> [d] + [l] to delete one character to right

```
Para eliminar con numeros agregando movientos de cursor ya conocidos

```properties
press keys -> [d] + [<any number] + [w]
press keys -> [d] + [<any number] + [e]
press keys -> [d] + [<any number] + [b]
press keys -> [d] + [<any number] + [h]
press keys -> [d] + [<any number] + [l]

```
Para eliminar una linea completamente

```properties
press keys -> [d] + [d]

```
## Para volver atras y adelante en el buffer osea historial de navegacion de archivos
------------------------------------------------------
Para seleccionar todas la definiciones o aparaciones de una cadena en el archivo

```properties
press keys -> [g] + [d]

```
Para ir a la referencia de un text hacia otro archivo en si para ir al archivo de donde esta la referencia

```properties
position the cursor in the string &
press keys -> [g] + [f]
for go to reference in other file

```
Para volver atras en el buffer osea historial de navegacion de archivos

```properties
position the cursor in the string &
press keys -> [ctrl] + [o]
for go to declaration of your reference

```
Para volver adelante en el buffer osea historial de navegacion de archivos
                    
```properties
press keys -> [ctrl] + [i]

```
## Deshacer y Rehacer cambios
------------------------------------------------------
Para deshacer los cambios anteriormente ejecutados osea hace un "undo"

```properties
press key -> [u]

```
Para reahacer los cambios efectuados osea hacer un "redo"

```properties
press keys -> [ctrl] + [r]

```
## Para pegar textos
------------------------------------------------------
Para pegar lo cortado o copiado en la linea de abajo

```properties
press key -> [p]

```
Para pegar lo cortado o copiado en la linea de arriba

```properties
press key -> [shift] + [p]

```
## Para reemplazar caracteres y el operador de cambio
------------------------------------------------------
Para reemplazar un caracter por otro

```properties
press key -> [r] + [any character]

```
Para cambiar una palabra conbinando la posicion del cursor con movimientos 

```properties
press keys -> [c] + [w]
press keys -> [c] + [e]
press keys -> [c] + [b]

```
Para cambiar una palabra directamente sin importar la posicion del curso

```properties
press keys -> [c] + [i] + [w]

```
## Para buscar una palabra en todo el archivo
------------------------------------------------------
Para buscar una palabra desde el cursor para abajo

```propeties 
press keys -> [/] + [string to search]
```
Para buscar una palabra en todo el archivo

```propeties 
press keys -> [?] + [string to search]

```
Para navegar entre las ocurrencias

```properties 
press keys -> [enter] + [n]

```

## Para navegar entre parentesis, corchetes, llaves
------------------------------------------------------
Para navegar entre el final y principio de llaves, parentesis, corchetes 

```propeties 
press keys -> [shift] + [5] = [%]
```
## Para reeemplazar la ocurrencias de una cadena con otra 
------------------------------------------------------
Para reemplazar la primera ocurrencia que detecte en la linea

```propeties 
in normal mode
press keys -> [:s] + [/] + [string to replace] + [/] + [string to change] 
```
Para reemplazar todas las ocurrencias que encuentre en el archivo 

```propeties 
in normal mode
press keys -> [:s] + [/] + [string to replace] + [/] + [string to change] + [g] 
```

