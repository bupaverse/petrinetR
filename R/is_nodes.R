
#' @title Is node
#'
#' @description Check if a node is part of a petri net
#'
#' @param node A node
#' @param PN A Petri Net
#'
#' @export is_node

is_node <- function(node, PN) {
	UseMethod("is_node")
}

is_node.petrinet <- function(node, PN) {



	if(node %in% transitions(PN)$id)
		return(T)
	else if(node %in% places(PN)$id)
		return(T)
	else
		return(F)
}

