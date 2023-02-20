

#' @title Read PNML
#'
#' @description Function
#'
#' @param file Path to .pnml file
#' @param add_final_marking [TRUE] add final marking
#' @import xml2
#' @import purrr
#' @export
#'
#'
read_PN <- function(file, add_final_marking = TRUE) {

node <- NULL
children <- NULL
initial_marking <- NULL
final_marking <- NULL
node_name <- NULL
name <- NULL

read_xml(file) %>%
	xml_child("net") %>%
	xml_child("page") %>%
	xml_children() -> t


tibble(name = xml_name(t),
	   id = xml_attr(t, "id"),
	   label = xml_child(t, "name") %>% xml_text(),
	   initial_marking = xml_child(t, "initialMarking") %>% xml_text(),
	   source = xml_attr(t, "source"),
	   target = xml_attr(t, "target")) -> data

# data_frame(node = t) %>%
# 	mutate(children = map(node, xml_child, "initialMarking")) %>%
# 	mutate(initial_marking = map(map(children, xml_child, "text"), xml_contents)) %>%
# 	mutate(initial_marking = map(initial_marking, length) == 1) %>%
# 	mutate(name = xml_name(node)) %>%
# 	mutate(children = map(node, xml_child, "name")) %>%
# 	mutate(node_name = map_chr(map(children, xml_child, "text"), xml_text))%>%
# 	mutate(id = xml_attr(node, "id")) %>%
# 	mutate(source = xml_attr(node, "source"),
# 		   target = xml_attr(node, "target")) %>%
# 	select(-node, -children) %>%
# 	mutate(node_name = ifelse(node_name == "", id, node_name)) -> data

data %>%
	filter(name == "place") -> places
data %>%
	filter(name == "transition") -> transitions

nodes <- bind_rows(places, transitions) %>% select(id,label)

data %>%
	filter(name == "arc") %>%
	rename(from = source,
		   to = target) %>%
	select(-initial_marking, -label) -> flows

list(places = places, transitions = transitions)#, nodes = nodes, flows = flows)

create_PN(places = places,
		  transitions = transitions,
		  flows = flows) -> PN

initial_marking <- places %>% filter(initial_marking == 1) %>% pull(id)

# final_marking
if (add_final_marking) {

	# final_marking = any place_id not in arc_source
	place_ids <- places %>% pull(id)
	arc_sources <- data %>%
		filter(name == "arc") %>%
		pull(source)

	final_marking <- setdiff(place_ids, arc_sources)
}


create_marked_PN(PN = PN, initial_marking = initial_marking, final_marking = final_marking)



# marked_PN <- list()
# marked_PN <- marked_PN %>% append()
#
# create_marked_PN()
}






