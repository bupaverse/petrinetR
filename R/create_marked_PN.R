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

create_marked_PN <- function(PN, initial_marking, final_marking) {
	petrinet <- PN
	initial_marking <- initial_marking
	final_marking <- final_marking

	marked_PN <- list(petrinet = petrinet, initial_marking = initial_marking, final_marking = final_marking)

	class(marked_PN) <- c("marked_petrinet", "petrinet", "list")

	return(marked_PN)
}
