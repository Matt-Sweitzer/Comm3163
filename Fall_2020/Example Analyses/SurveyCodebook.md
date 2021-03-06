# Codebook for <a href="https://github.com/Matt-Sweitzer/Comm3163/raw/master/Fall_2020/Example%20Analyses/ExampleSurveyData.csv">example survey data</a><sup>1</sup>

<sup>1</sup>(right click, save linked file)

This example data set contains 15 imagined survey responses. The goal of this example survey is to determine in which state one should run advertisements for the upcoming professional football season to attract viewers who don't currently watch much professional football. There are two tutorials which use this data set: one for common <a href="https://github.com/Matt-Sweitzer/Comm3163/blob/master/Fall_2020/Example%20Analyses/Spreadsheet_CheatSheet.md">spreadsheet software</a>, and one for <a href="https://github.com/Matt-Sweitzer/Comm3163/blob/master/Fall_2020/Example%20Analyses/JASP_CheatSheet.md">JASP</a>. The JASP software is freely available for download at https://jasp-stats.org.

## Participant

Interval Numeric - identifier to distinguish between responses. Because the sample size (*n*) is 15, there are 15 rows in this data set, each indicating a unique set of responses from one participant.

## Age

Ratio Numeric - answer to the question "What is your age in years?"; only integers allowed.

## State

Nominal Categories - answer to the question "Which state do you currently live in?"; either "Ohio" or "Michigan", as this example assumes that your sampling procedure only included these two states.

## Hours_NCAA

Ratio Numeric - answer to the question "In a typical week during the season, how many hours of college (NCAA) football do you watch on TV?"

## Hours_NCAA_Cat

Ordinal Categories - data transformation (binning) of the Hours_NCAA variable into "Low" (0 to 3 hours), "Medium" (4 to 9 hours), and "High" (10 or more hours). As-is, this variable is incomplete in the provided data; follow the tutorial in "SpreadsheetCheatSheet.md" to complete it.

## Hours_NFL

Ratio Numeric - answer to the question "In a typical week during the season, how many hours of professional (NFL) football do you watch on TV?"

## Hours_NFL_Cat

Ordinal Categories - data transformation (binning) of the Hours_NFL variable into "Low" (0 to 3 hours), "Medium" (4 to 9 hours), and "High" (10 or more hours). As-is, this variable is incomplete in the provided data; follow the tutorial in "SpreadsheetCheatSheet.md" to complete it.

## Total_Hours_Both

Ratio Numeric - summative index of Hours_NCAA and Hours_NFL. As-is, this variable is incomplete in the provided data; follow the tutorial in "SpreadsheetCheatSheet.md" to complete it.

## Avg_Hours_Both

Ratio Numeric - mean index of Hours_NCAA and Hours_NFL. As-is, this variable is incomplete in the provided data; follow the tutorial in "SpreadsheetCheatSheet.md" to complete it.
