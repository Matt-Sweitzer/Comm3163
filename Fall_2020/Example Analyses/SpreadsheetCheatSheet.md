<h1 align="center"><strong>Descriptive and Summary Analysis<br>Using Spreadsheets</strong></h1>

  <h3 align="center">Author: Matthew Sweitzer<br>Email: <a href="mailto:sweitzer.34@osu.edu">sweitzer.34@osu.edu</a><br>Website: <a href="https://www.matthewsweitzer.com">matthewsweitzer.com</a></h3>

<hr>

This document is meant to guide you through some of the basic functions in spreadsheet editing software, like Microsoft Excel, Google Sheets, Apple Numbers, or Libre Calc. The tutorial and linked example data are offered under the terms of the <a href="https://creativecommons.org/licenses/by/4.0/legalcode">Creative Commons - Attribution</a> license. That means you may use, share, or change it in any way you like -- just make sure that you credit the author if you publish this elsewhere.

This tutorial relies on an example data set of 15 imagined survey responses. The goal of this example survey is to determine in which state one should run advertisements for the upcoming professional football season to attract viewers who don't currently watch much professional football. This tutorial focuses on descriptive and summary statistics, but I will return to this in a separate tutorial on inference.

The codebook for this imagined survey is available <a href="https://github.com/Matt-Sweitzer/Comm3163/blob/master/Fall_2020/Example%20Analyses/Codebook.md">here</a>. Users of Microsoft Excel, Google Sheets, Apple Numbers, or Libre Calc should all be able to open the .xlsx file containing the data, which is available <a href="https://github.com/Matt-Sweitzer/Comm3163/blob/master/Fall_2020/Example%20Analyses/ExampleData.xlsx">here</a>. However, because references to other sheets in Numbers follows a different formatting structure, it's recommended that Apple users follow along using the .numbers file available <a href="https://github.com/Matt-Sweitzer/Comm3163/blob/master/Fall_2020/Example%20Analyses/ExampleData.numbers">here</a>.

As a general rule of thumb, I recommend maintaining the data on one sheet in your file, and running all of your summary analyses (aside from data transformations) on a separate sheet. That way, you are least likely to delete or alter any data. Remember: the results you get are only as good as the data you provide your software. Following proper "data hygiene" is an essential part of research.

<hr>

## Data Structure

Data from a survey represent a collection of responses from a variety of study participants to a series of survey questions. The results that we get from a study are put into a special format called a "data frame". This frame, much like a picture frame, is rectangular in shape. If you conduct your survey using any of the common online platforms, such as Survey Monkey or Qualtrics, chances are that your data will be in this format when you go to download it. If you are collecting your survey responses on paper, such as with an intercept or mail survey, you will likely need to manually enter your data into a frame format in order to use a computer for your analyses.

Even though a data frame is rectangular in shape, it's actually made up of a series of rows and columns, or a "matrix". Each "cell", given by a unique combination of row (horizontal) and column (vertical), represents a single data point -- a response by one participant to one question. Let's take a look at the matrix provided in the example data:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/DataFrame.png", width=90%> </center>

#### Rows == Participants

In this data frame, we have 16 rows, each marked with a number 1 through 16. The top row, or 1, is what's called a "header". This header contains the names for each of the variables in our study. The rows below the header (2 through 16) each represent a single participant in our study. In other words, all of the data points contained in row 2 are responses collected from the first survey participant; all of the data points contained in row 3 are responses collected from the second survey participant -- and so on.

#### Columns == Variables

The data frame also contains 9 columns, marked by capital letters A, B, C, ... I. Each column represents a unique variable in our study. The first one (column A) does not represent responses to a survey question, but contains a number from 1 to 15 to help us identify the unique participant that the row represents. Although this is not technically necessary in a study where each participant provides answers only once (cross-sectional), if we had a longitudinal study where we give the survey to the same respondents at multiple points in time, this can be a really useful way to show that those multiple rows in the data belong to the same person.

