#' @noRd
#' @include globals.R
jsonSerializer <- function(){
  function(val, req, res, errorHandler){
    tryCatch({
      json <- jsonlite::toJSON(val)

      res$setHeader("Content-Type", "application/json ; charset=utf8")
      res$body <- json

      return(res$toResponse())
    }, error=function(e){
      errorHandler(req, res, e)
    })
  }
}
.globals$serializers[["json"]] <- jsonSerializer

#' @noRd
#' @include globals.R
unboxedJsonSerializer <- function(){
  function(val, req, res, errorHandler){
    tryCatch({
      json <- jsonlite::toJSON(val, auto_unbox = TRUE)

      res$setHeader("Content-Type", "application/json  ; charset=utf8")
      res$body <- json

      return(res$toResponse())
    }, error=function(e){
      errorHandler(req, res, e)
    })
  }
}
.globals$serializers[["unboxedJSON"]] <- unboxedJsonSerializer
