set more off

capture noisily {
/*RSTATA: cut me here*/
import delimited ./data/dataset1b.csv
/*RSTATA: cut me here*/
} /* end capture noisily */
saveold RStataDataOut, version(12)
exit, clear STATA
