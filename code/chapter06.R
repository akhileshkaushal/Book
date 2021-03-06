## ----test whether a string starts with a prefix--------------------------
startsWith(x = "banana", prefix = "b")

## ----test whether a string ends with a suffix----------------------------
endsWith(x = "apple", suffix = "e")

## ----startsWith() will not ignore whitespace-----------------------------
startsWith(" banana", "b") 

## ----startsWith() is case-sensitive--------------------------------------
startsWith("Apple", "a")

## ----the prefix can be several characters long---------------------------
startsWith("carpet", "car")

## ----searching for a substring-------------------------------------------
grep(
  pattern = "nan", 
  x       = "banana", 
  value   = TRUE  # <1>
)

## ----testing whether a substring can be found----------------------------
grepl("app", "apple")

## ----vectorised testing for substrings-----------------------------------
grepl(pattern = "meow", x = c("meowing", "meowed", "homeowner"))

## ----returning strings which match the pattern---------------------------
grep("car", c("cradle", "cartoon", "carpet"), value = TRUE)

## ----returning the index of strings which match the pattern--------------
grep("car", c("cradle", "scary", "carpet", "Carroll"))

## ----load and attach the stringr package---------------------------------
# install.packages("stringr")
library(stringr)

## ----viewing matches in the Viewer pane, eval = FALSE--------------------
## # install.packages("htmlwidgets") 
## str_view(c("cradle", "scary", "carpet", "Carroll"), "car")

## ----vectorised extraction of first letters------------------------------
substr(x = c("You", "Only", "Live", "Once"), start = 1, stop = 1)

## ----extracting the first three letters of a string----------------------
substr("carpet", 1, 3)

## ----extracting the last three letters by starting at letter 4-----------
substring("carpet", 4)

## ----substituting a substring--------------------------------------------
sub(pattern = "pet", replacement = "tography", x = "carpet")

## ----substituting the first l with an L----------------------------------
sub(" l", " L", "the Tower of london is located on the north bank of the Thames.") 

## ----substituting all instances of mrs with Mrs--------------------------
gsub("mrs", "Mrs", "mrs smith, mrs jones, and mrs martin.")

## ----substituting all single quotes with double quotes-------------------
gsub("\'", "\"", "He said 'Hello'")

## ----replacing commas with nothing---------------------------------------
str_replace_all("1,200,000", ",", "")

## ----substituting a specific number with a z-----------------------------
sub(pattern = "3", replacement = "z", x = "xy3")

## ----substituting any digit with a z-------------------------------------
sub(pattern = "\\d", replacement = "z", x = "xy8") 

## ----finding strings matching either Car or car--------------------------
grep("[Cc]ar", c("cradle", "scary", "carpet", "Carroll"), value = TRUE) 

## ----finding and returning strings matching Carr or carr-----------------
grep("[Cc]ar{2}", c("cradle", "scary", "carpet", "Carroll"), value = TRUE) 

## ----viewing the matches in the Viewer pane, eval = FALSE----------------
## str_view_all("xy23yx878xyx9yxy", "\\d{2}") ## two digits in a row

## ----load and attach the rex package-------------------------------------
# install.packages("rex")
library(rex)

## ----rex helps to build regex commands with an R syntax------------------
matching_regex <- rex(
  start,
  n_times(letter, 3),
  n_times(digit, 1),
  any_lowers
)
matching_regex

## ----viewing regex matches in the Viewer pane, eval = FALSE--------------
## possible_strings <- c("xyzabc9?AB", "JDC8xyzabc", "SC?0abcxyz")
## str_view(possible_strings, matching_regex)

## ----a vector which we would like to select only part of-----------------
vec <- c(21, 23, 25, 27, 29)

## ----selecting the second element of vec---------------------------------
vec[2]

## ----selecting the second and fifth elements of vec----------------------
vec[c(2, 5)]

## ----selecting a sequence of elements of vec-----------------------------
vec[2:4]

## ----selecting every element of vec except the second--------------------
vec[-2]

## ----selecting every element of vec except the second or third-----------
vec[-c(2, 3)]

## ----selecting all the elements of vec explicitly------------------------
vec[]

## ----selecting the second and third elements of an unnamed vector--------
c(32, 34, 36, 38)[c(2, 3)]

## ----this will fail because square brackets can only select one value, eval = FALSE----
## vec[[c(1, 2)]]

## ----a named vector------------------------------------------------------
named_vec <- c(x = 21, y = 23, z = 25)

