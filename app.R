library(shiny)
source("carrera.R")
source("campeonato.R")
source("carro.R")
source("carroDeFormula1.R")
source("carroDeRally.R")

# Crear una instancia de la clase Campeonato
miCampeonato <- campeonato$new()

# Define la interfaz gráfica de la aplicación
ui <- fluidPage(
  titlePanel("Campeonato de Carreras"),
  navbarPage(
    "Campeonato",
    tabPanel(
      "Crear Carrera",
      fluidRow(
        column(
          width = 6,
          textInput("nombreCarrera", "Nombre de la carrera:"),
          selectInput("tipoDePista", "Tipo de pista:",
                      choices = c("rally", "f1")),
          actionButton("agregarCarrera", "Agregar carrera")
        )
      ),
      fluidRow(
        column(
          width = 12,
          tableOutput("tablaCarreras")
        )
      ),
      fluidRow(
        column(
          width = 12,
          verbatimTextOutput("mensajeAviso")
        )
      )
    )
  )
)

# Define la lógica de la aplicación
server <- function(input, output, session) {
  
  # Generar datos de ejemplo para la tabla
  datosTabla <- data.frame(
    Carrera = character(),
    TipoDePista = character(),
    stringsAsFactors = FALSE
  )
  
  # Renderizar la tabla
  output$tablaCarreras <- renderTable({
    datosTabla
  })
  
  # Agregar una carrera al hacer clic en el botón "Agregar carrera"
  observeEvent(input$agregarCarrera, {
    nombreCarrera <- input$nombreCarrera
    tipoDePista <- input$tipoDePista
    
    if (nombreCarrera != "" && tipoDePista != "") {
      # Crear una instancia de la clase Carrera
      nuevaCarrera <- Carrera$new(nombre = nombreCarrera, tipoDePista = tipoDePista)
      
      # Agregar la carrera al campeonato
      if (miCampeonato$registrarCarrera(nuevaCarrera)) {
        # Actualizar la tabla
        datosNuevaCarrera <- data.frame(
          Carrera = nuevaCarrera$getNombre(),
          TipoDePista = nuevaCarrera$getTipoDePista(),
          stringsAsFactors = FALSE
        )
        datosTabla <<- rbind(datosTabla, datosNuevaCarrera)
        
        # Mostrar mensaje de éxito
        output$mensajeAviso <- renderText({
          "Carrera agregada correctamente."
        })
      } else {
        # Mostrar mensaje de error
        output$mensajeAviso <- renderText({
          "No se pudo agregar la carrera."
        })
      }
    } else {
      # Mostrar mensaje de error si hay campos vacíos
      output$mensajeAviso <- renderText({
        "Por favor, complete todos los campos."
      })
    }
  })
  
}

# Ejecutar la aplicación
shinyApp(ui = ui, server = server)
