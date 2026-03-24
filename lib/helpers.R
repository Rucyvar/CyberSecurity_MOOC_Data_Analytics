helper.function <- function()
{
  return(1)
}

# Safely retrieve an object from the environment and confirm it is a data frame.
.get_dataframe <- function(obj_name) {
  obj <- get(obj_name)
  if (!is.data.frame(obj)) {
    stop(paste("Expected a data.frame for object:", obj_name,
               "but got:", class(obj)[1]))
  }
  obj
}

# Assert that required columns exist in a data frame.
.require_columns <- function(df, required_cols, context = "") {
  missing_cols <- setdiff(required_cols, names(df))
  if (length(missing_cols) > 0) {
    stop(paste0(context, ": missing required column(s): ",
                paste(missing_cols, collapse = ", ")))
  }
}