*Note*: If we had more than 26 variables in our data, most spreadsheet software would start using two letters to identify columns; e.g., "AA", "AB", "AC", ... "ZZ". If you have more than 702 variables, the programs will use three letters; "AAA", "AAB", "AAC", ... "ZZZ" -- and so on.

#### Referencing Data Points

When we want to "call", or refer to, certain cells in a function, we'll use the letter followed by the number. For example, `C10` will tell us what State participant 9 is from -- Michigan. When we want to refer to a collection of data points, we need three things: a starting point, and ending point, and a colon (`:`) separating them. For example, `A2:I2` would give us all of the data points pertaining to participant 1. Likewise, `B2:B16` would give us all of the ages for all 15 participants.

Although uncommon, you can also refer to a "rectangle" of data, rather than using a single row or column. Your starting point should be the top-left corner of the rectangle and your ending point should be the bottom-right corner of the rectangle. `D7:E9` would give us both the Hours_NCAA and Hours_NCAA_Cat for participants 6, 7, and 8.

<hr>

## Variable Transformation

One of the most important functions of spreadsheet software is the ability to transform data from one form to another. In this example, we're going to look at how to transform a ratio numeric variable into a set of ordinal categories. This is a common practice of data simplification, called "binning", which can ease the interpretation of results.

>Let's say, for example, that we want to distinguish between high, medium, and low viewership of college football among our sample. While the Hours_NCAA variable tells us *exactly* how much our participants watch in a typical week, it looks like it's quite varied. To simplify matters, let's classify all participants who watch between 0 and 3 hours as "Low", all participants who watch between 4 and 9 hours as "Medium", and all users who watch more than 9 hours as "High".

Variable transformations, in most circumstances, should take place on the same "sheet" as the original data points. Sheets are a way for the software to compartmentalize your work. They appear as tabs in the user interface -- they are along the bottom in Microsoft Excel, Google Sheets, and Libre Office, while Apple Numbers places these tabs along the top. There are two sheets in the example data linked above: "Survey_Results" and "Analyses". Since our original data appears on the "Survey_Results" sheet, we'll add our new transformations to this sheet.

#### Column Addition

I have already added new columns for the categorical transformations we'll talk about today -- columns E and G. However, if you would like to add your own, it's quite simple:

* On Excel, highlight the column that is one to the right of the original variable you would like to transform by clicking on the column letter at the top of the user interface. From the menu, select "Insert", then "Columns".

* On Google Sheets, hover your mouse over the cell that contains the column letter until a small arrow in a box appears and click the arrow. From the drop-down menu, select "Insert 1 right".

* On Libre Calc, highlight the entire column containing the original variable by clicking on the column letter. Then from the menu, select "Sheet", then "Insert Columns", then select "Columns After".

* On Apple Numbers, first click anywhere inside the data frame to bring up the markers on the top and left to indicate columns and rows (respectively). Then hover your mouse over the column letter until a downward arrow appears and click the arrow. From this menu, select "Add Column After".

#### New Variable Naming

Once we have a new column for our new variable, we need to make sure to name the variable in the header. In `E1` you can see that I named this new variable "Hours_NCAA_Cat". It's really important that when you name variables, this new name helps you remember what that variable means. In this case, I'm using the suffix "_Cat" to indicate that this is a categorical tranformation of the variable "Hours_NCAA". If you are creating your own codebook, or dictionary, for your data, don't forget to add the new variable in the same position in the order!

#### Functions

Then, the next step will be to fill the column with new data. To accomplish this, we could just fill it in manually. This might be easy enough for 15 participants. However, with larger data sets or tired eyes, it's easy to make a mistake. Luckily, we can use the software to help "automate" this process. This automation occurs in the software through something called a "function" (sometimes called "formula"). Functions are a set of rules that are applied with some input to produce a desired output. In our case, we want to take our input of the number of hours of NCAA football watched and output one of "Low", "Medium", or "High", depending on what the input is.

