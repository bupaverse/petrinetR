
#' @title Postset
#'
#' @description Get the postset of a transition or place in a Petri Net
#'
#' @param PN A Petri Net
#' @param node A place or transition in the petri net
#'
#' @export post_set

post_set <- function(PN, node) {
	UseMethod("post_set")
}

post_set.petrinet <- function(PN, node) {
	(flows(PN) %>% filter(from == node))$to %>% return()
}
