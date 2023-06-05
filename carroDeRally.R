library(R6)

CarroDeRally <- R6Class(
  classname = "CarroDeRally",
  inherit = Carro,
  
  public = list(
    velocidadExtra = 10,
    
    initialize = function(nombre, numero) {
      super$initialize(nombre, numero)
    },
    
    velocidadMaxima = function(carrera) {
      tipoDePista <- carrera$getTipoDePista()
      
      super$velocidadMaxima()
      if (tipoDePista == "rally") {
        velocidadActual <- private$getVelocidad()
        private$setVelocidad(velocidadActual + velocidadExtra)
      }
    }
  )
)