## ----selecting the second element (with its name) of named_vec-----------
named_vec[2]

## ----selecting the second element (without its name) of named_vec--------
named_vec[[2]]

## ----selecting the elements of named_vec named x and y-------------------
named_vec[c("x", "y")]

## ----selecting the element of named_vec named y--------------------------
named_vec[["y"]]

## ----non-integers will select as if passed to as.integer-----------------
letters[c(1.3, 1.5, 1.7, 2.1)]

## ----attempting to select the zero element from a vector is silent-------
letters[0]

## ----attempting to select an element beyond the length of a vector-------
letters[99]

## ----attempting to select the NAth element leads to lots of NAs----------
named_vec[NA]

## ----selecting with a typed NA actually produces a single NA-------------
named_vec[NA_character_]

## ----a list which we would like to select only part of-------------------
lst <- list(
  odd   = c(1, 3, 5),
  even  = c(2, 4, 6),
  every = 1:6
)

## ----selecting the first and second elements of lst----------------------
lst[c(1, 2)]

## ----selecting with a single square bracket returns another list---------
typeof(lst[c(1, 2)])

## ----selecting with single square brackets still produces a list---------
typeof(lst[c(1, 2)][2])

## ----double square brackets return a single element not a list-----------
lst[[2]]
typeof(lst[[2]])

## ----double brackets return a vector from lst which can be further subset----
lst[[2]][2]

## ----a nested list which we would like to select only part of------------
nested_lst <- list(
  names = list(
    first = "Jonathan",
    last = "Carroll"
  ),
  fav_lang = "R"
)
nested_lst

## ----double square brackets can take multiple arguments in the case of a nested list----
nested_lst[[c(1, 2)]]

## ----selecting named elements even and odd from lst----------------------
lst[c("even", "odd")]

## ----selecting a single named element from lst---------------------------
lst[["even"]]

## ----selecting deeply nested elements by name----------------------------
nested_lst[[c("names", "last")]]

## ----dollar-name syntax works on lists-----------------------------------
lst$odd

## ----this fails because dollar-name syntax does not work on vectors, eval = FALSE----
## named_vec$a

## ----partial matching allows names to be shortened-----------------------
lst$o

## ----if insufficient characters are provided the element will not be found----
lst$e

## ----not matching an element returns the same as not partially matching the name----
lst$z

## ----turning on the partial matching warning-----------------------------
options(warnPartialMatchDollar = TRUE)

## ----now a warning is produced if partial matching occurs----------------
lst$o

## ----double square brackets do not perform partial matching by default----
lst[["o"]]

## ----the option for partial matching can be turned on--------------------
lst[["o", exact = FALSE]]

## ----this is clearer that we are selecting the second element of the element named odd----
lst$odd[2]

## ----this makes the structure very clear---------------------------------
nested_lst$names$last

## ----a simple function which creates a list------------------------------
make_a_list <- function() {
  return(list(x = 11, y = 12, z = 13))
}

## ----evaluating this function creates a list-----------------------------
new_list <- make_a_list()

## ----selecting the element named y from the newly created list-----------
new_list$y

## ----instead of creating another variable the element named z can be selected----
make_a_list()$y

## ----neglecting to include the parentheses means we are trying to select from the function body, eval = FALSE----
## make_a_list$y

## ----a matrix which we would like to select only part of-----------------
mat <- matrix(letters[1:12], nrow = 3)
mat

## ----selecting the third row second column from mat----------------------
mat[3, 2]

## ----selecting the first and third rows and second column from mat-------
mat[c(1, 3), 2]

## ----selecting the first and third rows and second and fourth columns from mat----
mat[c(1, 3), c(2, 4)]

## ----selecting all rows but the second and third columns-----------------
mat[ , c(2, 3)] 

## ----setting row and column names for mat--------------------------------
colnames(mat) <- c("col1", "col2", "col3", "col4")
rownames(mat) <- c("row1", "row2", "row3")
mat

## ----selecting rows and columns by name----------------------------------
mat[c("row1", "row3"), c("col2", "col4")]

## ----selecting the single element from a named row and column------------
mat[["row2", "col2"]]

## ----selecting elements with atypical names------------------------------
c(x = 7, "y variable" = 8, z = 9)["y variable"]
list(x = 7, ".2b" = 8, z = 9)$`.2b`

## ----replacing the second element of vec with the value 99---------------
vec[2] <- 99
vec

## ----coercing a vector by replacing a value------------------------------
vec[2] <- "99"
vec

