
#' @title Utils
#'
#' @description Several auxilliary functions for Petri Net objects.
#' @rdname Utils
#' @param PN A petri net
#' @param .t A character vector of transitions
#' @param .p A character vector of places
#' @param .flows A data.frame with a to and from column
#' @param .f A function name to apply for renaming
#' @param ... Additional arguments
#' @export
n_places <- function(PN) {
	nrow(places(PN))
}

#' @rdname Utils
#' @export

n_transitions <- function(PN) {
	nrow(transitions(PN))
}
#' @rdname Utils
#' @export

n_flows <- function(PN) {
	nrow(flows(PN))
}

#' @rdname Utils
#' @export

n_nodes <- function(PN) {
	n_places(PN) + n_transitions(PN)
}
#' @rdname Utils
#' @export

nodes <- function(PN) {
	places <- places(PN) %>% mutate(type = "place")
	transitions <- transitions(PN) %>% mutate(type = "transition")

	places %>%
		bind_rows(transitions)
}
#' @rdname Utils
#' @export

rename_transitions <- function(PN, .f, ...) {

	new_id <- NULL

	transitions(PN) %>%
		mutate(new_id = .f(id, ...)) -> t

	flows(PN) %>%
		left_join(t, by = c("from" = "id")) %>%
		mutate(from = ifelse(is.na(new_id), from, new_id)) %>%
		select(-new_id) %>%
		left_join(t, by = c("to" = "id")) %>%
		mutate(to = ifelse(is.na(new_id), to, new_id)) %>%
		select(-new_id) -> new_flows

	t %>%
		select(-id) %>%
		rename(id = new_id) -> new_transitions

	PN$transitions <- new_transitions
	PN$flows <- new_flows

	return(PN)
}
#' @rdname Utils
#' @export

rename_places <- function(PN, .f, ...) {

	new_id <- NULL

	places(PN) %>%
		mutate(new_id = .f(id, ...)) -> t

	flows(PN) %>%
		left_join(t, by = c("from" = "id")) %>%
		mutate(from = ifelse(is.na(new_id), from, new_id)) %>%
		select(-new_id) %>%
		left_join(t, by = c("to" = "id")) %>%
		mutate(to = ifelse(is.na(new_id), to, new_id)) %>%
		select(-new_id) -> new_flows

	t %>%
		select(-id) %>%
		rename(id = new_id) -> new_places

	PN$places <- new_places
	PN$flows <- new_flows

	return(PN)
}
#' @rdname Utils
#' @export
add_places <- function(PN, .p) {
	PN %>%
		places() %>%
		bind_rows(data_frame(id = .p)) -> new_places
	PN$places <- new_places
	return(PN)
}
#' @rdname Utils
#' @export
add_transitions <- function(PN, .t) {
	PN %>%
		transitions() %>%
		bind_rows(data_frame(id = .t)) -> new_transitions
	PN$transitions <- new_transitions
	return(PN)
}
#' @rdname Utils
#' @export
add_flows <- function(PN, .flows) {
	PN %>%
		flows %>%
		bind_rows(.flows) -> new_flows
	PN$flows <- new_flows
	return(PN)
}





