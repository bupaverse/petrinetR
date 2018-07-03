#' @title Generic print function for petrinet
#' @description Generic print function for petrinet
#' @param x petrinet object
#' @param ... Additional Arguments
#' @method print petrinet
#' @export

print.petrinet <- function(x, ...) {
	cat("Marking: ",marking(x), "\n")
	cat("Enabled transition\n")
	print(enabled(x))
	render_PN(x)

}
