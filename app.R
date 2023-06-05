source("campeonato.R")
source("carrera.R")
source("carro.R")
source("carroDeRally.R")
source("carroDeFormula1.R")
library(glue)

  # Variable global para indicar si se creó una carrera exitosamente
  carrera_creada <- FALSE
  campeonato1 <- Campeonato$new()
 
   # Función para procesar los comandos del usuario
   procesar_comando <- function(comando) {
         carrera_agregada <- FALSE
         
           # Comando: crear carrera
           if (comando == "crear carrera") {
               nombre <- readline("Ingresa el nombre de la carrera: ")
               tipoDePista <- tolower(as.character(readline("Ingresa el tipo de pista (f1/rally): ")))
               arreglo <- NULL
               
                 nuevaCarrera <- Carrera$new(nombre, tipoDePista)
                 carrera_agregada <- campeonato1$agregarCarrera(nuevaCarrera)
                 
                   if (carrera_agregada) {
                       cat("Carrera agregada correctamente.\n")
                     }
               }
         
           # Comando: crear auto
           if (comando == "crear auto") {
             
               nombre <- readline("Ingresa el nombre del auto: ")
               numeroCarro <- as.numeric(readline("Ingresa el número de carro: "))
               tipoCarro <- as.character(readline("Ingresa el tipo de carro (0 - Rally, 1 - Fórmula 1, 2 - Normal): "))
               
               if (tipoCarro == "0") {
                 
                 traccion <- as.numeric(readline("ingrese un numero de 1 - 20: "))
                 nuevoCarro <- CarroDeRally$new(nombre, numeroCarro, traccion)
                 
               } else if (tipoCarro == "1") {
                 
                 velocidadEnLinea <- as.numeric(readline("ingrese un numero de 1 - 20: "))
                 nuevoCarro <- CarroDeFormula1$new(nombre, numeroCarro, velocidadEnLinea)
                 
               } else {
                 nuevoCarro <- Carro$new(nombre, numeroCarro)
               }
               
                 autoagregadoCorretamente <- campeonato1$inscribirAuto(nuevoCarro)
                 
                 if(autoagregadoCorretamente){
                   cat("Auto creado exitosamente.\n")
                 }
               }
         
           # Comando: ver carreras
           if (comando == "ver carreras") {
               carreras <- campeonato1$getCarreras()
               
                 if (length(carreras) > 0) {
                     cat("Carreras:\n")
                     for (carrera in carreras) {
                         cat("Nombre: ", carrera$getNombre(), ", Tipo de pista: ", carrera$getTipoDePista(), "\n")
                       }
                   } else {
                       cat("No hay carreras registradas.\n")
                     }
           }
         
         # Comando: ver autos
         if (comando == "ver autos") {
           carros <- campeonato1$getAutos()
           
           if (length(carros) > 0) {
             cat("Carros inscritos:\n")
             for (carro in carros) {
               cat("Nombre: ", carro$getNombre(), ", Número: ", carro$getNumero(), "\n")
             }
           } else {
             cat("No hay carros inscritos.\n")
           }
         }
         
         # Añadir el nuevo comando en la función `procesar_comando`
         if (comando == "iniciar carreras") {
           campeonato1$iniciarCarreras()
           carreras <- campeonato1$getCarreras()
           
           if (length(carreras) > 0) {
             
             cat("Iniciando todas las carreras...\n")
             
             for (carrera in carreras) {
               cat("Carrera '", carrera$getNombre(), "' iniciada.\n")
             }
             
           } else {
             cat("No hay carreras registradas.\n")
           }
         }
         
         # Comando: mostrar resultados
         if (comando == "mostrar resultados") {
           campeonato1$mostrarResultados()
           carreras <- campeonato1$getCarreras()
           
           if (length(carreras) > 0) {
             cat("Resultados:\n")
             for (carrera in carreras) {
               cat("Carrera: ", carrera$getNombre(), ", Tipo de pista: ", carrera$getTipoDePista(), "\n")
               carros <- campeonato1$getAutos()
               
               cat("Carros:\n")
               for (carro in carros) {
                 cat("Nombre: ", carro$getNombre(), ", Puntos: ", carro$getPuntos(), "\n")
               }
               
               cat("\n")
             }
           } else {
             cat("No hay carreras registradas.\n")
           }
         }
         
          # Comando: salir
         if (comando == "salir") {
            cat("¡Hasta luego!\n")
             return(FALSE)  # Finaliza el programa
           }
       
        return(TRUE)  # Continúa ejecutando el programa
  }
   
      # Función para ejecutar el programa
     ejecutar_programa <- function() {
         cat("Bienvenido a la simulación de Carrera.\n")
        cat("Puedes crear una carrera para el campeonato o un auto para la carrera.\n")
         cat("Ingresa 'crear carrera' para crear una carrera.\n")
         cat("Ingresa 'crear auto' para crear un auto.\n")
       cat("Ingresa 'ver carreras' para ver la lista de carreras del programa.\n")
       cat("Ingresa 'ver autos' para ver la lista de autos del programa.\n")
       cat("Ingresa 'iniciar carreras' para iniciar todas las carreras del programa.\n")
       cat("Ingresa 'mostrar resultados' para mostrar los resultados de todas las carreras.\n")
       cat("Ingresa 'salir' para salir del programa.\n")
       
       seguir_ejecutando <- TRUE
      
    while (seguir_ejecutando) {
        comando <- tolower(readline("> "))
     seguir_ejecutando <- procesar_comando(comando)
}
}

# Ejecutar el programa principal
ejecutar_programa()

