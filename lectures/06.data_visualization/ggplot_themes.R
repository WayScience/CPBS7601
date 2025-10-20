library(ggplot2)

# Set a custom theme, to increase readability of plots
custom_ggplot_theme <- theme_bw() + theme(
    axis.text = element_text(size = 13),
    axis.title = element_text(size = 15),
    legend.text = element_text(size = 13),
    legend.title = element_text(size = 15),
    strip.text = element_text(size = 15)
)
