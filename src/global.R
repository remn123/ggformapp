rm(list=ls())
library(shiny)
library(shinydashboard)
library(ggplot2)
library(ggformula)

data("iris")

get_df_plot = function(df, s, new_var){
  s <- paste0(new_var, " = ", s)
  q = quote(mutate(df, z = s))
  eval(parse(text=sub("z = s", s, deparse(q))))
}