Functions generally follow the same format in all spreadsheet software: `=FUNCTION()`. The `=` tells the software "I want the cell I'm editing to equal...". `FUNCTION` provides the name of the function in all caps (e.g., `SUM`, `AVERAGE`, `IF`). There are a wide variety of functions available to users -- I recommend searching Google, or perusing the menus in your software of choice. Finally, the parentheses `()` are a "wrapper" around the input that the function expects. The input(s) may also be referred to as "parameter(s)". Often when you begin typing your function name, the software will show you a little example of what the function expects for the parameters (Sorry Apple users! Numbers uses the same parameters as the others, but does not show the example). It will definitely take some practice to get comfortable with functions.

#### The `IF` Function

The function we'll use for binning is called `IF`. Let's start by typing the basic function format into the first empty cell of our new column: type `=IF()` into `E2`.

`IF` is a common function across much of computer programming, and you can think of it like a simple test -- IF X is true, do Y, otherwise Z. You could apply this concept to a lot of things in life:

>* If the traffic light turns green, take my foot off the brake and step on the gas, otherwise keep my foot on the brake.

>* If the bread has mold on it, throw it away and buy new bread, otherwise it's safe to make the sandwich

>* If you are having trouble following the course content, email the professor, otherwise keep doing what you're doing

In the spreadsheet software, we need to provide these `IF` functions with 3 parameters inside the `()` wrapper. To let the function know that we're done typing one parameter and starting another, we'll separate these with commas `,`.

The first parameter `IF` needs is our test. In our case, we want to see if the cell from the same row in the Hours_NCAA column (`D`) is a certain value. Let's start with the "Low" category. We want `E2` to equal "Low" if `D2` is less than or equal to 3. For the test "less than or equal to", these software use `<=` -- search Google for "Excel Comparison Operators" for a complete list. Now we just need to put the cell reference, `D2`, and the number 3 on either side of that test; type `D2<=3` inside the parentheses in the cell `E2`.

The second parameter the `IF` function needs is what to do when the test is true. This is easy -- we want `E2` to show the text "Low" when `D2<=3`, so put a comma followed by `"Low"` inside the parentheses in `E2`. Don't forget the quotation marks!

The third parameter the `IF` function needs is what to do when the test is false. This is really tricky, because we still have two categories left! We need to discern between people who watch between 4 and 9 hours, "Medium", and people who watch more than 9 hours, "High". To accomplish this, we'll need to run another `IF` test, so for now put a comma followed by `IF()` inside the parentheses in `E2`. We'll fill this new set of parentheses in the next step.

#### Nested `IF` Functions

Sometimes in programming, or in life, we want to run a different test when the first test fails.

>Imagine you are walking along one day and you come upon a street magician. On the sidewalk in front of them are three plastic cups that are all face down. The magician places a small rubber ball underneath one of the cups and shuffles the cups on the ground. They tell you that if you can pick which cup contains the ball, they will give you $20. And they're feeling really generous -- they'll give you two chances to pick the right cup. You think it over for a second and you decide to pick the cup on your left. If that cup has the ball in it, then you win $20. If that cup does not have the ball in it, then you need to decide again between the two remaining cups. The first cup did not contain the ball, so now you devise a second test. You think it over and select the cup on your right. If the ball is in this cup, then you get $20. If the ball is not in this cup, then the game is over and you have not won any money. Lucky for you, the ball WAS in the right cup, and you walk away with $20.

To run a second test when the first one fails in spreadsheets, we need to do something called "nesting" in computer science. This means putting a function inside of a function, kind of like nesting dolls. In this case, we want to run a second `IF` test when the first one fails.

Inside this second `IF` test, we again need 3 parameters. For the first parameter, we need our new test. We're still checking the number of hours of college football, so type `D2` inside the nested parentheses. Now, for the value, our second test is checking to see if a person watches between 4 and 9 hours. Now because everyone who watches less than 4 hours passed the first test, we don't need to worry about writing the lower part of that test. So just add `<=9` to the first parameter.

