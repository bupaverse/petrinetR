#' @title Flows
#'
#' @description Extracts the flows from a Petri Net
#'
#' @param PN A Petri Net
#'
#' @export flows

flows <- function(PN) {
	UseMethod("flows")
}

#' @describeIn flows Flow of petrinet
#' @export

flows.petrinet <- function(PN) {
	return(PN$flows)
}

#' @describeIn flows Flow of marked petrinet
#' @export

flows.marked_petrinet <- function(PN) {
	flows(PN$petrinet)
}
