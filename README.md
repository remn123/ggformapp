# ggformapp
A simple ShinyApp for plotting variables based on formula text input.

The core of this app is the following function copied from a helpful stackoverflow [question](https://stackoverflow.com/questions/22908050/formula-evaluation-with-mutate) answered by [Randy Lai](https://stackoverflow.com/users/2223504/randy-lai).
```R
get_df_plot = function(df, s, new_var){
  s <- paste0(new_var, " = ", s)
  q = quote(mutate(df, z = s))
  eval(parse(text=sub("z = s", s, deparse(q))))
}
```
Let's take a look at each part of this function and see what is happening.

The function receives a dataframe (df), a valid R text expression (s) and a string for the new variable name (new_var) as input and returns a dataframe with a new column created from the formula expression:
```R
get_df_plot = function(df, s, new_var){
  (...)
}
```
The first line of code inside the function just concatenates the new variable name as left-hand-side of the (s) expresion.
```R
  s <- paste0(new_var, " = ", s)
```
The second line of code use quote function to save the mutate expression without evaluating it. 
```R  
  q = quote(mutate(df, z = s))
```
For the last line I will split in parts. Let's take a look at the deparsing first. 
```R  
  ...deparse(q)...
```

The deparse function gets the unevaluated expression created from the quote function output (q) and turns it into a character expression. So, it simply makes mutate(df, z = s) into "mutate(df, z = s)".
Now we have this character expression "mutate(df, z = s)" inside the sub function which will search for the "z = s" into it and then replace it by the s expression (a string).  

```R  
  > s <- "new = sin(Sepal.Width)" # example of expression
  > sub("z = s", s, deparse(q))
[1] "mutate(df, new = sin(Sepal.Width))"
```

Then the parse function will receives this string unevaluated expression as text and returns as an expression.
```R  
  > parse(text=sub("z = s", s, deparse(q)))
  expression(mutate(iris, new = sin(Sepal.Width)))
```
At last, the eval function will execute the expression returning the dataframe output.
```R  
  eval(parse(text=sub("z = s", s, deparse(q))))
```

Have fun!


