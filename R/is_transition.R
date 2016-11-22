#' @title Is transition
#'
#' @description Check if a transition is part of a petri net
#'
#' @param transition A transition
#' @param PN A Petri Net
#'
#' @export is_transition


is_transition <- function(transition, PN) {
	if(transition %in% transitions(PN)$id)
		return(T)
	else
		return(F)
}

