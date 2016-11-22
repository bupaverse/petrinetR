
sequence_to_PN <- function(transitions, name) {
	if(length(transitions) == 1) {
		places <- c(paste0("start_", name),
					paste0("end_", name))
	}
	else{

		places <- c(paste0(name, "_start"),
					paste0(name, "_", 1:(length(transitions)-1)),
					paste0(name, "_end"))
	}
	flows <- data.frame(from = places[1:(length(places)-1)],
						to = transitions) %>%
		bind_rows(
			data.frame(from = transitions,
					   to = places[2:length(places)])
		)

	marking <- paste0(name, "_start")
	create_PN(places, transitions, flows, marking) %>% return()

}
