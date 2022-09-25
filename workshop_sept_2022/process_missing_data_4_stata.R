library(haven)
library(openxlsx)

df1 <- openxlsx::read.xlsx("./data/dataset1.xlsx")

for (colname in names(df1)) {
  if (is.character(df1[[colname]])) {
    df1[[colname]] <- as.factor(df1[[colname]])
  }
}

haven::write_dta(df1, "./data/dataset1.dta")

df11 <- haven::read_dta("./data/dataset1.dta")
write.csv(df11,"./data/dataset1.csv", row.names = FALSE)

df2 <- haven::read_dta("./data/dataset2.dta")
#write.csv(df2,"./data/dataset2.csv", row.names = FALSE)

for (colname in names(df2)) {
  if (is.character(df2[[colname]])) {
    df2[[colname]] <- as.factor(df2[[colname]])
  }
}

haven::write_dta(df2, "./data/dataset2.dta")