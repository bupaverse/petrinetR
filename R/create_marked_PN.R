#' @title Create marked Petri Net
#'
#' @description Function to create a petri net by specifying a set of places, transitions and flows.
#'
#' @param x a model (`list` object) returned by [pm4py_inductive()].
#'
#' @examples
#'
#' create_PN("place_1",
#' 			"transition_1",
#' 			data.frame(from = "place_1",to = "transition_1"),
#' 			marking = "place_1")
#'
#' @export create_marked_PN

create_marked_PN <- function(x) {
	marked_pn <- x[[1]]
	source <- x[[2]]
	sink <- x[[3]]

	PN <- list(marked_pn = marked_pn, source = source, sink = sink)

	class(PN) <- "marked_petrinet"

	return(PN)
}
