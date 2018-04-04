This Color Codes Data Package is extracted from http://www.december.com/html/spec/colorcodescompact.html.


## Data

The color codes data resource in this data package is a CSV file with 1100+ rows, scraped from the http://www.december.com/html/spec/colorcodescompact.html web page. Here's a snippet of the final color codes data resource:

| Color.Name           | Hex.Code | Dec.Code           | X.Code              | HSL.Code          | CMYK.Code                |
|----------------------|----------|--------------------|---------------------|-------------------|--------------------------|
| flatpink (Safe Hex3) | #FFCCCC  | rgb(255, 204, 204) | rgb(100%, 80%, 80%) | hsl(0, 100%, 90%) | cmyk(0%, 20%, 20%, 0%)   |
| snow (SVG)           | #FFFAFA  | rgb(255, 250, 250) | rgb(100%, 98%, 98%) | hsl(0, 100%, 99%) | cmyk(0%, 2%, 2%, 0%)     |
| bing cherry          | #A02422  | rgb(160, 36, 34)   | rgb(63%, 14%, 13%)  | hsl(1, 65%, 38%)  | cmyk(0%, 77%, 79%, 37%)  |
| bacon                | #C65D57  | rgb(198, 93, 87)   | rgb(78%, 36%, 34%)  | hsl(3, 49%, 56%)  | cmyk(0%, 53%, 56%, 22%)  |
| chili                | #D44942  | rgb(212, 73, 66)   | rgb(83%, 29%, 26%)  | hsl(3, 63%, 55%)  | cmyk(0%, 66%, 69%, 17%)  |
| watermelon pulp      | #F2473F  | rgb(242, 71, 63)   | rgb(95%, 28%, 25%)  | hsl(3, 87%, 60%)  | cmyk(0%, 71%, 74%, 5%)   |
| cadmiumreddeep       | #E3170D  | rgb(227, 23, 13)   | rgb(89%, 9%, 5%)    | hsl(3, 89%, 47%)  | cmyk(0%, 90%, 94%, 11%)  |
| red delicious apple  | #9D1309  | rgb(157, 19, 9)    | rgb(62%, 7%, 4%)    | hsl(4, 89%, 33%)  | cmyk(0%, 88%, 94%, 38%)  |
| mistyrose3           | #CDB7B5  | rgb(205, 183, 181) | rgb(80%, 72%, 71%)  | hsl(5, 19%, 76%)  | cmyk(0%, 11%, 12%, 20%)  |
| cola                 | #AF4035  | rgb(175, 64, 53)   | rgb(69%, 25%, 21%)  | hsl(5, 54%, 45%)  | cmyk(0%, 63%, 70%, 31%)  |
| piglet snout         | #ECC3BF  | rgb(236, 195, 191) | rgb(93%, 76%, 75%)  | hsl(5, 54%, 84%)  | cmyk(0%, 17%, 19%, 7%)   |
| gummi red            | #FC1501  | rgb(252, 21, 1)    | rgb(99%, 8%, 0%)    | hsl(5, 99%, 50%)  | cmyk(0%, 92%, 100%, 1%)  |
| bloodorange (Hex3)   | #CC1100  | rgb(204, 17, 0)    | rgb(80%, 7%, 0%)    | hsl(5, 100%, 40%) | cmyk(0%, 92%, 100%, 20%) |
| mistyrose2           | #EED5D2  | rgb(238, 213, 210) | rgb(93%, 84%, 82%)  | hsl(6, 45%, 88%)  | cmyk(0%, 11%, 12%, 7%)   |
| salmon (SVG)         | #FA8072  | rgb(250, 128, 114) | rgb(98%, 50%, 45%)  | hsl(6, 93%, 71%)  | cmyk(0%, 49%, 54%, 2%)   |
| mistyrose (SVG)      | #FFE4E1  | rgb(255, 228, 225) | rgb(100%, 89%, 88%) | hsl(6, 100%, 94%) | cmyk(0%, 11%, 12%, 0%)   |
| mistyrose4           | #8B7D7B  | rgb(139, 125, 123) | rgb(55%, 49%, 48%)  | hsl(7, 6%, 51%)   | cmyk(0%, 10%, 12%, 45%)  |
| fuji apple           | #D66F62  | rgb(214, 111, 98)  | rgb(84%, 44%, 38%)  | hsl(7, 59%, 61%)  | cmyk(0%, 48%, 54%, 16%)  |
| red roof             | #C75D4D  | rgb(199, 93, 77)   | rgb(78%, 36%, 30%)  | hsl(8, 52%, 54%)  | cmyk(0%, 53%, 61%, 22%)  |
| orangered            | #FF2400  | rgb(255, 36, 0)    | rgb(100%, 14%, 0%)  | hsl(8, 100%, 50%) | cmyk(0%, 86%, 100%, 0%)  |
| burntumber           | #8A3324  | rgb(138, 51, 36)   | rgb(54%, 20%, 14%)  | hsl(9, 59%, 34%)  | cmyk(0%, 63%, 74%, 46%)  |
| tomato3              | #CD4F39  | rgb(205, 79, 57)   | rgb(80%, 31%, 22%)  | hsl(9, 60%, 51%)  | cmyk(0%, 61%, 72%, 20%)  |
| tomato2              | #EE5C42  | rgb(238, 92, 66)   | rgb(93%, 36%, 26%)  | hsl(9, 83%, 60%)  | cmyk(0%, 61%, 72%, 7%)   |
| safety cone          | #FF5333  | rgb(255, 83, 51)   | rgb(100%, 33%, 20%) | hsl(9, 100%, 60%) | cmyk(0%, 67%, 80%, 0%)   |

The R script used to obtain this tabular data from the web page is short as you can see below, and available in the [scripts][/scripts] folder of this data package.

```R
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
```

## Data Preparation

To obtain a local copy of or update the data, you need:

* R v3.4.3 ([installation instructions](https://www.r-project.org/))

* [rvest R library](https://cran.r-project.org/web/packages/rvest/rvest.pdf) by Hadley Wickam


## Licensing

All data on this page is from the color chart work by [John December](http://johndecember.com/). As stated on the website, [the colors and codes are sourced from different pages](http://www.december.com/html/spec/colorlinks.html). Where stipulated, the data is licensed under the [Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/).
Everything else is licensed under the [CC0 Public Domain
Waiver](https://creativecommons.org/publicdomain/zero/1.0/).
