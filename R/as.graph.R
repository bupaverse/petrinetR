


#' @title As graph
#'
#' @description Function
#'
#' @param PN A petrin et
#'
#' @export as.graph

as.graph <- function(PN) {



	nodes <- bind_rows(
		PN$places %>% mutate(shape = "circle"),
		PN$transitions %>% mutate(shape = "square")
	) %>% suppressWarnings() %>%
		mutate(nodes = id,
			   label = ifelse(shape == "circle", "",id),
			   fixedsize = T)

	edges <- PN$flows %>%
		mutate(arrows = "to")

	create_graph(nodes, edges)

}
