
#' @title Preset
#'
#' @description Get the preset of a transition or place in a Petri Net
#'
#' @param PN A Petri Net
#' @param node A place or transition in the petri net
#'
#' @export pre_set


pre_set <- function(PN, node) {
	(PN$flows %>% filter(to == node))$from %>% return()
}
