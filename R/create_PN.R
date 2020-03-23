#' @title Create Petri Net
#'
#' @description Function to create a petri net by specificing a set of places, transitions, flows and a marking.
#'
#' @param places A data.frame of unique places, with columns id and label.
#' @param transitions A data.frame of unique transitions, with columns id and label.
#' @param flows A data.frame of flows, with columns named "from" and "to", refering to ids of places and transitions.
#' @param marking Current marking of the net
#' @param initial_marking  Initial marking of the net
#' @param final_marking Final marking of the net
#'
#' @examples
#'
#' create_PN(tibble(id = "p1", label = "place_1"),
#' 			tibble(id = "t1", label = "transition_1"),
#' 			tibble(from = "t1",to = "p1"),
#' 			initial_marking = "p1")
#'
#' @export create_PN

create_PN <- function(places,transitions,flows, marking = NULL, initial_marking = NULL, final_marking = NULL) {
	PN <- list()
	PN$places <- places
	PN$transitions <- transitions
	PN$flows <- flows
	PN$marking <- marking
	PN$initial_marking <- initial_marking
	PN$final_marking <- final_marking

	class(PN) <- "petrinet"

	return(PN)
}
