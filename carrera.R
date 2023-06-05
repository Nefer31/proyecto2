library(R6)

Carrera <- R6Class(
  classname = "Carrera",
  
  private = list(
    carros = NULL,
    nombre = NULL,
    tipoDePista = NULL
  ),
  
  public = list(
    initialize = function(nombre, tipoDePista) {
      if (tipoDePista %in% c("rally", "f1")) {
        private$nombre <- nombre
        private$tipoDePista <- tipoDePista
        private$carros <- list()
      } else {
        stop("Tipo de pista inválido. Debe ser 'rally' o 'f1'.")
      }
    },
    
    setNombre = function(nombre) {
      private$nombre <- nombre
    },
    
    getNombre = function() {
      return(private$nombre)
    },
    
    setTipoDePista = function(tipoDePista) {
      if (tipoDePista %in% c("rally", "f1")) {
        private$tipoDePista <- tipoDePista
      } else {
        stop("Tipo de pista inválido. Debe ser 'rally' o 'f1'.")
      }
    },
    
    getTipoDePista = function() {
      return(private$tipoDePista)
    },
    
    agregarCarro = function(carro) {
      if (!(carro %in% private$carros)) {
        private$carros <- c(private$carros, carro)
      }
    },
    
    iniciarCarrera = function() {
      
      for (i in seq_along(private$carros)) {
        private$carros[[i]]$velocidadMaxima()
      }
      
      ordenCarros <- order(sapply(private$carros, function(carro) carro$getVelocidad()), decreasing = TRUE)
      
      for (i in seq_along(private$carros)) {
        private$carros[[ordenCarros[i]]]$setPosicion(i)
      }
    },
    
    registrarCarrera = function() {
      puntos <- c(25, 18, 15, 12, 10, 8, 6, 4, 2)
      
      for (i in seq_along(private$carros)) {
        posicion <- i
        if (posicion <= length(puntos)) {
          private$carros[[i]]$setPuntos(puntos[posicion])
        } else {
          private$carros[[i]]$setPuntos(0)
        }
      }
    },
    
    equals = function(otherCarrera) {
      if (is(otherCarrera, "Carrera")) {
        return(private$nombre == otherCarrera$getNombre())
      }
      return(FALSE)
    },
    
    getCarros = function() {
     private$carros
    }
  )
)
