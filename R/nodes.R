

#' Title
#'
#' @param PN
#'
#' @return
#' @export
#'
#' @examples

nodes <- function(PN) {
	UseMethod("nodes")
}


#' @export
nodes.petrinet <- function(PN) {
	places <- places(PN) %>% mutate(type = "place")
	transitions <- transitions(PN) %>% mutate(type = "transition")

	places %>%
		bind_rows(transitions)
}
