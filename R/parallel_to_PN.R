
parallel_to_PN <- function(transitions, name) {
	places <- c(paste0("in_", transitions),
				paste0("out_", transitions))



	flows <- data.frame(from = paste0("in_", transitions),
						to = transitions) %>%
		bind_rows(
			data.frame(from = transitions,
					   to = paste0("out_", transitions))
		) %>%
		bind_rows(
			data.frame(from = paste0("inv_", name, "_start"),
					   to = paste0("in_", transitions))
		) %>%
		bind_rows(
			data.frame(from = paste0("out_", transitions),
					   to = paste0("inv_", name, "_end"))
		)

	transitions <- c(transitions,
					 paste0("inv_", name, "_start"),
					 paste0("inv_", name, "_end"))
	marking <- NULL
	create_PN(places, transitions, flows, marking) %>% return()

}
