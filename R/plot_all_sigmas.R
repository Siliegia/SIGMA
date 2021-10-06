#' Plot all sigmas
#'
#' plot of all sigmas obtained per cluster
#'
#' @param measure_obj the measure-object as the output of sigma_funct
#'
#' @import ggplot2
#' @importFrom grDevices colorRampPalette
#'
#' @return ggplot plot
#'
#' @examples
#' data("out")
#' plot_all_sigmas(out)
#'
#' @export


plot_all_sigmas <- function(measure_obj){

  lvls <- paste0(c(sort(unique(as.numeric(measure_obj$all_info$singular_value))), 0))

  if(lvls[1] == "0"){
    lvls <- lvls[-1]
  }

  measure_obj$all_info$singular_value <- factor(measure_obj$all_info$singular_value, levels = lvls)
  measure_obj$all_info$celltype <- factor(measure_obj$all_info$celltype, levels = names(measure_obj$sigma)[order(measure_obj$sigma)])

  cls <- colorRampPalette(c("orchid2", "steelblue1", "olivedrab2", "tomato"))

  if(!is.na(match("0", measure_obj$all_info$singular_value)[1]) > 0){
    cls <- c(cls(length(unique(measure_obj$all_info$singular_value)) - 1), "lightgrey")
  }else{
    cls <- c(cls(length(unique(measure_obj$all_info$singular_value))))
  }

  p <- ggplot(measure_obj$all_info, aes(x = .data$celltype, y = .data$sigma, colour = .data$singular_value)) +
    geom_point(size = 2) + theme_light(base_size = 12) + xlab("") +
    ylab("SIGMA") + theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1)) +
    scale_color_manual(values = cls) + guides(colour=guide_legend(title = "singular value"))


  print(p)
}
