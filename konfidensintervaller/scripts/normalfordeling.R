library(ggplot2)


# Shading from x = -1 to x = 1 (within one std deviation):

dnorm_one_sd <- function(x){
  norm_one_sd <- dnorm(x)
  # Have NA values outside interval x in [-1, 1]:
  norm_one_sd[x <= -1.959964 | x >= 1.959964] <- NA
  return(norm_one_sd)
}

xvalues <- data.frame(x = c(-3, 3))
plot <- ggplot(xvalues)#, aes(x = xvalues))
plot + stat_function(fun = dnorm) + # xlim(c(-4, 4))+ 
  stat_function(fun = dnorm_one_sd, geom = "area", fill = "blue", alpha = 0.3)+
  scale_x_continuous(
    breaks = c(-1.959964, 0, 1.959964),
    limits=c(-4,4)) +
  geom_text(x = 0, y = 0.05, size = 4, fontface = "bold",
            label = paste0("<---------------------------- 95% ---------------------------->"))

qnorm(0.975)

