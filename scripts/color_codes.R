# install and load Hadley Wickam's rvest package
# install.packages("rvest")
library(rvest)

# specify webpage we are scraping data from
url <- "http://www.december.com/html/spec/colorcodescompact.html"

# specify the css selector that contains the data we are interested in
# in our case, the css selector is 'table'
color_codes <- url %>%
  read_html() %>%
  html_nodes("table") %>%
  html_table(fill = TRUE)

#convert the list of scraped data into a data frame
color_codes <- as.data.frame(color_codes)

#save the resulting data frame as a csv file
write.csv(color_codes, file = "data/color_codes.csv")
