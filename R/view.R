#' Viewer method for a S4 class
#' 
#' @param \dots \R object
#' @export 
View <- function(...) {
	if (interactive() && (Sys.getenv("RSTUDIO") == "1")) {
		name = "bla"
		original = utils::View
		e <- as.environment("tools:rstudio")
	}
	if(inherits(..., "foo")) {
			obj <- unclass(...)@df |> format.data.frame()
			e$.rs.callAs(name, e$.rs.viewHook, original, obj)
		} else {
			e$.rs.callAs(name, e$.rs.viewHook, original, ...)
	}
}

# foo <- setClass("foo", slots = c(df = "data.frame"))
# myfoo <- new('foo', df = mtcars)
