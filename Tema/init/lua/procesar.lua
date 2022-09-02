-- Instrucciones para ejecutar:
--    exe("[Comando de Terminal a Ejecutar]", 1, 1) --> Se ejecuta el comando en la terminal, imprimiendo el tiempo
--    exe("[Comando de Terminal a Ejecutar]", 1)    --> Se ejecuta el comando en la terminal
--    exe("[Comando de Terminal a Ejecutar]")       --> Se ejecuta el Comando como texto
local function exe (command, vert_term, time)
  if vert_term ~= nil and vert_term ~= 0 then
    command = "term "..command
  else
  if time ~= nil  and time ~= 0 then
    command = "time "..command
  end
    command = "!"..command
  end

  vim.api.nvim_command(command)
end

local Compile = {
    ['c'] = function()
        exe("gcc '%' -o '%<'")
    end,

    ['cpp'] = function()
        exe("g++ '%' -o '%<'")
    end,

    ['java'] = function()
        if(isfile("build.xml")) then
          exe("ant compile")
        else
          exe("javac '%'")
        end
    end,

    ['rust'] = function()
        exe("cargo build --manifest-path='%':p:h:h/Cargo.toml")
    end,

    ['go'] = function()
        exe("go build '%<'")
    end,

    ['markdown'] = function()
        -- exe("pandoc '%' -o '%<'.pdf")
        exe("markdown '%' > '%<'.html")
    end

}

local CompileAndRun = {
    ['c'] = function()
        Procesar("compilar", 1)
        exe("'%<'", 1)
    end,

    ['cpp'] = function()
        Procesar("compilar", 1)
        exe("'%<'", 1)
    end,

    ['lua'] = function()
        vim.cmd "so %"
    end,

    ['rust'] = function()
        Procesar("compilar", 1)
        exe("cargo run --manifest-path='%':p:h:h/Cargo.toml", 1)
    end,

    ['java'] = function()
        if(isfile("build.xml")) then
          exe("ant run")
        else
          Procesar("compilar", 1)
          exe("java '%<'", 1)
        end
    end,

    ['sh'] = function()
        exe("bash '%'", 1)
    end,

    ['python'] = function()
        exe("python3 '%'", 1)
    end,

    ['javascript'] = function()
        exe("node '%'", 1)
    end,

    ['html'] = function()
        exe("chromium '%' &")
        exe("firefox '%'")
        exe("firefox-esr '%'")
    end,

    ['tex'] = function()
        exe("pdflatex --output-directory='%':p:h '%'")
    end,

    ['go'] = function()
        Procesar("compilar", 1)
        exe("time go run '%'", 1)
    end,

    ['text'] = function()
        exe("echo 'words : ' && wc -w % && echo 'lines : ' && wc -l '%' && echo 'size : ' && du -h '%'")
    end,

    ['markdown'] = function()
        Procesar("compilar", 1)
        -- exe("xdg-open '%<'.pdf")
        exe("%<.html")
    end,
  }

function Procesar (tipo, guardar)
  if guardar == nil then
    vim.cmd "w"
  end
  if tipo == "compilar" then
    local obj = Compile[vim.bo.filetype]
    if obj then
      obj()
    else
      print("Todavía no se ha programado la compilación de esta extensión")
      return 1;
    end
  elseif tipo == "ejecutar" then
    local obj = CompileAndRun[vim.bo.filetype]
    if obj then
      obj()
    else
      print("Todavía no se ha programado la compilación ni la ejecución de esta extensión")
      return 1;
    end
  else
    print("Ha ingresado una opcion incorrecta")
    return 1;
  end
end
