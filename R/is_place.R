
#' @title Is place
#'
#' @description Check if a place is part of a petri net
#'
#' @param place A place
#' @param PN A Petri Net
#'
#' @export is_place


is_place <- function(place, PN) {
	if(place %in% places(PN)$id | place %in% places(PN)$label)
		return(T)
	else
		return(F)
}
