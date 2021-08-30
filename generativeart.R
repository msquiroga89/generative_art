# https://github.com/cutterkom/generativeart
# devtools::install_github("cutterkom/generativeart")
library(generativeart)


IMG_DIR <- "img/"
IMG_SUBDIR <- "everything/"
IMG_SUBDIR2 <- "handpicked/"
IMG_PATH <- paste0(IMG_DIR, IMG_SUBDIR)

LOGFILE_DIR <- "logfile/"
LOGFILE <- "logfile.csv"
LOGFILE_PATH <- paste0(LOGFILE_DIR, LOGFILE)

# create the directory structure
generativeart::setup_directories(IMG_DIR, IMG_SUBDIR, IMG_SUBDIR2, LOGFILE_DIR)


my_formula <- list(
  x = quote(runif(4, -4, 4) * x_i^4 - sin(y_i^4)),
  y = quote(runif(4, -4, 4) * y_i^4 - cos(x_i^4))
)

generativeart::generate_img(formula = my_formula, nr_of_img = 5, polar = TRUE, color = "black", background_color = "white")

