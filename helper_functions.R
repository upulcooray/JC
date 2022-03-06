
tab <- function(df, ...){

  df %>%
    tabyl(...) %>%
    adorn_totals("row") %>%
    adorn_percentages("row") %>%
    adorn_pct_formatting(digits = 1) %>%
    adorn_ns(position = "front") %>%
    adorn_title()
}

t <- function(df, ...){

  df %>%
    tabyl(...) %>%
    adorn_pct_formatting(digits = 1)

}

