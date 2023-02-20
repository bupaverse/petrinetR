
#' @title Is node
#'
#' @description Check if a node is part of a petri net
#'
#' @param node A node
#' @param PN A Petri Net
#'
#' @export is_nodes

is_nodes <- function(node, PN) {
	UseMethod("is_nodes")
}

is_nodes.petrinet <- function(node, PN) {

	lifecycle::deprecate_warn(
		when = "0.3.0",
		what = "enabled()",
		with = "is_nodes()")

	if(node %in% transitions(PN)$id)
		return(T)
	else if(node %in% places(PN)$id)
		return(T)
	else
		return(F)
}

