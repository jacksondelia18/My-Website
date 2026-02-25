#tidyverse
###

#readr - data management

#dplyr - data wrangling
#tidyr
#stringr

#ggplot2 - data visualization
install.packages("sqldf")
library(sqldf)



##############################
#Dplyr used for data maniipulation nad structuring data frames
#useful functions: filter, arrange, select, summarize, group_by, and mutate

library(tidyverse)
#to specify the package youre using, call on the package name to avoid masking issues
dplyr::filter()
#v
stats::fiter()

data(starwars)
class(starwars)

head(starwars)
tail(starwars)
glimpse(starwars)

#cleaning up the data
#base r has camplete.cases, removes any rows with any NAs

starwars_clean <- starwars[complete.cases(starwars[,1:10]),]
is.na(starwars_clean[,1]) #an na in each row?
anyNA(starwars_clean[,1:10]) #any NAs in the enitre data set?

#filter function, subets observations by their values
#uses logical ooperators: <, >, <=, >=, ==, !, &, |

shortMen <- filter(starwars_clean, gender=="masculine" & height < 180)
filter(starwars_clean, gender=="masculine" & height < 180, height > 100)

filter(starwars, eye_color %in% c("blue", "brown")) 
#%in% filters for mutliple different conditions

#arrange reorders rows
arrange(starwars_clean, by=height)
arrange(starwars_clean, by=desc(height))
#additional columns will break ties in preceding columns

#select cjooses variables based on thier names / columns

starwars_clean[1:10,]
select(starwars_clean, 1:10) #these two do the same thing
select(starwars_clean, name:homeworld)
select(starwars_clean, -(films:starships)) #list everyting except these variables

#rearrange columns
select(starwars_clean, homeworld, name, gender, species, everything())
#list homeworld, name, gender, species first then list everything else

select(starwars_clean, contains("color"))

#rename columns
select(starwars, HairColor=hair_color) #actual name of column comes after stating the new name you want

#create a new column
y <- mutate(starwars_clean, ratio=height/mass)

pounds <- mutate(starwars_clean,  mass_lbs=mass*2.2)
#convert mass to pounds in new column

transmute(starwars_clean,  mass_lbs=mass*2.2)
#creates a single column with the new variable rather than adding it to the data frame



#summarize and groupby function collapse many values into a single summary
summarize(starwars_clean, meanHeight=mean(height))
#will only work with clean data sets

summarize(starwars, meanHeight=mean(height, na.rm=TRUE), TotalNumber=n())
#removes nas from the data

#using groupby for additional calculations
gender <- group_by(starwars, gender)
summarize(gender, meanHeight=mean(height, na.rm=TRUE), number=n())


#pipe statements, using a pipe operator: %>% or |>
#essentially means "and then..."

#passes intermediate results onto next functions in sequence
#avoid when need to manipulate more than one object, or if there are meaningful intermediate objects

starwars_clean%>%
  group_by(gender)%>%
  summarize(meanHeight=mean(height, na.rm=TRUE), number=n())


starwars_clean%>%
  mutate(sp=case_when(species=="Human"~"Human", TRUE ~ "Non-Human"))%>%
  select(name, sp, everything())
unique(starwars_clean$species)


glimpse(starwars_clean)

#Pivoting from wide to long format
#pivot_wider
#pivot_longer

wideSW <- starwars_clean%>%
  select(name, sex, height)%>%
  pivot_wider(names_from=sex, values_from=height, values_fill=NA)
wideSW

PivotSW <- starwars%>%
  select(name, homeworld)%>%
  group_by(homeworld)%>%
  mutate(rn=row_number())%>%
  ungroup()%>%
  pivot_wider(names_from=homeworld, values_from=name)
PivotSW


wideSW%>%
  pivot_longer(cols=male:female, names_to="sex", values_to="height", values_drop_na=TRUE)

