# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)
# Use a fluid Bootstrap layout

mydb = dbConnect(MySQL(), user='root', password='raj-12345678', dbname='world', host='localhost')
k = dbGetQuery(mydb,'SELECT * FROM world.serverdata where filename like "/%/%/%/%";')
l = k[,"filename"]


fluidPage(    
  
  # Give the page a title
  titlePanel("Space usage by Directory"),
  
  # Generate a row with a sidebar
  sidebarLayout
  (      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("region", "Directory:", 
                  choices=l),
      hr(),
      helpText("Data from different directories")
    ),
    
    # Create a spot for the barplot
    mainPanel(plotOutput("phonePlot"))
    
  )
)