## ----replacing the element in the third row second column of mat with 99----
mat[3, 2] <- 99 
mat

## ----a vector of length 5------------------------------------------------
vec <- 1:5
vec

## ----selecting beyond the length of vec----------------------------------
vec[8]

## ----replacing an element which was not previously defined---------------
vec[8] <- 99
vec

## ----a matrix with two rows----------------------------------------------
mat <- matrix(1:8, nrow = 2)
mat

## ----attempting to replace an element on the eigth line of mat will fail, eval = FALSE----
## mat[8, 2] <- 99

## ----providing several replacements at once------------------------------
vec <- 1:8
vec[2:3] <- c(98, 99)
vec

## ----recycling results in all seven values being replaced----------------
vec[1:7] <- 0
vec

## ----replacing the first third and fifth elements of 1:6 with 9----------
replace(x = 1:6, list = c(1, 3, 5), values = 9)

## ----replacing an entire column of mat-----------------------------------
mat[, 2] <- c(98, 99)
mat

## ----selecting the second element of lst---------------------------------
lst <- list(
  odd   = c(1, 3, 5),
  even  = c(2, 4, 6),
  every = 1:6
)
lst[[2]]

## ----replacing the second element of lst with another vector-------------
lst[[2]] <- c(8, 10)
lst

## ----replacing the element named even with another vector----------------
lst$even <- c(10, 12)
lst

## ----replacing an element nested within a list---------------------------
lst$even[2] <- 100
lst

## ----removing an element from a list-------------------------------------
lst <- lst[-2]
lst

## ----removing an entire vector by replacing it with NULL-----------------
lst$every <- NULL
lst

## ----adding elements beyond lengths--------------------------------------
lst[[4]] <- c("x", "y", "z")
lst

## ----additional elements will be added at the end of the list------------
lst$greek <- c("alpha", "beta", "gamma")
lst

## ---- echo = FALSE-------------------------------------------------------
suppressPackageStartupMessages(library(dplyr))

## ----loading and attaching the dplyr package-----------------------------
# install.packages("dplyr")
library(dplyr)

## ----example of mutate adding a new column based on an existing column----
head(
  mutate(mtcars, displ_l = disp / 61.0237)
)

## ----example of select keeping only certain columns----------------------
head(
  select(mtcars, cyl, mpg)
)

## ----example of filter keeping only matching rows------------------------
filter(mtcars, cyl < 6, am == 1)
## or equivalently filter(mtcars, cyl < 6 & am == 1) 

## ----example of summarise aggregating a result of a calculation over rows----
summarise(mtcars, mean(disp))

## ----example of creating groups of rows based on their value of cyl------
by_cyl <- group_by(mtcars, cyl) 
head(by_cyl)

## ----summarising a grouped data.frame------------------------------------
summarise(by_cyl, disp_bar = mean(disp), hp_bar = mean(hp)) 

## ----writing out the name of the data.frame repeatedly makes it hard to read----
head(mutate(mtcars, hp_per_cyl = mtcars$hp / mtcars$cyl))

## ----dplyr knows that we mean the hp and cyl columns---------------------
head(mutate(mtcars, hp_per_cyl = hp / cyl))

## ----we can not store the name of a column in its own variable, eval = FALSE----
## column_to_divide <- cyl

## ----we can store the name of the column as a string---------------------
column_to_divide <- "cyl"

## ----trying to use a string in mutate will fail, eval = FALSE------------
## head(mutate(mtcars, ratio = mpg / column_to_divide))

## ----rlang provides support to use strings and variables in dplyr--------
# install.packages("rlang")
library(rlang)
head(mutate(mtcars, ratio = mpg / !!sym(column_to_divide))) 

## ----the carb column is used not the variable----------------------------
carb <- 1000
head(mutate(mtcars, double_carb = carb * 2))

## ----explicitly taking carb as a column in the data----------------------
head(mutate(mtcars, double_carb = .data$carb * 2))

## ----explicitly taking carb as a variable in the environment-------------
head(mutate(mtcars, double_thousand = .env$carb * 2))

## ----selecting an atypically named column using backticks----------------
d <- data.frame(
  x = 21,
  `y variable` = 22,
  `.2b` = 23,
  check.names = FALSE
)

select(d, `y variable`, `.2b`)

## ----passing a vector through several pipes------------------------------
c(100, 10, 1000) %>% 
  log(base = 10) %>% 
  mean()             

## ----a messy composition of many functions with arguments----------------
summarise(			
  group_by(			
    select(			
      filter(mtcars, cyl > 4),	
      mpg, hp, am
    ),				
    am
  ),				
  mileage = mean(mpg)		
)

