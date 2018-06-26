

#' @title Read PNML
#'
#' @description Function
#'
#' @param file Path to .pnml file
#' @import xml2
#' @import purrr
#' @export
#'
#'
read_PN <- function(file) {

node <- NULL
children <- NULL
initial_marking <- NULL
node_name <- NULL
name <- NULL

read_xml(file) %>%
	xml_children() %>%
	xml_children() -> t

data_frame(node = t) %>%
	mutate(children = map(node, xml_child, "initialMarking")) %>%
	mutate(initial_marking = map(map(children, xml_child, "text"), xml_contents)) %>%
	mutate(initial_marking = map(initial_marking, length) == 1) %>%
	mutate(name = xml_name(node)) %>%
	mutate(children = map(node, xml_child, "name")) %>%
	mutate(node_name = map_chr(map(children, xml_child, "text"), xml_text))%>%
	mutate(id = xml_attr(node, "id")) %>%
	mutate(source = xml_attr(node, "source"),
		   target = xml_attr(node, "target")) %>%
	select(-node, -children) %>%
	mutate(node_name = ifelse(node_name == "", id, node_name)) -> data

data %>%
	filter(name == "place") -> places
data %>%
	filter(name == "transition") -> transitions

nodes <- bind_rows(places, transitions) %>% select(id,node_name)

data %>%
	filter(name == "arc") %>%
	select(-node_name) %>%
	left_join(nodes, by = c("source"="id")) %>%
	rename(from = node_name) %>%
	left_join(nodes, by = c("target" = "id")) %>%
	rename(to = node_name) -> flows

create_PN(places = places$node_name,
		  transitions = transitions$node_name,
		  flows = flows,
		  marking = places %>% filter(initial_marking) %>% pull(id))
}
