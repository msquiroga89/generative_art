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
  x = quote(runif(4, -4, 4) * x_i^4 - log(sin(y_i^4))),
  y = quote(runif(4, -4, 4) * y_i^4 - log(cos(x_i^4)))
)

my_formula <- list(
  x,
  y = quote(runif(1.005, -1.005, 1.005) * y_i^2.5 - cos(x_i^4))
)

set.seed(18222)
generativeart::generate_img(formula = my_formula, nr_of_img = 1, polar = TRUE, color = "ghostwhite", background_color = "darkslateblue")

set.seed(122)
generativeart::generate_img(formula = my_formula, nr_of_img = 1, polar = FALSE, color = "ghostwhite", background_color = "darkslateblue")

my_formula <- list(
  x = quote(runif(1, -50, 20) * x_i^3 + sin(pi/2)),
  y = quote(runif(20, -5, 20) * y_i^5 - cos(pi*2))
)

set.seed(5867)
generativeart::generate_img(formula = my_formula, nr_of_img = 1, polar = FALSE, color = "ghostwhite", background_color = "palegreen4")


my_formula <- list(
  x = quote(runif(1.5, -2.5, 3.5) * x_i^2 - cos(y_i^2) + sin(y_i^4)),
  y = quote(runif(1.9, -2.9, 3.9) * y_i^3 - sin(x_i^4) + cos(y_i^2)))


generativeart::generate_img(formula = my_formula, nr_of_img = 5, polar = TRUE, color = "slategray2", background_color = "royalblue4")

a <- rnorm(1500, mean = 6, sd = 65)
b <- rnorm(1500, mean = 7, sd = 12)
c <- rnorm(1500, mean = 10, sd = 2)
d <- rnorm(1500, mean = 10, sd = 2)

df <- data.frame(a, b, c, d)

ggplot_themed <- function(data) {
  data %>% 
    ggplot(aes(x, y)) +
    coord_equal() + 
    scale_size_identity() + 
    scale_colour_identity() + 
    scale_fill_identity() + 
    theme_void() 
  }

df %>% 
  ggplot_themed()+
  geom_line(aes(a, b, size = 0.5))+
  geom_line(aes(log(c), log(d+c), color = "red"))+
  coord_polar()
