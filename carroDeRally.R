library(R6)

CarroDeRally <- R6Class(
  classname = "CarroDeRally",
  inherit = Carro,
  
  public = list(
    traccion = 10,
    
    initialize = function(nombre, numero, traccion) {
      super$initialize(nombre, numero)
      self$traccion <- traccion
    },
    
    velocidadMaxima = function(carrera) {
      tipoDePista <- carrera$getTipoDePista()
      super$velocidadMaxima()
      velocidadActual <- private$getVelocidad()
      
      if (tipoDePista == "rally") {
        private$setVelocidad(velocidadActual + self$traccion)
      }else{
        private$setVelocidad(velocidadActual - self$traccion)
      }
    }
  )
)
