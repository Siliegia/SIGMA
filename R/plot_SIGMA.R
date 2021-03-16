
#' Plot sigma
#'
#' plot the value of sigma for every cluster
#'
#' @param measure_obj the measure-object as the output of sigma_funct
#'
#' @import ggplot2
#'
#' @return ggplot plot
#'
#' @examples
#' data("out")
#' plot_sigma(out)
#'
#' @export

plot_sigma <- function(measure_obj){

  m.plot <- data.frame(celltype = names(measure_obj$maximum_measure), values = measure_obj$maximum_measure)
  m.plot$celltype <- factor(m.plot$celltype, levels = m.plot$celltype[order(m.plot$values)])

  p <- ggplot(m.plot, aes(x = m.plot$celltype, y = m.plot$values, colour = m.plot$celltype)) + geom_point(size = 2) + theme_light(base_size = 12) + xlab("") +
    ylab("SIGMA") + theme(legend.position = "none", axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))

  print(p)
}