## ----inline messy function composition which is near impossible to read----
summarise(group_by(select(filter(mtcars, cyl > 4), mpg, hp, am), am), mileage = mean(mpg))

## ----we could create temporary variables but this seems excessive--------
mtcars_filtered <- filter(mtcars, cyl > 4)

## ----pipes allow arguments to be more easily matched to their functions----
mtcars %>%
  filter(cyl > 4) %>% 
  select(mpg, hp, am) %>%
  group_by(am) %>% 
  summarise(mileage = mean(mpg))

## ----using dot as a temporary variable helps show what is happening------
. <- mtcars

## ----the dot is inserted into the first element of the next function-----
. <- filter(., cyl > 4)

## ----the dot is again inserted into the first element of the next function----
. <- select(., mpg, hp, am)

## ----the dot is available as a variable in piped calls-------------------
mtcars %>%
  filter(seq_len(nrow(.)) %% 5 == 0) 

## ----a data.frame which we would like to select only part of-------------
my_df <- data.frame(
  x = c(1, 2, 3, 4), 
  y = c("a", "b"),
  z = c(2.1, 9.3, 7.6, 1.1), 
  stringsAsFactors = FALSE
) 

## ----selecting the third row of my_df------------------------------------
my_df[3, ]

## ----selecting rows with rownames----------------------------------------
mtcars["Porsche 914-2", ]

## ----selecting the third column of my_df---------------------------------
my_df[ , 3]

## ----if a single column is selected then a vector is returned when drop is TRUE----
class(my_df[ , 3])

## ----selecting a single row still produces a data.frame------------------
class(my_df[3, ])

## ----overriding the drop argument----------------------------------------
my_df[ , 3, drop = FALSE]

## ----the call looks odd but the additional comma is required-------------
my_df[3, , drop = TRUE]

## ----neglecting the additional comma produces a warning------------------
my_df[3, drop = TRUE]

## ----dollar-name selection from data.frames is very common---------------
my_df$x

## ----replacements behave in the same way as lists------------------------
my_df$z[2] <- 99
my_df

## ----named elements can be replaced--------------------------------------
my_df[1, "x"] <- 99
my_df

## ----entire columns can be added-----------------------------------------
my_df$new_column <- c("red", "blue", "green", "white")
my_df

## ----is.na() tests which values are NA-----------------------------------
x <- c(7, NA, 9, NA)
is.na(x)

## ----a data.frame with some NA values------------------------------------
d_NA <- data.frame(x, y = 1:4)
d_NA

## ----replacing the elements for which the x value is NA------------------
d_NA[is.na(d_NA$x), "x"] <- 0
d_NA

## ----producing a data.frame of which values are NA-----------------------
d_NA <- data.frame(x, y = 1:4)
is.na(d_NA)

## ----replacing the NA elements of an entire data.frame-------------------
d_NA <- data.frame(x, y = 1:4)
d_NA[is.na(d_NA)] <- 0
d_NA

## ----is.na() has a replacement functionality-----------------------------
d_NA <- data.frame(x = 7:10, y = 1:4)
is.na(d_NA$x) <- c(1, 3) 
d_NA

## ----negating is.na() with an exclamation--------------------------------
y <- c(3, 4, NA, NA, 7)
y[!is.na(y)]

## ----testing whether each element satisfies the condition----------------
test_nums <- c(6, 5, 4, 5, 7, 4) 
test_nums > 5

## ----using logical values for selection----------------------------------
goodBad <- c("good", "bad", "good", "good", "bad")
goodBad[c(TRUE, FALSE, TRUE, TRUE, FALSE)]

## ----recycling to select every second value------------------------------
goodBad[c(TRUE, FALSE)]

## ----recycling the length-one "good" and performing the test-------------
goodBad == "good"

## ----selecting based on the vectorised test------------------------------
goodBad[goodBad == "good"]

## ----recycling and comparing---------------------------------------------
mtcars$cyl == 6
# equivalently mtcars[["cyl"]] == 6

## ----selecting all columns but only rows which satisfy the condition-----
mtcars[mtcars$cyl == 6, ]

## ----selecting all columns but only rows which satisfy both conditions----
mtcars[mtcars$cyl == 6 & mtcars$am == 1, ]

## ----selecting based on external information-----------------------------
mtcars[1:8 > 7, ]

## ----seven FALSE followed by one TRUE via recycling----------------------
1:8 > 7

