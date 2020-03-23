

#' @title Read PNML
#'
#' @description Function
#'
#' @param file Path to .pnml file
#' @param initialize_marking Set marking of PN to initial marking
#' @import xml2
#' @import purrr
#' @export
#'
#'
read_PN <- function(file, initialize_marking = TRUE) {

	read_xml(file) %>%
		xml_children() %>%
		xml_children() -> t

	unlist(map(t, xml_name)) -> names
	map(t, xml_child, "name") -> child_names
	(map(map(map(map(t, xml_child, "initialMarking"), xml_child, "text"), xml_contents), length ) == 1) -> initial_marking
	child_names %>% map(xml_child, "text") %>% map_chr(xml_text) -> node_names

	xml_attr(t, "id") -> id
	xml_attr(t, "source") -> source
	xml_attr(t, "target") -> target

	tibble(type = names, id, label = node_names, source, target, initial_marking) -> data

	data %>% filter(type == "place") %>% select(id, label, initial_marking) -> places
	data %>% filter(type == "transition") %>% select(id, label) -> transitions

	nodes <- bind_rows(places, transitions) %>% select(id, label)
	data %>% filter(type == "arc") %>%
		select(-label, -type, -id, -initial_marking) %>%
		rename(from = source, to = target) -> flows

	create_PN(places = places,
			  transitions = transitions,
			  flows = flows,
			  initial_marking = places %>% filter(initial_marking) %>% pull(id),
			  marking = places %>% filter(initial_marking) %>% pull(id))
}
