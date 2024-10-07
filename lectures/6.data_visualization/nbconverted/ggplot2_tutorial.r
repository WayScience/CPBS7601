# Load necessary packages
library(dplyr)
library(ggplot2)
library(ggrepel)
library(patchwork)

# Load a built-in dataset
data("iris")
head(iris)

# Set a custom theme, to increase readability of plots
custom_ggplot_theme <- theme_bw() + theme(
    axis.text = element_text(size = 13),
    axis.title = element_text(size = 15),
    legend.text = element_text(size = 13),
    legend.title = element_text(size = 15),
    strip.text = element_text(size = 15)
)

# Scatter plot of engine displacement vs highway miles per gallon
(
  ggplot(data = iris, aes(x = Sepal.Length, y = Petal.Width))
  + geom_point()
  + custom_ggplot_theme
)

# Scatter plot with color mapped to species
(
  ggplot(
    data = iris,
    aes(
      x = Sepal.Length,
      y = Petal.Width,
      color = Species,
      size = Sepal.Width
      )
    )
  + geom_point()
  + custom_ggplot_theme
)

# Certain decisions for mapping variables to visual elements are less effective
# Take, for example, mapping species to a shape, or size, instead
# Scatter plot with color mapped to species
(
  ggplot(
    data = iris,
    aes(
      x = Sepal.Length,
      y = Petal.Width,
      shape = Species
      )
    )
  + geom_point()
  + custom_ggplot_theme
)

(
  ggplot(
    data = iris,
    aes(
      x = Sepal.Length,
      y = Petal.Width,
      size = Species
      )
    )
  + geom_point()
  + custom_ggplot_theme
)

# You can also use facets to add a layer of complexity without trading off understanding.
(
  ggplot(
    data = iris,
    aes(
      x = Sepal.Length,
      y = Petal.Width,
      color = Sepal.Width
      )
    )
  + geom_point()
  + facet_grid("~Species")
  + scale_color_gradient(low = "pink", high = "purple")
  + custom_ggplot_theme
)


# Choosing different colors impacts interpretability of the data
(
    ggplot(
        data = iris,
        aes(
            x = Sepal.Length,
            y = Petal.Width,
            color = Species
            )
        )
    + geom_point()
    + scale_color_manual(
        values = c(
            "setosa" = "lightgrey",
            "versicolor" = "green",
            "virginica" = "yellow"
            )
        )
    + custom_ggplot_theme
)


# An example of a plot with a bad color palette
(
  ggplot(
    data = iris,
    aes(
      x = Sepal.Length,
      y = Petal.Width,
      color = Sepal.Width
      )
    )
  + geom_point()
  + facet_grid("~Species")
  + scale_color_continuous(high = "green", low = "blue")
  + custom_ggplot_theme
)

# Box plot example
box_plot_example <- (
  ggplot(
    data = iris,
    aes(
      x = Species,
      y = Petal.Length
      )
    )
   + geom_boxplot()
   + geom_point(position = position_jitter(width = 0.2), alpha = 0.5)
   + custom_ggplot_theme
)

box_plot_example
    

# Customizing the theme
(
  ggplot(
    data = iris,
    aes(
      x = Sepal.Length,
      y = Petal.Width,
      color = Species,
      size = Sepal.Width
      )
    )
  + geom_point()
  + theme_minimal()
  + labs(
    title = "Sepal length vs. Petal width",
    x = "Sepal length",
    y = "Petal width"
    )
  + custom_ggplot_theme
  + guides(color = guide_legend(override.aes = list(size = 5), order = 1))
)
    

# Custom color scale
custom_color_gg <- (
  ggplot(
    data = iris,
    aes(
      x = Sepal.Length,
      y = Petal.Width,
      color = Species,
      size = Sepal.Width
      )
    )
  + geom_point()
  + scale_color_brewer(palette = "Set2")
  + custom_ggplot_theme
)

custom_color_gg


# We previously saved two figures, combine them here into one figure with patchwork
custom_color_gg + box_plot_example + plot_layout(ncol = 1) + plot_annotation(tag_levels = "A")

# Load a built-in dataset for ggrepel example
data("mpg")

# Add a column with the full car name and remove duplicates
mpg <- mpg %>%
  dplyr::mutate(full_car_name = paste(year, manufacturer, model, sep = " ")) %>%
  dplyr::distinct(full_car_name, .keep_all = TRUE)

head(mpg)
    

# Subset the data for focused labeling
subset_mpg_for_focused_labels <- mpg %>%
    dplyr::filter(
        hwy > 35 |
        hwy < 16 |
        displ > 6.1
    )

# Scatter plot with text labels for a different dataset
(
    ggplot(
        data = mpg,
        aes(
            x = displ,
            y = hwy
            )
        )
    + geom_point(
        aes(fill = class),
        shape = 23,
        size = 2
        )
    + geom_text_repel(
        data = subset_mpg_for_focused_labels,
        aes(label = full_car_name),
        arrow = arrow(length = unit(0.01, "npc")),
        box.padding = 1.2,
        force = 2,
        size = 5
        )
    + custom_ggplot_theme
    + scale_color_brewer(palette = "Set2")
    + ylim(0, 50)
    + xlim(0, 8)
)
