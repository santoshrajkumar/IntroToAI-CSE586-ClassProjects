string_cleaner <- function(text_vector) {
  tx <- text_vector %>%
    str_replace_all("[^[:alnum:] ]+", "") %>%
    str_to_lower() %>%
    str_replace_all("\\b(http|www.+)\\b", "_url_") %>%
    str_replace_all("\\b(\\d{7,})\\b", "_longnum_") %>%
    str_split(" ")  
  
  tx <- lapply(tx, function(x) x[nchar(x) > 1])
  
  tx
}