For the second parameter, add a comma and then type `"Medium"` -- this is the ordinal category which represents 4 to 9 hours. And now for the third parameter, let's consider what's left from our two tests: If the value in column `D` failed the first test, it must be greater than 3. If the value in column `D` then also failed the second test, that must mean it's also greater than 9. And as luck would have it, that's exactly what the "High" category describes! So add a comma and `"High"` inside the nested parentheses. We're done with our formula, so hit Enter on your keyboard (or "done" or "&check;" on your iPad) and it should fill in the correct category. If you encounter an error, double check your syntax; `E2` should contain `=IF(D2<=3, "Low", IF(D2<=9, "Medium", "High"))`.

#### Expanding the Functions

Now, you could write this new function we just created in every single cell down our new column. But that kind of defeats the purpose of having the function, right? So now we need to tell the spreadsheet software to expand this function to fill the rest of the column.

There are several ways of doing this, depending on which software and hardware you are using:

* **MS Excel, Google Sheets, and Libre Calc users**: click on the cell we just created in the step above. In the bottom-right corner of this cell, you should see a little square. Hover your mouse over that square until you see your cursor turn into a "+" sign (Note: in Excel, it will turn from a white "+" to a black "+" when you are hovering properly). Then, either:
  * Click and drag down the column to the desired row and release, or
  * Double click the square to fill the whole column down to the last complete row in the data frame


* **Apple Numbers** is very similar, but it's a little harder to spot. First, click on the cell containing the new formula. Then hover your mouse over the bottom of the cell near the middle. You should see a little golden circle appear. When you hover over that, your cursor should turn into two small arrows, one up and one down. Click and drag down the column to the desired row and release. Numbers does not have the double-click function.


* **iPad Users**:
  * Excel: tap the cell with the completed function until the contextual menu shows up. Select "Fill", and then drag the green selection rectangle to cover the column.
  * Sheets: first tap the cell with the completed function once, then tap again and drag down to the bottom of the column (row 16). Then tap once more to bring up the contextual menu and select "Autofill".
  * Numbers: tap the cell with the completed function twice to bring up the contextual menu. Then select "Cell Actions...", and then "Autofill Cells". Then drag the bottom of the golden rectangle down the column until you reach the bottom of the frame.

Notice that the functions in the cells we just expanded to are somewhat different. For example, the cell in `E3` references `D3` instead of `D2`; `E4` references `D4` -- and so on. Spreadsheet software are generally pretty good at figuring out what you were trying to accomplish in expanding the first cell, but sometimes it doesn't work as well. Always double check a few cells to make sure they're correct!

<hr>

## Indices

Indices are another useful type of variable transformation; they combine multiple measures into one single measure. This can help you with content validity if those individual variables measure different components of a broad concept. It may also help expedite some of your inferential analyses, which we'll talk about later on this semester.

There are two main types of indices: sums and means

#### Summative Index

A summative index, or sum, is exactly like it sounds: you simply add up the variables together.

>From our football data, let's imagine that we're interested in the total number of hours spent watching football at any level. This could be useful information for advertisers during any football programming, as we could use that to infer how many ads people are exposed to. If someone watches double-digit hours of football, they're watching multiple games, perhaps across different channels or levels of play.

To make a sum index, we'll use the column `H` in our data frame. Let's call this variable "Total_Hours_Both". Cell `H2` should represent participant #1's Hours_NCAA (`D2`) *plus* their Hours_NFL (`F2`). We can do this in one of two ways:
  * We can add them like we would in mathematical notation: `=D2+F2`
  * We can use the `SUM` function and provide `D2` and `F2` as parameters: `=SUM(D2, F2)`

Once you have that sum calculated in `H2`, expand that function down the rest of the column to fill in the index for the other participants.

#### Mean Index