## ----selecting every second column and all rows--------------------------
head(
  mtcars[, c(FALSE, TRUE)]
)

## ----selecting columns starting with c or p and all rows-----------------
head(
  mtcars[, startsWith(colnames(mtcars), "c") | endsWith(colnames(mtcars), "p")]
)

## ----identifying column names starting with c----------------------------
startsWith(colnames(mtcars), "c")

## ----identifying the indices of column names starting with c-------------
which(startsWith(colnames(mtcars), "c"))

## ----selecting the column names based on their index itself based on a comparison----
colnames(mtcars)[which(startsWith(colnames(mtcars), "c"))]

## ----using dplyr to select columns starting with c-----------------------
mtcars %>% 
  select(starts_with("c")) %>% 
  head()

## ----using dplyr to select columns using a regex-------------------------
mtcars %>%
  select(matches("^c|p$")) %>% 
  head()

## ----a fivenum summary of a numeric vector-------------------------------
summary(3:9)

## ----the mean is not necessarily equal to the median---------------------
set.seed(1)
summary(rlnorm(10))

## ----characteristics of a character vector-------------------------------
summary(letters)

## ----counts in each factor level-----------------------------------------
summary(iris$Species)

## ----multiple fivenum summaries------------------------------------------
summary(iris[ , 3:5])

## ----producing a data.frame with some missing values---------------------
mtcars_NA <- mtcars[, 1:4] 

mtcars_NA[1, 4] <- NA 
mtcars_NA[2, 3] <- NA 
mtcars_NA[3, 4] <- NA 
mtcars_NA[4, 1] <- NA 
mtcars_NA[4, 3] <- NA 

head(mtcars_NA)

## ----counting missing elements in each column----------------------------
summary(mtcars_NA)

## ----calculating the mean of each column---------------------------------
aggregate(x = iris[, -5], by = list(Species = iris$Species), mean)

## ----formula interface to aggregate--------------------------------------
aggregate(formula = . ~ Species, data = iris, FUN = mean)

## ----the mean() function applied to a column of data (a vector)----------
mean(mtcars$mpg)

## ----using summarise to apply a function over the rows of mtcars---------
library(dplyr)
summarise(mtcars, mileage = mean(mpg))

## ----as.numeric() will return a vector not a data.frame------------------
as.numeric(summarise(mtcars, mileage = mean(mpg)))

## ----the pipe can clean up this code a little----------------------------
library(dplyr)
mtcars %>%
  summarise(mileage = mean(mpg)) %>%
  as.numeric()

## ----no data were harmed in the production of this value-----------------
mtcars %>% 
  filter(am == 0) %>%
  summarise(mileage = mean(mpg)) %>%
  as.numeric()

## ----we can modify the pipe sequence by commenting out a line------------
mtcars %>% 
#   filter(am == 0) %>%  
  summarise(mileage = mean(mpg)) %>%
  as.numeric()

## ----try it yourself (1)-------------------------------------------------
max(mtcars[mtcars$am == 1, "wt"])

## ----try it yourself (2)-------------------------------------------------
mtcars %>%
  filter(am == 1) %>%
  summarise(max(wt)) %>%
  as.numeric()

## ----try it yourself (3)-------------------------------------------------
min(mtcars[mtcars$am == 0, "wt"])

## ----try it yourself (4)-------------------------------------------------
mtcars %>%
  filter(am == 0) %>%
  summarise(min(wt)) %>%
  as.numeric()

## ----try it yourself (5)-------------------------------------------------
mean(mtcars[mtcars$cyl == 6, "disp"])

## ----try it yourself (6)-------------------------------------------------
mtcars %>%
  filter(cyl == 6) %>%
  summarise(mean(disp)) %>%
  as.numeric()

## ----try it yourself (7)-------------------------------------------------
mean(mtcars[mtcars$cyl == 4, "disp"])

## ----try it yourself (8)-------------------------------------------------
mtcars %>%
  filter(cyl == 4) %>%
  summarise(mean(disp)) %>%
  as.numeric()

## ----try it yourself (9)-------------------------------------------------
aggregate(
  x = mtcars[ , "disp", drop = FALSE],
  by = list(cyl = mtcars$cyl),
  FUN = mean
)

## ----try it yourself (10)------------------------------------------------
mtcars %>%
  group_by(cyl) %>%
  summarise(mean_disp = mean(disp))

## ----turning off the partial matching warning, include = FALSE-----------
options(warnPartialMatchDollar = FALSE)

