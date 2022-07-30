#' Viewer method for a S4 class
#' 
#' @param \dots \R object
#' @export 
View <- function(...) {
	original = utils::View
	if (interactive() && (Sys.getenv("RSTUDIO") == "1")) {
		name = "bla"
		e <- as.environment("tools:rstudio")
		if(inherits(..., "foo")) {
			obj <- unclass(...)@df |> format.data.frame()
			e$.rs.callAs(name, e$.rs.viewHook, original, obj)
		} else {
			e$.rs.callAs(name, e$.rs.viewHook, original, ...)
		}
	} else {
		original(...)
	}
}

# foo <- setClass("foo", slots = c(df = "data.frame"))
# myfoo <- new('foo', df = mtcars)