A mean index is somewhat similar to a summative index, only instead of adding up the values, we'll take the average of them. Averaging is probably more useful when you have three or more variables, as opposed to two, but the principles of the formula construction should translate easily to indices of any size.

We'll use column `I` in the data frame for the mean index, and let's call the new variable "Avg_Hours_Both". Cell `I2` should represent participant #1's Hours_NCAA (`D2`) *plus* their Hours_NFL (`F2`), *divided by* the number of variables in our index (2). Again, we can accomplish the function in one of two ways:
  * With mathematical notation: `=(D2+F2)/2`
  * With the `AVERAGE` function and with `D2` and `F2` as parameters: `=AVERAGE(D2, F2)`


Finally, let's expand the cell to fill the column. A quick formatting note before we move to summary statistics: APA and others often expect to see two significant digits reported on all means. To get your software to do the rounding for you:
  * **MS Excel, Google Sheets, and Libre Calc**: there is a pair of buttons along the top toolbar that shows an arrow pointing in one direction and either expanding or contracting the number of 0's after the decimal place. Select the cell(s) you would like to format then click these buttons until you see the desired number of digits.
  * **Apple Numbers**: Select the cell or cells you would like to round. In the top-right corner of the window, click the button with the paintbrush icon. Click the tab marked "Cell", then click the up or down arrows on the box next to "Decimals:" until you reach the desired number of digits.

<hr>

## Referencing the Data sheet from the Analysis sheet

For the remainder of this tutorial, we're going to be working on the second sheet titled "Analyses". As mentioned above, I strongly encourage you to use a separate sheet for any kind of summary analysis that does not involve transformation. This will help prevent a lot of common accidents in data deletion or unwanted transformation.

Also mentioned above are the techniques for referencing values in the sheet -- for example, we used `D2` to make the transformation in `E2`. That format only works when the function and the referenced cell are on the same sheet, though. Now that we're working on the "Analyses" sheet, we'll need a way to reference data contained on the "Survey_Results" sheet. This follows a different format, depending on which software you are using:

* References to other sheets follow the same format in both MS Excel and Google Sheets: `SheetName!Cell(s)`
  * If we wanted to see what State participant 6 is from, we could use `=Survey_Results!C7`
  * If we wanted to refer to all participants' ages, we could use `Survey_Results!B2:B16`


* References to other sheets in Libre Calc follow the format `$SheetName.Cell(s)`
  * If we wanted to see what State participant 6 is from, we could use `=$Survey_Results.C7`
  * If we wanted to refer to all participants' ages, we could use `$Survey_Results.B2:B16`


* References to other sheets in Apple Numbers can use the format `SheetName::TableName::VariableName` OR `SheetName::TableName::Cell(s)`. "TableName" can be set by the user and you can have multiple tables on the same sheet. In the example data available in the .numbers file linked above, all of the data appear on a table named "Data". If you created a new file, I believe the default is just "Table 1".
  * If we wanted to see what State participant 6 is from, we could use `=Survey_Results::Data::C7`
  * If we wanted to refer to all participants' ages, we could use EITHER `Survey_Results::Data::B2:B16` OR `Survey_Results::Data::Age`


With this in mind, let's start building our summary statistics. I have completed examples on the left-hand side of the "Analyses" sheet, and you may follow along or build your own on the right-hand side.

<hr>

## Frequency Tables

Frequency tables are a useful summary tool, especially for categorical variables, as they show how many times each unique value appears in the whole data set. Each row in the table represent a unique value in the variable. These tables have two or three columns:
  * *n*, or the raw count (number) of observations with that value
  * the percentage of all observations with that value, and
  * (if ordered) the cumulative percentage, indicating what proportion of the total observations have that exact value OR MORE/LESS (depending on order)


Before we dive in, let's look at one example:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/FreqTable.png", width=80%> </center>

<br>
In the provided example, we'll work through a frequency table of the newly-created Hours_NCAA_Cat variable

#### *N*

