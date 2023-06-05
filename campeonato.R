campeonato <- R6Class(
  classname = "campeonato",
  
  private = list(
    carreras = NULL,
    autos = NULL
  ),
  
  public = list(
    initialize = function() {
      private$carreras <- list()
      private$autos <- list()
    },
    
    inscribirAuto = function(carro) {
      if (!(carro %in% private$autos)) {
        private$autos <- c(private$autos, carro)
        return(TRUE)
      }
      return(FALSE)
    },
    
    registrarCarrera = function(carrera) {
      if (!(carrera %in% private$carreras)) {
        private$carreras <- c(private$carreras, carrera)
        return(TRUE)
      }
      return(FALSE)
    },
    
    iniciarCarreras = function() {
      for (i in seq_along(private$carreras)) {
        private$carreras[[i]]$iniciarCarrera()
      }
    },
    
    terminarCarrera = function() {
      for (i in seq_along(private$carreras)) {
        private$carreras[[i]]$registrarCarrera()
      }
    },
    
    getCarreras = function() {
      private$carreras
    },
    
    getCarros = function() {
      private$autos
    },
    
    buscarCarro = function(nombreDelCarro) {
      for (i in seq_along(private$autos)) {
        if (nombreDelCarro == private$autos[[i]]$getNombre()) {
          return(private$autos[[i]])
        }
      }
      return(NULL)
    }
  )
)
