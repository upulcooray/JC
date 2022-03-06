library(tidyverse)
library(knitr)
library(janitor)
library(kableExtra)
library(dagitty)
library(ggdag)
library(ggplot2)

g<- dagify(Y~A,
           M~A,
           Y~M)

coords <- list(
  x = c(A= 2, Y=3, M=2.5),
  y = c(A=5, Y=5, M=5.5)
)

coord_df <- coords2df(coords)

coordinates(g) <- coords2list(coord_df)

tidy_dagitty() %>%
  mutate(y= if_else(name!="M", 6,8)) %>%
  mutate(x= case_when(name=="A"~2,
                      name=="Y"~4,
                      name=="M"~3))

dag0 <- g  %>% tidy_dagitty() %>%
  mutate(color= if_else(name=="M", "col1","col2"),
         arrow_col= if_else(name=="A" & to=="Y", "#23cf59", "#eb86ac")) %>%
  ggplot(aes(
    x = x,
    y = y,
    xend = xend,
    yend = yend
  ))


# plot1
dag0 +
  geom_dag_point(color= "#1fd0e0",size=20) +
  geom_dag_edges() +
  geom_dag_text(color="black") +
  theme_dag_blank()


dag0 +
  geom_dag_point(show.legend = F, aes(color= color),size=20) +
  scale_color_manual(values=c(col1="#dbeb34", col2="#1fd0e0"))+
  geom_dag_edges(aes(edge_colour=arrow_col) ) +
  geom_dag_text(color="black") +
  theme_dag_blank()


dag0 <- g  %>% tidy_dagitty() %>%
  mutate(color= if_else(name=="M", "col1","col2"),
         arrow_col= if_else(name=="A" & to=="Y", "#23cf59", "#eb86ac")) %>%
  ggplot(aes(
    x = x,
    y = y,
    xend = xend,
    yend = yend
  ))