For this first column, we need to count the number of times each value of the Hours_NCAA_Cat appears. Those values again are "Low", "Medium", and "High".

To fill these three cells, we'll use the function `COUNTIF`. This function counts the number of times a set of data points passes a test. It takes two parameters:
  * The reference cell(s)
  * What the values in those cells should equal to be counted

In the cell `B3` on the "Analyses" sheet (B2 for Numbers users), we'll want to count the number of times "Low" appears in the `E2:E16` cells on the "Survey_Results" sheet. Start by typing our function in the `B3` cell: `=COUNTIF()`. Then for the first parameter, we'll need to use the sheet reference described above:
  * **MS & Google**: `Survey_Results!E2:E16`
  * **Libre Calc**: `$Survey_Results.E2:E16`
  * **Apple Numbers**: `Survey_Results::Data::E2:E16` or `Survey_Results::Data::Hours_NCAA_Cat`


Then for the second parameter, let's provide what values we would like counted. For the `B3` cell in "Analyses", this should be `"Low"`. So your overall function should look like: `=COUNTIF(Survey_Results!E2:E16, "Low")`.

To fill out the other two cells in the column, we can use the exact same formula and just change the test value. For `B4` (B3 in Numbers), we'll use `"Medium"` in our test, and for `B5` (B4 in Numbers), we can simply substitute `"High"`.

Before we move to percent, take a look at your n column. Now go back and delete a few of the cells in the Hours_NCAA_Cat column (we can fill them back in later with expansion). Go back to the "Analyses" sheet -- the n column changed! Spreadsheets can handle additions or changes to the data quite easily!

#### Percent

The percent column should tell you what proportion of your total sample have a certain value for your variable of interest. Percentages are relatively easy to calculate: you divide the number of observations that have the value by the total number of observations in the data set.

This is easy to accomplish on the "Analyses" sheet -- we don't even need to reference the "Survey_Results" sheet. Just remember the math of a percent:
  * Reference the number with the value -- for `C3` (C2 in Numbers), we'll reference `B3` (B2 in Numbers)
  * Divide that by the total number of observations, or the `SUM` of `B3:B5`
  * In other words: `=B3/SUM(B3:B5)`

For "Medium" and "High", we just need to change the numerator in our function
  * In `C4`, enter `=B4/SUM(B3:B5)`
  * In `C5`, enter `=B5/SUM(B3:B5)`

When you hit enter, the cell fills with a proportion, not a percentage. To fix that, we'll change the variable type:
  * **MS Excel, Google Sheets, & Libre Calc:** click the cell or cells you would like to reformat to a percentage, then click the button that looks like a percent sign in the top toolbar. You can also add or remove decimal places using the buttons with the small arrows and zeros.
  * **Apple Numbers:** click on the cell or cells you would like to reformat to a percentage, then click the button that looks like a paintbrush in the top-right corner of the window. Click on the tab marked "Cell", then under "Data Format" change the drop-down menu from "Automatic" to "Percentage". You can also change the decimal places in this same menu.

#### Cumulative Percent

Cumulative percentage is useful for variables which are ordered in some way. This column tells you what combined percent of your sample has a value that is from that row or any of the rows above it. How you order the table is important here. If you order from low to high, then the cumulative percent reflects what proportion have "at most" the value in the row. If you order from high to low, then cumulative percent reflect the proportion with "at least" that value.

In a round-about way, this column can also tell you where the median is -- the row which first crosses a cumulative percent of 50% is the median value.

To fill this column, we'll just need to add the value in the `C` column from the corresponding row and all others that might appear above that one.
  * For the first row, this is the same, so enter `=C3` into the `D3` cell (Apple users subtract one from the row number)
  * In the second row, we need to add the value in `C4` to the value in `C3`: `=C3+C4` or `=SUM(C3:C4)`
  * Finally, in the third row, add up `C3:C5`: `=C3+C4+C5` or `=SUM(C3:C5)`

<hr>

