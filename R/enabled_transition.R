
#' @title Enabled Transition
#'
#' @description Check if a transition is currently enabled
#'
#' @param PN A Petri Net
#' @param transition A Transition
#'
#' @export enabled_transition




enabled_transition <- function(PN,transition) {
	if(transition %>% is_transition(PN))
		return(all(pre_set(PN, transition) %in% PN$marking))
	else
		return(F)
}
