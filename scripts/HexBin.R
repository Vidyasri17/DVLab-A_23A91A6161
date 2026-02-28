# Load & Understand the Dataset
library(ggplot2)
data(diamonds)
# data(package = .packages(all.available = TRUE))
str(diamonds)
dim(diamonds)
?diamonds
# Very basic scatter
plot(diamonds$carat, diamonds$price)
# Improved scatter
plot(diamonds$carat, diamonds$price, col = rgb(0, 0, 1, 0.1), pch = 16,
     main = "Scatter Plot: Carat vs Price")
# Hexbin using base R
install.packages('hexbin')
library(hexbin)
hb <- hexbin(diamonds$carat, diamonds$price, xbins = 20)
plot(hb, main = "Hexbin Plot")
# Basic Hexbin
ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_hex()
# Labeled Hexbin Plot
ggplot(diamonds, aes(carat, price)) + 
  geom_hex() + 
  labs(title = "Hexagon Binning: Diamond Structure", x = "Carat", y = "Price") + 
  theme_gray()
# Control Hexagon density
ggplot(diamonds, aes(carat, price)) + geom_hex(bins = 15) + theme_minimal()
# Add color palette (Gradient)
ggplot(diamonds, aes(carat, price)) + 
  geom_hex(bins = 20) + 
  scale_fill_gradient(low = 'lightgreen', high = 'maroon') + 
  theme_minimal()
# Color Meaning --- Light -> Fewer, dark -> Dense Region
# Professional Palette (viridis)
ggplot(diamonds, aes(carat, price)) + 
  geom_hex(bins = 35) + 
  scale_fill_viridis_c() + 
  theme_grey()
# Professional Palette(viridis)
ggplot(diamonds, aes(carat, price)) + 
  geom_hex(bins = 35) + 
  scale_fill_viridis_c() + 
  theme_minimal()
# Add Legend Title
ggplot(diamonds, aes(carat, price)) + 
  geom_hex(bins = 20) + 
  scale_fill_viridis_c(name = "Count") + 
  labs(title = "Density Structure of Diamonds", x = "Carat", y = "Price") + 
  theme_minimal()
# Faceted Hexbin
ggplot(diamonds, aes(carat, price)) + 
  geom_hex() + 
  scale_fill_viridis_c() + 
  facet_wrap(~cut) + 
  theme_minimal()