## Descriptive Statistics - Central Tendency

The job of central tendency summary measures is to provide a single value that is most "representative" of all of the values in the full set. What counts as "representative" can differ a lot, in part because of differences in measurement levels. The three central tendency measures are:

  * **Mode:** The most frequently occuring value (Nominal, Ordinal, Interval, and Ratio)
  * **Median:** The value in the middle when all of the observations are lined up from low to high (Ordinal, Interval, and Ratio)
  * **Mean:** The arithmetic average, or the sum of the collection of measured results divided by number of observations (Interval and Ratio)

In the example analysis, we're going to provide the measures of central tendency for Hours_NCAA. In the .xlsx file, these values will be in `B9:D9` on the "Analyses" sheet. In the .numbers file, these values will be in the `B2:D2` cells in the table labeled "Example Central Tendency" on the "Analyses" sheet.

#### Mode

For mode, we'll use the function called `MODE`. This function takes one parameter: the set of cells from which the mode is drawn. Using the sheet reference described above, we can fill `B9` with `=MODE(Survey_Results!D2:D16)` (or the equivalent for other software).

#### Median

Finding the median is similarly easy: we'll use the function called `MEDIAN` and provide the same reference cells as the only parameter. We get: `=MEDIAN(Survey_Results!D2:D16)`.

A quick note on medians: if you are attempting to use `MEDIAN` on an ordinal measure, you will need to convert your codes to numbers. Spreadsheet software are not able to assign an order to text labels. For example, if we wanted to use `MEDIAN` on one of the new "_Cat" variables, we could use 1 instead of "Low", 2 instead of "Medium", and 3 instead of "High". This should be pretty easy to do with some small changes to the transformation code above (e.g., `=IF(D2<=3, 1, IF(D2<=9, 2, 3))`)

#### Mean

The function for the arithmetic mean is `AVERAGE`, but you could also use `SUM` to add the cells and then divide by the number of observations -- both would get you the same result. Using the latter technique, we get: `=AVERAGE(Survey_Results!D2:D16)`.

Just keep in mind that this is sometimes called a "sample mean", because it's the mean of the whole sample, and that is different from the mean index described above. You *can* have a sample mean of a mean index. After making that index above, take the sample mean of it by using the following: `=AVERAGE(Survey_Results!I2:I16)`.

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/CentralT.png", width=80%> </center>

<hr>

## Descriptive Statistics - Dispersion

The role of dispersion statistics is to demonstrate how wide-spread the values are, sometimes in relation to a measure of central tendency. There are several takes on dispersion measures, but the most common three are:

  * **Range:** Either the minimum and maximum values, or the difference between them -- most report the former
  * **Variance:** The average squared differences of each value from the mean of the distribution -- not often reported, but very important for inference
  * **Standard Deviation:** How far, on average, each value is from the mean of the distribution -- also the square root of variance, in the same units as the original measure so much more common

In the example analysis, we're going to provide the measures of dispersion for Hours_NCAA. In the .xlsx file, these values will be in `B13:D13` on the "Analyses" sheet. In the .numbers file, these values will be in the `B2:D2` cells in the table labeled "Example Dispersion" on the "Analyses" sheet.

#### Range

There is no single built-in function for either definition of range. The first definition contains two values: the minimum (`=MIN()`) and the maximum (`=MAX()`). Those two functions will take the same referenced cells we used for central tendency above. To find the second definition of range, we'll need to as the software to do some math: subtract the minimum value from the maximum value. Doing that, we get range with the formula `=MAX(Survey_Results!D2:D16)-MIN(Survey_Results!D2:D16)`

#### Variance

Getting the variance is comparatively easier: we just need to use the `VAR` function with the same referenced cells, or `=VAR(Survey_Results!D2:D16)`

#### Standard Deviation

Standard deviation is likewise easy to calculate: `=STDEV(Survey_Results!D2:D16)`

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/Dispersion.png", width=80%> </center>
