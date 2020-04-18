# function to check if packages are installed and promt user for iinstall if not
# decides for ALL packages

install_required_packages <- function(required,
                                      fun.name = "Function")
{
  if(
    !all(required %in% installed.packages())
  ){
    missing <- required[!required %in% installed.packages()]
    response <- readline(prompt=cat("These required packages are missing:\n", missing, "\nDo you wish to install? [Y/N] "))
    if(response %in% c("y", "Y")){
      install.packages(missing)
      cat("\nRequired packages installed!\n\n")
    } else {
      stop(paste(fun.name, "interrupted. Required packages not installed. \n"), call. = FALSE)
    }
  }
}