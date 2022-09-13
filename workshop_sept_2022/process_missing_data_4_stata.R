library(haven)

df <- haven::read_dta("dataset1.dta")

for (colname in names(df)) {
  if (is.character(df[[colname]])) {
    df[[colname]] <- as.factor(df[[colname]])
  }
}

df <- mtcars

haven::write_dta(df, "dataset1.dta")
df <- haven::read_dta("dataset1.dta")

write.csv(df,"dataset1.csv", row.names = FALSE)

library(xlsx)
write.xlsx(df,"dataset1.xlsx", row.names = FALSE)