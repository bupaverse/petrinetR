#' @title Create Petri Net
#'
#' @description Function to create a petri net by specificing a set of places, transitions, flows and a marking.
#'
#' @param places A vector of unique places.
#' @param transitions A vector of unique transitions.
#' @param flows A data.frame of flows, with columns named "from" and "to".
#' @param marking The names of the places to be marked.
#'
#' @examples
#'
#' create_PN("place_1",
#' 			"transition_1",
#' 			data.frame(from = "place_1",to = "transition_1"),
#' 			marking = "place_1")
#'
#' @export create_PN

create_PN <- function(places,transitions,flows, marking) {
	PN <- list()
	PN$places <- data.frame(id = places , stringsAsFactors = F)
	PN$transitions <- data.frame(id = transitions, stringsAsFactors = F)
	PN$flows <- flows
	PN$marking <- marking

	class(PN) <- "petrinet"

	return(PN)
}
