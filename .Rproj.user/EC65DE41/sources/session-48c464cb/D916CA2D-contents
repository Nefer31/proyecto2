library(R6)

CarroDeFormula1 <- R6Class(
  classname = "CarroDeFormula1",
  inherit = Carro,
  
  public = list(
    VELOCIDADEXTRA = 10,
    
    initialize = function(nombre, numero) {
      super$initialize(nombre, numero)
    },
    
    velocidadMaxima = function(carrera) {
      tipoDePista <- carrera$getTipoDePista()
      
      super$velocidadMaxima()
      if (tipoDePista == "f1") {
        velocidadActual <- private$getVelocidad()
        private$setVelocidad(velocidadActual + VELOCIDADEXTRA)
      }
    }
  )
)
