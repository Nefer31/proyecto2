library(R6)

Carro <- R6Class(
  classname = "Carro",
  
  private = list(
    nombre = NULL,
    numero = NULL,
    posicion = 0,
    puntos = 0,
    velocidad = NULL
  ),
  
  public = list(
    initialize = function(nombre, numero) {
      private$nombre <- nombre
      private$numero<- numero 
    },
    
    randomNumber = function(min, max) {
      return(floor(runif(1, min = min, max = max + 1)))
    },
    
    velocidadMaxima = function() {
        numeroRandom <- self$randomNumber(1, 100)
        private$setVelocidad(numeroRandom)
    },
    
    setNombre = function(nombre) {
      private$nombre <- nombre
    },
    
    getNombre = function() {
      return(private$nombre)
    },
    
    setPosicion = function(posicion) {
      private$posicion <- posicion
    },
    
    getPosicion = function() {
      return(private$posicion)
    },
    
    setPuntos = function(puntos) {
      private$puntos <- private$puntos+puntos
    },
    
    getPuntos = function() {
      return(private$puntos)
    },
    
    setVelocidad = function(velocidad) {
      private$velocidad <- velocidad
    },
    
    getVelocidad = function() {
      return(private$velocidad)
    },
    
    setNumero = function(numero) {
      private$numero <- numero
    },
    
    getNumero = function() {
      return(private$numero)
    },
    
    equals = function(obj) {
      return(
        inherits(obj, "Carro") &&
          private$nombre == obj$getNombre() || private$numero == obj$getNumero()
      )
    }
  )
)
