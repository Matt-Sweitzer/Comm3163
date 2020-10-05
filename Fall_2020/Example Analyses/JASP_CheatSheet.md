<h1 align="center"><strong>Data Analysis Using JASP</strong></h1>

  <h3 align="center">Author: Matthew Sweitzer<br>Email: <a href="mailto:sweitzer.34@osu.edu">sweitzer.34@osu.edu</a><br>Website: <a href="https://www.matthewsweitzer.com">matthewsweitzer.com</a></h3>

<hr>

## Table of contents
1. [Introduction](#introduction)
2. [JASP GUI](#jaspgui)
3. [Data Structure](#datastructure)
  - [Rows == Participants](#datastructureA)
  - [Columns == Variables](#datastructureB)
4. [Variable Tranformation](#variabletransform)
  - [Column Addition](#variabletransformA)
  - [New Variable Naming](#variabletransformB)
  - [Functions](#variabletransformC)
  - [The `ifElse` Function](#variabletransformD)
  - [Nested `ifElse` Functions](#variabletransformE)
5. [Indices](#indices)
  - [Summative Index](#indicesA)
  - [Mean Index](#indicesB)
6. [Descriptive Statistics](#descriptives)
  - [Frequency Tables](#descriptivesA)
  - [Central Tendency and Dispersion](#descriptivesB)
  - [Descriptive Plots](#descriptivesC)
7. [Inferential Statistics - Chi-Square](#chisquare)
8. [Inferential Statistics - Correlation](#correlation)
9. [Inferential Statistics - *t*-tests](#ttests)
  - [One-sample *t*-test](#ttestsA)
  - [Unpaired (Independent) Samples *t*-test](#ttestsB)
  - [Paired (Dependent) Samples *t*-test](#ttestsC)

<hr><a name="introduction"></a>

## Introduction

This document is meant to guide you through some of the basic functions in the <a href="https://jasp-stats.org">JASP statistical software</a>. The tutorial and linked example data are offered under the terms of the <a href="https://creativecommons.org/licenses/by/4.0/legalcode">Creative Commons - Attribution</a> license. That means you may use, share, or change it in any way you like -- just make sure that you credit the author if you publish this elsewhere.

This tutorial relies on an example data set of 15 imagined survey responses. The goal of this example survey is to determine in which state one should run advertisements for the upcoming professional football season to attract viewers who don't currently watch much professional football. This tutorial focuses on descriptive and summary statistics, but I will return to this in a separate tutorial on inference.

The codebook for this imagined survey is available <a href="https://github.com/Matt-Sweitzer/Comm3163/blob/master/Fall_2020/Example%20Analyses/Codebook.md">here</a>. Some parts of this tutorial assume that you have already completed the tutorial on spreadsheet software available <a href="https://github.com/Matt-Sweitzer/Comm3163/blob/master/Fall_2020/Example%20Analyses/SpreadsheetCheatSheet.md">here</a>. This tutorial uses the same dataset, however because JASP is incapable of opening Excel files, I have converted it to a .csv file for you, which you can download <a href="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/ExampleData.csv">here</a> (Note: right-click "here", download or save linked file). If you prefer to skip the part where we convert the measurement classes of each variable, you can download the .jasp file <a href="https://github.com/Matt-Sweitzer/Comm3163/blob/master/Fall_2020/Example%20Analyses/ExampleData.jasp">here</a>.

<hr><a name="jaspgui"></a>

## JASP GUI

JASP is software designed by researchers at the University of Amsterdam. It is meant to make data transformation and statistical analyses as straight-forward as possible. That said, it acts as a graphical user interface (GUI) overlay for the <a href="https://r-project.org">R statistical software</a>, which is a tremendously powerful program capable of running a variety of data analytic functions -- everything from descriptive statistics up to machine learning and web or API scraping. Not all of that functionality works in JASP. However, most of the basic functions you would need for communication industry research are implemented and it is considerably easier to use than R.

When you first open the application, you'll see the window pictured below. The three horizontal lines in the top left corner of the window (circled in red) opens up the menu. Let's read in the csv file linked above by selecting "Open", then "Computer", and "Browse". Find the downloaded csv file (for me, this was sent to the "Downloads" folder by default). Select the file and click "Open".

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_GUI.png", width=90%> </center>

<hr><a name="datastructure"></a>

## Data Structure

Data from a survey represent a collection of responses from a variety of study participants to a series of survey questions. The results that we get from a study are put into a special format called a "data frame". This frame, much like a picture frame, is rectangular in shape. If you conduct your survey using any of the common online platforms, such as Survey Monkey or Qualtrics, chances are that your data will be in this format when you go to download it. If you are collecting your survey responses on paper, such as with an intercept or mail survey, you will likely need to manually enter your data into a frame format in order to use a computer for your analyses.

Even though a data frame is rectangular in shape, it's actually made up of a series of rows and columns, or a "matrix". Each "cell", given by a unique combination of row (horizontal) and column (vertical), represents a single data point -- a response by one participant to one question. This should look similar to the data frame we used in the spreadsheet tutorial, but now it's completed. Let's take a look at the matrix provided in the example data:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/DataFrame_JASP.png", width=90%> </center>

<a name="datastructureA"></a>

#### Rows == Participants

In this data frame, we have 15 rows, each marked with a number 1 through 15. Unlike in the spreadsheet software, JASP assumes we have a header row in our data when we open it, and it does not provide a number for the header row. This header contains the names for each of the variables in our study. The rows below the header (1 through 15) each represent a single participant in our study. In other words, all of the data points contained in row 1 are responses collected from the first survey participant; all of the data points contained in row 2 are responses collected from the second survey participant -- and so on.

<a name="datastructureB"></a>

#### Columns == Variables

The data frame also contains 9 columns, each representing a unique variable in our study. These are named now, unlike when we used the spreadsheet software and they had capital letters indicating each column. The first column ("Participant") does not represent responses to a survey question, but contains a number from 1 to 15 to help us identify the unique participant that the row represents. Although this is not technically necessary in a study where each participant provides answers only once (cross-sectional), if we had a longitudinal study where we give the survey to the same respondents at multiple points in time, this can be a really useful way to show that those multiple rows in the data belong to the same person.

Next to each variable name in the header row, you'll see one of four icons:

* A measuring tape (orange bar) indicating that the variable is encoded as some form of numeric, or "scale" measurement -- either ratio or interval
* A bar chart (gray, orange, and blue vertical bars of increasing height) indicating that the variable is encoded as ordinal categories
* A Venn diagram (grey, orange, and blue circles):
  * (without a small "a" in the blue circle) indicating that the variable is encoded as nominal categories, represented by a number
  * (with a small "a" in the blue circle) indicating that the variable is encoded as nominal categories, represented by text

When opening a csv data file for the first time, JASP will attempt to determine the encodings automatically. Sometimes this works well, while other times it does not. You can change the encoding manually by clicking on the icon to bring down a menu with the three options (nominal will automatically determine whether the data contained in the column are numbers or text). Make sure that the variables are encoded correctly:

<center>

|Variable|Class|
|----------|:-------------:|
|Participant|Nominal|
|Age|Scale|
|State|Nominal|
|Hours_NCAA|Scale|
|Hours_NCAA_Cat|Ordinal|
|Hours_NFL|Scale|
|Hours_NFL_Cat|Ordinal|
|Total_Hours_Both|Scale|
|Avg_Hours_Both|Scale|

</center>

For ordinal variables, sometimes it helps to make sure that your categories are in the correct order. Here we have three categories in our two ordinal variables `Hours_NCAA` and `Hours_NFL` -- marked 1, 2, and 3, representing "Low", "Medium", and "High" respectively. We created these in the spreadsheet tutorial, but this tutorial will cover that as well. To alter the categories, their labels, and their order, simply click on the variable name in the header row. This will bring up a contextual menu with each unique value and an editable "label" column. Type in "Low" for label in the 1 row, "Medium" in the 2 row, and "High" in the 3 row:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_Ordinal.png", width=90%> </center>

We could reorder these values if we wanted to -- we don't need to because the default is in the correct order, but imagine that our analysis asked what leads people to watch *less* football. We could reverse-code all categories by clicking the button on the right with both an up and a down arrow. You could also move individual categories up and down by clicking on the row with the category you want to move, and then clicking the "up" or "down" arrows. You can also filter results by the value of a variable by clicking on the checkmark on the left side of this window. "X" means that the participants with that value will be hidden from the results.

<hr><a name="variabletransform"></a>

## Variable Transformation

In the spreadsheet tutorial, we looked at how to transform a ratio numeric variable into a set of ordinal categories. This is a common practice of data simplification, called "binning", which can ease the interpretation of results.

>Let's say, for example, that we want to distinguish between high, medium, and low viewership of college football among our sample. While the Hours_NCAA variable tells us *exactly* how much our participants watch in a typical week, it looks like it's quite varied. To simplify matters, let's classify all participants who watch between 0 and 3 hours as "Low", all participants who watch between 4 and 9 hours as "Medium", and all users who watch more than 9 hours as "High".

Although those two binned transformations (`Hours_NCAA_Cat` and `Hours_NFL_Cat`) that we created before are present in the current dataset, you might still need to know how to perform the same transformations in JASP.

<a name="variabletransformA"></a>

#### Column Addition

To add a new column for your new variable, simply click the "+" icon on the right-hand side of the header row. Unfortunately, this will always add a new column on the right-most side of your data frame -- as far as I know, there is no way to reorder variables.

<a name="variabletransformB"></a>

#### New Variable Naming

Once we have a new column for our new variable, we need to make sure to name the variable in the header. Let's recreate our "Hours_NCAA_Cat" variable in JASP. You can call this new variable "Hours_NCAA_Cat_New".

Below "Name:", you will see several options. First, choose between implementing the new computed column using `R` code, or the hand icon represent point-and-click in the GUI. I highly recommend using the GUI option unless you are very familiar with programming in `R`. Even if you are, there are some nuances to JASP's implementation, such as not being able to call custom functions or those implemented in packages that are not included in the default JASP distribution.

Finally, choose what measurement type the new variable should take on. For "Hours_NCAA_Cat_New", we'll choose "Ordinal". Once all of those components are filled out, click "Create Column" to bring up the function editor.

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_NewVar.png", width=40%> </center>

<a name="variabletransformC"></a>

#### Functions

Like spreadsheet software, we'll use functions to fill in our new variable. The function editor can take one of two forms:

* If you selected `R` from the previous window, you will simply get a basic text window. Type in your `R` function -- do not use assignment operators or the name of the dataframe in your code (e.g., `ifElse(Hours_NCAA<=3, "Low", ifElse(Hours_NCAA<=9, "Medium", "High"))`)

* If you selected the option for point-and-click, you'll have a small window at the top with for areas:
  * On the left is a list of your variables you can use in the calculation of the new variable
  * On the top are a series of mathematical and logical operators
  * On the right are a list of the most common functions
  * In the center is a text window which you will use to bring all of these parts together. If you accidentally drag the wrong thing into this window, simply drag it over to the trash can in the bottom right of this window to remove it.

<a name="variabletransformD"></a>

#### The `ifElse` Function

The function we'll use for binning is called `ifElse`. This is identical to the `IF` function in spreadsheet software. For a review, please see that tutorial linked at the top of this document. Let's start by scrolling through the list on the right-hand side and dragging `ifElse(y)` into the text field.

In JASP, we can see that we need to provide the `ifElse` functions with 3 parameters inside the `()` wrapper: `test`, `then`, and `else`. These are identical to the parameters we supplied to the `IF` function in the spreadsheet tutorial. To edit the parameters, you can either click on the parameter name and begin typing, or you can drag and drop things into place.

The first parameter `ifElse` needs is our test. In our case, we want to see if the cell from the same row in the Hours_NCAA variable is a certain value. Let's start with the "Low" category. We want `Hours_NCAA_Cat` to equal "Low" if `Hours_NCAA` is less than or equal to 3. Drag in `Hours_NCAA` from the menu on the left and drop it below the `ifElse` function. Then drag the `≤` operator down from the top and drop it to the right of `Hour_NCAA`. To the right of the operator, you'll now see an ellipses -- click on that and type in the number 3. Now drag this whole group (click and drag the operator) into the "test" parameter position in the `ifElse` function.

The second parameter the `ifElse` function needs is what to do when the test is true. This is easy -- we want to show the text "Low" when `Hours_NCAA≤3`, so type `Low` into the "then" parameter position.

The third parameter the `IF` function needs is what to do when the test is false. This is really tricky, because we still have two categories left! We need to discern between people who watch between 4 and 9 hours, "Medium", and people who watch more than 9 hours, "High". To accomplish this, we'll need to run another `ifElse` test, so for now drag in a new `ifElse(y)` function from the right menu and drop it in the "else" parameter position. We'll fill this new set of parentheses in the next step.

<a name="variabletransformE"></a>

#### Nested `ifElse` Functions

Just like in the spreadsheet tutorial, we'll need to "nest" a new function to run a second test for the final two categories.

Inside this second `ifElse` test, we again need 3 parameters. For the first parameter, we need our new test. We're still checking the number of hours of college football, so drag in another `Hours_NCAA` from the left menu. Now, for the value, our second test is checking to see if a person watches between 4 and 9 hours. Now because everyone who watches less than 4 hours passed the first test, we don't need to worry about writing the lower part of that test. So let's add the upper part of this test by dragging in the `≤` operator from the top menu and typing "9" into the ellipses. Drag this whole component into the "test" parameter position in the nested `ifElse` function.

For the second parameter, "then", type `Medium` -- this is the ordinal category which represents 4 to 9 hours. And now for the third parameter, let's consider what's left from our two tests: If the value in `Hours_NCAA` failed the first test, it must be greater than 3. If the value in `Hours_NCAA` then also failed the second test, that must mean it's also greater than 9. And as luck would have it, that's exactly what the "High" category describes! So add `High` to the "else" parameter position. We're done with our formula, so you can click the "Compute column" button at the bottom of this window. Note that this will automatically fill in all values in the new variable -- you do not need to expand your function like we did in the spreadsheet tutorial. Double check that your new values match those we created before in the `Hours_NCAA_Cat` column.

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_NewBin.png", width=90%> </center>

<hr><a name="indices"></a>

## Indices

Indices are another useful type of variable transformation; they combine multiple measures into one single measure. This can help you with content validity if those individual variables measure different components of a broad concept. It may also help expedite some of your inferential analyses, which we'll talk about later on this semester.

There are two main types of indices: sums and means

<a name="indicesA"></a>

#### Summative Index

A summative index, or sum, is exactly like it sounds: you simply add up the variables together.

>From our football data, let's imagine that we're interested in the total number of hours spent watching football at any level. This could be useful information for advertisers during any football programming, as we could use that to infer how many ads people are exposed to. If someone watches double-digit hours of football, they're watching multiple games, perhaps across different channels or levels of play.

To make our sum index, let's create a new column -- you can name this "Total_Hours_Both_New". Use the "point-and-click" option, along with the "scale" variable class. Since a sum just asks us to add together each variable in the index, we can use the "+" operator. Drag that from the top menu into the text field. Then on one side of the "+", drag `Hours_NCAA` from the left menu and drop on one ellipses. On the other side, drag and drop `Hours_NFL`. Click "Compute column" and verify that the new values match the sum we created before in the `Total_Hours_Both` column.

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_NewSum.png", width=90%> </center>

<a name="indicesB"></a>

#### Mean Index

A mean index is somewhat similar to a summative index, only instead of adding up the values, we'll take the average of them. Averaging is probably more useful when you have three or more variables, as opposed to two, but the principles of the formula construction should translate easily to indices of any size.

We'll use mathematical functions to calculate the mean. Note that the `mean(y)` function on the right-hand side only takes one parameter and never more than one! This is akin to a sample mean, rather than a mean index. Unfortunately, the `rowMeans()` function, which will accomplish the index calculation, is only available through the `R` option for computing a new variable. If using that option, make sure you wrap your variables in a `cbind()` function as well, since JASP does not work well with data frame syntax:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_NewAvgR.png", width=90%> </center>

*Note:* this WILL work with `rowSums()` to create a summative index as well.

To create our new variable using the "point-and-click" option, start a new column named "Avg_Hours_Both_New" with the "scale" variable class. For an average, we need to add together the values of our two variables, and then divide that by the number of variables being added together. Drag in both the "+" and the "÷" operators from the top menu and place the "+" operator in the numerator position (top) of the "÷" operator. On the left and right of the "+", drag in `Hours_NCAA` and `Hours_NFL`. Then in the denominator, type "2". Your function should look like this:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_NewAvg.png", width=90%> </center>

When finished, click "Compute column" and verify that the new values are equivalent to the old values in the `Avg_Hours_Both` column. You can ask JASP to round variables by wrapping your equation inside of a `round(y)` function, available in the right-hand column. However, it should be noted that this will drop training zeroes; e.g., "14.501" will still be "14.5" when rounding to 2 digits. Unfortunately, `R` functions which *are* capable of retaining trailing zeros in accordance with APA standards, such as `formatC()` are not whitelisted base functions in JASP, even if implemented using the `R` option for variable computation.

<hr><a name="descriptives"></a>

## Descriptive Statistics

Generating descriptive statistics, and even descriptive figures, is much easier compared to spreadsheet software. To begin, click the button marked "Descriptives" from the top menu, shown below circled in red:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_GUI_Desc.png", width=90%> </center>

In the new window, you will see few components. On the left-hand side will be a window containing all of your variables, and to the right of that window you'll see two areas, one marked "Variables" and another marked "Split". To change what variable or variables you would like descriptive statistics on, you need to move a variable from the list on the left into the "Variables" section. Click on a variable from the list, then click on the right-facing arrow next to the "Variables" window to move the variable. To remove a variable from the "Variables" window, just click the variable name and that right-facing button will transform to a left-facing button to move it back to the full list.

The split window allows you to select a single nominal or ordinal variable that you would like to use to split up your data into different groups for comparison. To move a variable into the split window, select the variable from the list on the left, then click the right-facing arrow next to the split window. You can move it back using the same technique described above. Here is an example of descriptive statistics for the `Age` variable, split on the `State` variable:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_Desc_SplitEX.png", width=90%> </center>

<a name="descriptivesA"></a>

#### Frequency Tables

Frequency tables are a useful tool for describing how often each unique value of a variable occurs across the whole set of responses. For a more detailed description of the components, see the spreadsheet tutorial linked above.

In JASP, frequency tables can only be calculated on nominal and ordinal variables. To generate a frequency table, move the variable of interest from the list on the left into the "Variables" window. Then, below the variable list, check the box marked "Frequency tables (nominal and ordinal variables)". Here is a frequency table for the `Hours_NCAA_Cat` variable:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_FreqTable.png", width=90%> </center>

Unfortunately, there is no way to ask JASP to round the results of a frequency table -- you will need to round numbers manually.

You can copy tables out of JASP to paste directly into a word processor or LaTeX document. Next to the table name, click the black drop down arrow and select either "Copy" or "Copy LaTeX", respectively.

<a name="descriptivesB"></a>

#### Central Tendency and Dispersion

Getting descriptive statistics out of JASP is similarly easy. Move your variable of interest over into the "Variables" window. Then, below that window, expand the "Statistics" options. You'll see a lot of options here, including many of the common central tendency and dispersion statistics which we've talked about this semester, as well as some other options relating to percentiles and the shape of the distribution. Select as many or as few as you would like. The table in the right-hand window will automatically populate with each statistic added from the menu in the left-hand window. Here is a somewhat comprehensive set of statistics regarding the mean index variable `Avg_Hours_Both`:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_DescStats.png", width=90%> </center>

Don't forget: You can add a nominal or ordinal variable to the "Split" window to compare the descriptive statistics of one variable among groups of participants!

<a name="descriptivesC"></a>

#### Descriptive Plots

In the "Plots" drop-down menu, you can ask JASP to print a variety of plots which might be useful for publication. Near the top of this menu is a separate drop-down menu for the color palette. Using this will change the colors of all figures at once to a uniform palette. Feel free to explore these graphs on your own. I recommend:

* Pie charts for nominal variables
* Distribution plots (histograms) for ordinal or scale variables
  * The "Display density" option will overlay the kernel density plot
  * As of this time, there is no way to control binning or colors of this plot
* Boxplots for scale variables
  * This can be a really helpful visualization if you also have a grouping variable!
* Scatter plots for showing the relationship between any two scale variables
  * "Graph above" and "Graph right" options are uncommon in publications
  * "Add regression line" is common though, as is the confidence interval around the estimates -- we'll talk about what this is doing when we get to the inferential statistics lesson
  * If you have a third variable as your "Split", this plot will show your groups separately -- helpful if your grouping variable is also a moderator!

You can adjust the scale of the figure by hovering over the bottom-right corner of the figure until your mouse changes to a dual arrow. Click and drag to resize. You can also copy figures into a word processor or save it as an image file in a similar manner to copying tables (see above).

Here is an example of a box plot comparing `Avg_Hours_Both` between participants from the two `State`s in our data: Michigan and Ohio:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_BoxplotEX.png", width=90%> </center>

<hr><a name="chisquare"></a>

## Inferential Statistics - Chi-Square Test

Starting off our inferential statistical tests is the chi-square test. This test is appropriate when comparing the joint frequencies of two categorical variables (nominal or ordinal) against some expected frequency. In the most basic form, we can allow this test to calculate expected frequencies for us by summing across the rows and columns. In this case, the null hypothesis would suggest that there is no significant difference between the observed frequencies in each cell of a cross-tabulation and the expected frequency of that cell given by the joint probability of the corresponding categories relative to the distribution in the full variables.

To begin, let's ask JASP to find the cross-tabulation of two of our categorical variables: `State` and `Hours_NCAA_Cat`. This will help us see the observed frequencies. From the top menu, click "Frequencies", and then select "Contingency Tables". Next, move `State` and `Hours_NCAA_Cat` each into the one of "Rows" and "Columns" windows -- the order does not matter, but make sure you don't put them both in the same window. This should populate the results side with your cross-tabulated frequencies:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_CrossTabs.png", width=90%> </center>


Now we just need to run the chi-square tests. To do that, we just need to open the "Statistics" menu and check the box marked χ2 (chi squared). This will add a table with the results of the test, indicating the test statistic value, degrees of freedom, *p*-value, and sample size:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_ChiSquared.png", width=90%> </center>

<hr><a name="correlation"></a>

## Inferential Statistics - Correlation Test

The next test we'll look at is correlation. Correlation tells us to what extent changes in one numeric variable (interval or ratio) *coincide with* changes in another numeric variable. The most common correlation statistic is Pearson's *r*, however others available in JASP include Spearman's *ρ* and Kendall's *τ*.

To start a correlation test, select "Regression" from the top menu, then choose "Correlation". Next, move two scale variables over to the "Variables" window -- in this example, let's look at `Hours_NCAA` and `Hours_NFL` to see if viewing one kind of football is associated with the other. By default, the "Pearson's *r*" and "Report significance" options will be checked -- leave those turned on in most cases. Additional options that might be useful for reporting include "Flag significant correlations", which will add a significance note below the table, and "Confidence intervals" with the default "95.0%". The latter will print the confidence interval (lower and upper) of the Pearson's *r* statistic -- in most cases, we would like to see that 0 is not included in this range. Finally, the default "Alt. Hypothesis" of "Correlated" will work for us today, but you can change your test to a one-tailed test with this setting. Here's the results:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_CorTest.png", width=90%> </center>

*Note*: The option "Display pairwise" will suppress the correlation table structure. While the table might be useful for more than two variables, the pairwise would display the same information in a more condensed fashion. Finally, the "Scatter plots" option will give you a nice figure to go along with your statistic.

<hr><a name="ttests"></a>

## Inferential Statistics - *t*-tests

*t*-tests are useful in a variety of situations. In most cases, you need at least one numeric variable (interval or ratio). If you have only that one measure and you would like to compare the distribution against a test value (e.g., 0), use the one-sample test. If you have two measurement distributions which ***do NOT*** come from the same participants (e.g., two groups of participants, denoted by a categorical variable; see below), use the unpaired (independent) test. Finally, if you have two measurement distributions which ***DO*** come from the same participants (e.g., pre-test and post-test values, often stored as separate variables in the data), use the paired (dependent) test.

<a name="ttestsA"></a>

#### One-sample *t*-test

From the "T-Tests" menu at the top, select "One Sample T-Test". In this example, let's see if people's average viewing hours between NCAA and NFL football is greater than zero -- in other words, does the average person watch some amount of football in a typical week?

For this test, move `Avg_Hours_Both` to the "Variables" window. Make sure that the "Test value" on the left is 0 -- this should be the default, but we could change this value here. For this test, we'll select a one-tailed test, so click the option called "> Test value". Finally, check the options "Effect Size" to print the Cohen's *d* statistic and "Descriptives" to print the mean and standard deviation of our variable of interest (often reported in conjunction with the test results). Here's the output:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_ttest_OS.png", width=90%> </center>

In this case, because *p* is less than the conventional alpha level of 0.05, we can reject the null hypothesis that people watch 0 hours of football on average between NCAA and NFL.

<a name="ttestsB"></a>

#### Unpaired (Independent) Samples *t*-test

From the "T-Tests" menu at the top, select "Independent Samples T-Test". In this example, let's see if Ohioans watch a different amount of professional football in a typical week compared to Michiganders. Let's move `Hours_NFL` into the "Variables" window, and move `State` into the "Grouping Variable" window.

You can change the student's test to one of the more robust options on the left-hand side -- we'll leave it at "Student" for this example. We're just looking for non-directional differences, so leave the "Alt. Hypothesis" at the default two-tailed option. Finally, check "Effect Size" to print the Cohen's *d* statistic and check the "Descriptives" option. Here are the results:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_ttest_US.png", width=90%> </center>

Note that the value of the *t* statistic is negative. This is because we are comparing Michiganders against Ohioans -- they watch less football than Ohioans. If we wanted to compare Ohioans against Michiganders, we could simply manually flip the sign of the statistic (i.e., "2.229"), or we could reorder the state variable. See the "[Columns == Variables](#datastructureB)" section above for instructions regarding categorical reordering. Because *p* is less than 0.05, we can reject the null hypothesis that there is no significant difference between Ohioans' and Michiganders' professional football viewing habits.

<a name="ttestsC"></a>

#### Paired (Dependent) Samples *t*-test

From the "T-Tests" menu at the top, select "Paired Samples T-Test". For this example, let's look at whether people watch different amounts of NCAA and NFL football in a typical week. Because we have two measures per participant, we can compare one value against the other *within* each row in the data set -- "paired". Move both `Hours_NCAA` and `Hours_NFL` into the "Variable pairs" window. Note that the two variables we are comparing should appear side-by-side in this window instead of stacked like in previous tests. You can drag and drop variables around in this window similar to how you drag and drop variables in the function editor we used in the "[Variable Tranformation](#variabletransform)" section above -- this is also how you can swap the order of the comparison (i.e., flip the sign of the *t* statistic).

We'll leave the test at the default "Student" option. Likewise, because we're testing for non-directional differences, we can leave "Alt. Hypothesis" at the default two-tailed option. Just mark "Effect Size" to print the Cohen's *d* statistic, and make sure that "Descriptives" is also checked. Here are the results:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_ttest_PS.png", width=90%> </center>

Because *p* is 0.131 -- above the conventional alpha level of 0.05 -- we should fail to reject the null hypothesis. In other words, there are no *significant* differences between the number of hours spent watching college and professional football in our sample.
