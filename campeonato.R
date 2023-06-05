library(R6)

Campeonato <- R6Class(
  classname = "Campeonato",
  
  private = list(
    carreras = NULL
  ),
  
  public = list(
    autos = NULL,
    
    initialize = function() {
      private$carreras <- NULL
      self$autos <- NULL
    },
    
    inscribirAuto = function(auto) {
      for (i in seq_along(self$autos)) {
        if (self$autos[[i]]$equals(auto)) {
          cat("El auto ya está inscrito en el campeonato.\n")
          return(FALSE)
        }
      }
      self$autos <- c(self$autos, auto)
      return(TRUE)
    },
    
    agregarCarrera = function(carrera) {
      for (i in seq_along(private$carreras)) {
        if (private$carreras[[i]]$equals(carrera)) {
          cat("La carrera ya existe en el campeonato.\n")
          return(FALSE)
        }
      }
      private$carreras <- c(private$carreras, carrera)
      return(TRUE)
    },
    
    iniciarCarreras = function() {
      for (i in seq_along(private$carreras)) {
        private$carreras[[i]]$iniciarCarrera()
      }
    },
    
    mostrarResultados = function() {
      for (i in seq_along(private$carreras)) {
        private$carreras[[i]]$registrarCarrera()
      }
    },
    
    getCarreras = function() {
      private$carreras
    },
    
    getAutos = function() {
      self$autos
    }
  )
)
