*******************************************************************************
*      REPRODUCIBLE REPORTING LEARNING - JULY, 2022
*******************************************************************************

cd "Set your working directory here"

*** NB putdocx allows appending of files, therefore a master word file with 
* Headers and all style formatting can be created (ilable in aaailversion 17)

use "data used", clear

* Specify version for reproducible report
version 15 // For reproducible reporting

* Starting a word file
putdocx begin, font(12) 

putdocx paragraph, style(Heading1) halign(center)
putdocx text ("TIMCI Data Quality Report, STATA"), bold font(15)

putdocx paragraph, halign(center) 
putdocx text ("Ifakara Health Institute (IHI)"), font(12 black)
putdocx paragraph, halign(center)
putdocx text ("`c(current_date)' `c(current_time)' EAT"), font(11)

putdocx paragraph, style(Title)
putdocx text ("1 Table of Contents")

putdocx paragraph
putdocx image logo.png

putdocx sectionbreak

putdocx paragraph, style(Title)
putdocx text ("2 Context")

putdocx paragraph, style(Heading2)
putdocx text ("2.1 Dates")

putdocx paragraph
putdocx text ("• Facility data collection start: ")
putdocx text ("2022-03-28"),bold
putdocx paragraph
putdocx text ("• SPA data collection start: ")
putdocx text ("2022-04-11"),bold
putdocx paragraph
putdocx text ("• Database lock: ")
putdocx text ("2022-06-28 (week 14 of the collect)"),bold

putdocx paragraph, style(Heading2)
putdocx text ("2.2 Study Facilities")

preserve
duplicates drop fid, force
list district facility fid
return list

putdocx paragraph
local nf = `r(N_drop)'-`r(N)'
putdocx text ("Data collection was planned in `nf' facilities")
putdocx table facilities=data(district facility fid), varnames width(60%)
putdocx table facilities(2,.), drop 
putdocx table facilities(1,.), bold


putdocx paragraph, style(Heading2)
putdocx text ("2.3  Facility / device correspondence")
putdocx paragraph
putdocx text ("Data collection has been done using `nf' tablets")
putdocx table device=data(deviceid facility fid), varnames width(60%) 
putdocx table device(1,.), bold

restore

table district
return list

regress illnessduration  a3_a_3 i.b1_5
putdocx paragraph, style(Heading2)
putdocx text ("2.4 Adding model results using putdocx")
putdocx table regt=etable, title("Multiple linear regression results") headerrow(2) note("Source RCT data 2022")
putdocx table regt(4,.), drop 
putdocx table regt(2,.), shading(lightgray)

putdocx save output, replace



