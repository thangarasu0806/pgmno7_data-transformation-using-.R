install.packages(&quot;tidyverse&quot;)
library(tidyverse)
install.packages(&quot;dplyr&quot;)
library(dplyr)
t2cases &lt;- filter(table2, type == &quot;cases&quot;) %&gt;% rename(cases = count) %&gt;% arrange(country, year)
t2pop &lt;- filter(table2, type == &quot;population&quot;) %&gt;% rename(population = count) %&gt;% arrange(country,
year)
t2pop
rate &lt;- tibble( year = t2cases$year, cases = t2cases$cases, country = t2cases$country, population =
t2pop$population ) %&gt;% mutate(cases_per_cap = (cases / population) * 10000) %&gt;% select(country,
year, cases_per_cap)
rate &lt;- rate %&gt;% mutate(type = &quot;cases_per_cap&quot;) %&gt;% rename(count = cases_per_cap)
rate
