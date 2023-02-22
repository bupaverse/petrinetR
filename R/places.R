#' @title Places
#'
#'
#' @description Extracts the places from a Petri Net
#'
#' @param PN A Petri Net
#'
#' @export places

places <- function(PN) {
	UseMethod("places")
}

#' @describeIn places Places of petrinet
#' @export
places.petrinet <- function(PN) {
	return(PN$places)
}

#' @describeIn places Places of marked petrinet
#' @export
places.marked_petrinet <- function(PN) {
	places(PN$petrinet)
}

