library(R6)

CarroDeFormula1 <- R6Class(
  classname = "CarroDeFormula1",
  inherit = Carro,
  
  public = list(
    velocidadEnLinea = NULL,
    
    initialize = function(nombre, numero, velocidadEnLinea) {
      super$initialize(nombre, numero)
      self$velocidadEnLinea <- velocidadEnLinea
    },
    
    velocidadMaxima = function(carrera) {
      tipoDePista <- carrera$getTipoDePista()
      super$velocidadMaxima()
      velocidadActual <- private$getVelocidad()
      
      if (tipoDePista == "f1") {
        private$setVelocidad(velocidadActual + self$velocidadEnLinea)
      }else{
        private$setVelocidad(velocidadActual - self$velocidadEnLinea)
      }
    }
  )
)
