<h1 align="center"><strong>Data Analysis Using JASP</strong></h1>

  <h3 align="center">Author: Matthew Sweitzer<br>Email: <a href="mailto:sweitzer.34@osu.edu">sweitzer.34@osu.edu</a><br>Website: <a href="https://www.matthewsweitzer.com">matthewsweitzer.com</a></h3>

<hr>

## Table of contents
1. [Introduction](#introduction)
2. [JASP GUI](#jaspgui)

  #### Survey Data
  3. [Data Structure](#datastructure)
    - [Rows == Participants](#datastructureA)
    - [Columns == Variables](#datastructureB)
  4. [Variable Tranformation](#variabletransform)
    - [Column Addition](#variabletransformA)
    - [New Variable Naming](#variabletransformB)
    - [Functions](#variabletransformC)
    - [The `ifElse` Function](#variabletransformD)
    - [Nested `ifElse`  Functions](#variabletransformE)
  5. [Indices](#indices)
    - [Summative Index](#indicesA)
    - [Mean Index](#indicesB)
  6. [Descriptive Statistics](#descriptives)
    - [Frequency Tables](#descriptivesA)
    - [Central Tendency and   Dispersion](#descriptivesB)
    - [Descriptive Plots](#descriptivesC)
  7. [Inferential Statistics - Chi-Square](#chisquare)
  8. [Inferential Statistics -  Correlation](#correlation)
  9. [Inferential Statistics - *t*-tests](#ttests)
    - [One-sample *t*-test](#ttestsA)
    - [Unpaired (Independent) Samples *t*-test](#ttestsB)
    - [Paired (Dependent) Samples *t*-test](#ttestsC)

  #### Experiment Data
  10. [Data Structure](#datastructure2)
  11. [Verify Random Assignment to Condition](#randomassign)
  12. [Main Effects](#maineffects)
    - [Unpaired (Independent) Samples *t*-test](#maineffectsA)
    - [One-way ANOVA](#maineffectsB)
  13. [Interaction Effects](#interactioneffects)
    - [Two-way ANOVA](#interactioneffectsA)

<hr><a name="introduction"></a>

## Introduction

This document is meant to guide you through some of the basic functions in the <a href="https://jasp-stats.org">JASP statistical software</a>. The tutorial and linked example data are offered under the terms of the <a href="https://creativecommons.org/licenses/by/4.0/legalcode">Creative Commons - Attribution</a> license. That means you may use, share, or change it in any way you like -- just make sure that you credit the author if you publish this elsewhere.

The first part of this tutorial relies on an example data set of 15 imagined survey responses. The goal of this example survey is to determine in which state one should run advertisements for the upcoming professional football season to attract viewers who don't currently watch much professional football.

The codebook for this imagined survey is available <a href="https://github.com/Matt-Sweitzer/Comm3163/blob/master/Fall_2020/Example%20Analyses/SurveyCodebook.md">here</a>. Some parts of this tutorial assume that you have already completed the tutorial on spreadsheet software available <a href="https://github.com/Matt-Sweitzer/Comm3163/blob/master/Fall_2020/Example%20Analyses/Spreadsheet_CheatSheet.md">here</a>. This tutorial uses the same dataset, however because JASP is incapable of opening Excel files, I have converted it to a .csv file for you, which you can download <a href="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/ExampleSurveyData.csv">here</a> (Note: right-click "here", download or save linked file).

The second part of this tutorial uses an example data set of 180 participants in an imaginary 3 by 2 factorial (6 conditions) experimental design. The goal of this example experiment is to determine whether 1) the amount of violence or 2) the style of play in a videogame produces greater desensitization to violent imagery.

The codebook for this imagined experimental data is available <a href="https://github.com/Matt-Sweitzer/Comm3163/blob/master/Fall_2020/Example%20Analyses/ExperimentCodebook.md">here</a>. The data are available in .csv form <a href="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/ExampleExperimentData.csv">here</a> (Note: right-click "here", download or save linked file).

<hr><a name="jaspgui"></a>

## JASP GUI

JASP is software designed by researchers at the University of Amsterdam. It is meant to make data transformation and statistical analyses as straight-forward as possible. That said, it acts as a graphical user interface (GUI) overlay for the <a href="https://r-project.org">R statistical software</a>, which is a tremendously powerful program capable of running a variety of data analytic functions -- everything from descriptive statistics up to machine learning and web scraping. Not all of that functionality works in JASP. However, most of the basic functions you would need for communication industry research are implemented and it is considerably easier to use than R.

When you first open the application, you'll see the window pictured below. The three horizontal lines in the top left corner of the window (circled in red) opens up the menu. Let's read in the csv file linked above by selecting "Open", then "Computer", and "Browse". Find the downloaded csv file (for me, this was sent to the "Downloads" folder by default). Select the file and click "Open".

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_GUI.png", width=90%> </center>

<hr>

<h1 align="center">Survey Data</h1>

<a name="datastructure"></a>

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


Now we just need to run the chi-square tests. To do that, we just need to open the "Statistics" menu and check the box marked χ<sup>2</sup> (chi squared). This will add a table with the results of the test, indicating the test statistic value, degrees of freedom, *p*-value, and sample size:

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

<hr>

<h1 align="center">Experimental Data</h1>

<a name="datastructure2"></a>

## Data Structure

Let's switch gears and look at some example data from an experiment. The data file for this portion of the tutorial is called "ExampleExperimentData.csv" and it is available for download <a href="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/ExampleExperimentData.csv">here</a> (Note: right-click "here", download or save linked file). The codebook for this data set is available online <a href="https://github.com/Matt-Sweitzer/Comm3163/blob/master/Fall_2020/Example%20Analyses/ExperimentCodebook.md">here</a>.

When you open up the data file in JASP for the first time, you should be greated with the following data frame:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/DataFrame_exp_JASP.png", width=90%> </center>

Before we get to variable encodings and value labels, take a minute to get familiarized with this data set. You'll notice that this follows a similar format to the survey data frame that we worked with above. Each row corresponds to a single participant, denoted by an identifier in the first column. Each column after that represents a measurement of some sort. Perhaps the first noticeable difference is the `Condition` variable. This corresponds to the experimental condition which was randomly assigned to each participant, with values ranging from 1 to 6.

To get a better sense of what these conditions represent, it may help to imagine the research agenda of this study:

> As a communication researcher, you are interested in examining the effects of videogames on player's desensitization to other violent imagery. With the recent advent of more immersive technologies such as virtual reality in the videogame industry, recent studies have shown that immersion that is enhanced by these technologies leads players to become more desensitized to the violence in those games, and thus become more accepting of the violent actions of others. So you derive the first hypothesis for your study: **H<sub>1</sub>: Immersive videogame technologies will lead to greater acceptance of the violent actions of others compared to less immersive technologies.** You also know that previous theory and research has shown a positive relationship between the amount of violence in a videogame and players' desensitization to violence in other settings, and so you derive the following hypothesis: **H<sub>2</sub>: As the level of violence in a videogame increases, a player will be more likely to find the violent actions of others acceptable.** However, you begin to wonder whether the effects of hypothesis 2 may be greater when players use new technologies compared to when they use more traditional setups. In other words, the effects of violence in videogames on desensitization to violence may be *conditional* on the mode of play. And so you derive the following research question for your study: **RQ<sub>1</sub>: Does the mode of videogame playing moderate the relationship between game violence and desensitization to violence?**

With that in mind, the imagined experiment utilized a 2 (play mode) by 3 (violence) factorial experimental design. Play mode was operationalized by having participants play a videogame in a laboratory setting using either a traditional game console and controller setup (low immersion) or a virtual reality headset along with two motion-tracking controllers (high immersion). The level of violence in the videogame that participants played was operationalized using three levels, each corresponding to one of three ESRB (Entertainment Software Rating Board) ratings: "Everyone", "Teen", or "Mature". The ESRB, for those who don't know, is a regulatory organization which assigns a label to a videogame that corresponds to (among other things) the amount, gratuity, and style of violence portrayed in the game. This is similar to how movies receive G, PG, PG-13, and R ratings from the Motion Picture Association of America.

The table below shows which condition number corresponds to each of the unique combinations of play mode and violence; this is the `Condition` variable in the data frame:

<center>

|  | Everyone | Teen | Mature |
| :--- | :---: | :---: | :---: |
| **Television** | Condition 1 | Condition 2 | Condition 3 |
| **Virtual Reality** | Condition 4 | Condition 5 | Condition 6 |

</center>

Although it is not always the case that you would have a separate set of variables in the data frame which correspond to the independent variables in a factorial design, I have gone ahead and added them at the far right of the frame as `GameRating` and `PlayMode`. This should make analysis of the main effects of each variable quite a bit easier. If these were absent, you could easily make them by following the table above and the guide for [variable tranformations](#variabletransform) in the survey section of this tutorial.

For the dependent variable, this imagined experiment showed every participant three images of violent acts. Participants were then asked: "On a scale from 1 to 100, where 1 represents totally unacceptable and 100 represents perfectly acceptable, how would you rate the actions of the person depicted in the following image?" Ratings for images 1, 2, and 3 are stored in the variables `ViolentImageRating_1`, `ViolentImageRating_2`, and `ViolentImageRating_3` (respectively). I then created a mean index which we will use as the dependent variable for all analyses below called `ViolentImageRating_Mean`. If this was not provided, you could create your own mean index using the [mean index](#indicesB) section of the survey tutorial above.

Before we continue, please make sure that all of the variables are encoded correctly; you can change variable encodings by clicking on the icon next to the variable name in the header row of the data frame:

<center>

|Variable|Class|
|----------|:-------------:|
|Participant|Nominal|
|Condition|Nominal|
|ViolentImageRating_1|Scale|
|ViolentImageRating_2|Scale|
|ViolentImageRating_3|Scale|
|ViolentImageRating_Mean|Scale|
|Gender|Nominal|
|GameRating|Ordinal|
|PlayMode|Nominal|

</center>

It may also help to change the labels on the `Gender` variable so that we know how to interpret any results that include this variable. According to the codebook, 0 values represent male participants and 1 values represent female participants. If you need a refresher on variable labels, see the section labeled "[Columns == Variables](#datastructureB)" above.

<a name="randomassign"></a>

## Verify Random Assignment to Condition

In experimental designs, random assignment to condition is vitally important to ensure that you are ruling out extraneous effects, such as the participants' characteristics. While randomization is usually implemented at the data collection stage, for example in the "Survey Flow" menu of a Qualtrics survey, it can sometimes be useful to verify that your randomization worked as intended at the data analysis stage as well.

For this step, we'll be testing for a relationship between a demographic variable, `Gender` (although in the real world, you could substitute any demographic variable), and the `Condition` that participants were assigned to. In the results of this test, we are hoping to find **NO** significant relationship. If a significant relationship exists between the demographics of our sample and the experimental conditions, then our randomization did NOT effectively rule out the potential effects of participants' characteristics on the dependent variable. We would either have to continue collecting more data, or control for the effects of those characteristics using more complex inference techniques, such as multiple regression.

Since both the `Gender` and `Condition` variables are categorical, we will be using a chi-square test. For a refresher on the specifics of that method in JASP, see the [chi-square](#chisquare) section of the tutorial above. From the menu at the top of the window, select "Frequencies", then "Contingency Tables". Move `Condition` to the columns window and `Gender` to the rows window, then ensure that the χ<sup>2</sup> option is checked in the Statistics menu.

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/RandomizationToCondition.png", width=90%> </center>

As you can see in the results above, there is NOT a significant relationship between `Gender` and `Condition` (*p*=.91). In other words, we know that our randomization technique placed men and women into each of the six experimental conditions with approximately equal probability. If gender has an effect on sensitization to violence, then that effect should now be washed out when we aggregate the results from those conditions. We can now move forward with our planned inferential analyses.

<a name="maineffects"></a>

## Main Effects

Any time there are two or more independent variables in your study, we can refer to the types of relationships in our analyses as either "main effects" or "interaction effects". "Main effects" refer to the bivariate relationships between each of your independent variables and the dependent variable. In the example data, we have two main effects:

* The relationship between `PlayMode` and `ViolentImageRating_Mean` (the effect of play style on desensitization to violence)
* The relationship between `GameRating` and `ViolentImageRating_Mean` (the effect of game violence on desensitization to violence)

We can analyze each of these relationships separately.

<a name="maineffectsA"></a>

#### Unpaired (Independent) Samples *t*-test

For the first relationship between `PlayMode` and `ViolentImageRating_Mean`, we can use an inferential method we already know: an unpaired, or independent, samples *t*-test. Consider the independent variable of `PlayMode`; there are broadly two groups of participants that we are comparing here: those who played on a traditional console (conditions 1, 2, and 3), and those who played on a virtual reality headset (conditions 4, 5, and 6). We can aggregate the mean violent image ratings for both of these groups so that there are just two distributions. This aggregation is sometimes also referred to as "condition collapsing".

To run an unpaired *t*-test in JASP, select "T-Tests" from the top menu bar and click "Independent Samples T-Test". Move the dependent variable, `ViolentImageRating_Mean`, into the "Variables" window and move `PlayMode` into the "Grouping Variables" window. Finally, make sure that the "Effect Size" option is checked so that we get the Cohen's *d* value as well.

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_exp_ttest.png", width=90%> </center>

From the results window, we can see that *p*=0.066, which is above the conventional alpha level of 0.05. We thus fail to reject the null hypothesis that there is no direct relationship between these two variables. That is, **H<sub>1</sub>** is not supported. We'll come back to this relationship later on, but for now there is no *main* effect of play mode on desensitization to violent imagery.

<a name="maineffectsB"></a>

#### One-way ANOVA

In the second main effect between `GameRating` and `ViolentImageRating_Mean`, we need to use a related, but different inference method called a "one-way ANOVA". ANOVA stands for "ANalysis Of VAriance". In it's most basic form, called a "one-way", the test looks for a bivariate relationship between a single categorical variable and a single numeric variable, kind of like an unpaired *t*-test. However, unlike an unpaired *t*-test, you can compare more than two levels of the categorical variable. This works well for the `GameRating` independent variable because there are three levels: "Everyone", "Teen", and "Mature". These represent condition collapse again, but with a different set of groups: "Everyone" collapses conditions 1 and 4, "Teen" collapses conditions 2 and 5, and "Mature" collapses conditions 3 and 6.

To run a one-way ANOVA in JASP, select "ANOVA" from the top menu bar and click "ANOVA". Next, we'll move `ViolentImageRating_Mean` into the "Dependent Variable" window, and `GameRating` should be moved to the "Fixed Factors" window. From the menus below, make sure to select "Descriptive statistics" and "Estimates of effect size" (Note: η<sup>2</sup> can be interpreted in much the same way as one interprets the R<sup>2</sup> coefficient of determination).

Finally, any time you have three or more values in your fixed factor, it helps to run something called a "post hoc test". The primary results from an ANOVA simply tell you whether there are significant differences between the categories of your independent variable. However, it does not tell you which groups are significantly different from one another, or what order those groups should be in (e.g., is "Mature" higher or lower than "Teen"?). Post hoc tests will compare each pair of categories, and they're called "post hoc" because it's good scientific practice to only run them ***after*** you have ensured that there are significant differences in the ANOVA which the post hoc tests can explore. There are a wide variety of post hoc tests to choose from in JASP under the "Post Hoc Tests" drop-down menu. Simply move the independent variable, `GameRating` from the left window to the right and select an option from the "Corrections" list. I recommend Googling each of the options if you are interested in learning what each of those corrections accomplishes and how they differ from one another. Conventionally, "Tukey" is probably the most common option.

Here are the results:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_exp_1wayaov.png", width=90%> </center>

As we can see in the first table, there is a significant effect of `GameRating` on `ViolentImageRating_Mean`; *F*(2, 177)=1,083.10, *p*<.001. There is also a large effect size between these variables; η<sup>2</sup>=.92. From the descriptive statistics, we can discern that the mean desensitization score of people who played a game rated "Everyone" is the lowest, followed by "Teen" and "Mature". In the post hoc tests, we can see that each group is significantly different from one another as well, according to both the Tukey and Sidak corrections. In other words, people who played the "Mature" game scored significantly higher on our mean desensitization measure compared to both the people who played the "Teen" game AND the people who played the "Everyone" game. Further, people who played the "Teen" game also scored significantly higher compared to the people who played the "Everyone" game. This test provides strong evidence in support of **H<sub>2</sub>**.

<a name="interactioneffects"></a>

## Interaction Effects

The other type of effect you might have with two or more independent variables is called an "interaction effect". This type of effect means that the two independent variables work *together* to affect the dependent variable. Another way of phrasing an interaction effect is that the effect of one independent variable is *conditional* on the effects of the other independent variable. Applied to the example data set, we might find that there is comparatively little difference in the desensitization to violent imagery between VR and console players when the game they play is rated "Everyone", but that there are substantial differences in the "Mature" game conditions between VR and console players. If this is indeed true of our dataset, then the effects of play mode on violence desensitization can be said to be condition on the effects of the amount of violence in the game (or conversely, the effects of violence in the game on desensitization are conditional on the play mode).

<a name="interactioneffectsA"></a>

#### Two-way ANOVA

To test for an interaction effect in JASP, we can run something called a "two-way" ANOVA; "two" representing the number of factors in our experimental design. This differs from a one-way ANOVA in that it takes each of the unique combinations of our two independent variables and treats each of them like a separate group. So since `GameRating` has three values and `PlayMode` has two, a two-way ANOVA will see 3 times 2, or 6 groups. This maps onto the six experimental conditions in our study!

The output of a two-way ANOVA will contain three rows: the partial main effects of variable 1, the partial main effects of variable 2, and the joint interaction effects of both variable 1 and variable 2. By "partial", I mean the amount of variance in the dependent variable that can be attributed to ONLY that one variable (i.e., accounting for the unique effects of the second variable AND the interaction of both variable 1 and 2). For the purposes of this class, it's ok if that doesn't entirely make sense. This section includes a graph at the end which will hopefully help explain what is going on at each of these three levels.

To run a two-way ANOVA in JASP, we can use the same set of tools from the one-way ANOVA analysis above; choose "ANOVA" from the top menu and select "ANOVA" from the drop-down menu. Move `ViolentImageRating_Mean` to the "Dependent Variable" window, and move both `GameRating` and `PlayMode` to the "Fixed Factors" window. Now we just need to make sure the same options are selected: check "Descriptive Statistics", "Estimates of effect size", and add a post hoc test of your choice (make sure to move the interaction term `GameRating * PlayMode` from the left window to the right one; leave the other two in the left window).

Here are the results:

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_exp_2wayaov.png", width=90%> </center>

In the first table, each row shows a significant result; the partial effect of `GameRating` is strong (η<sup>2</sup>=.92), while the partial effects of `PlayMode` and the interaction `GameRating * PlayMode` are both small (η<sup>2</sup>=.02 and η<sup>2</sup>=.002, respectively). Notice how the partial effect of `PlayMode` compares to the main effect that we tested for above -- we found significance here where we did not before. This tells us that we needed to control for the effect of both `GameRating` and `PlayMode`'s interaction with `GameRating` in order to find a result. This should tell us three things:

1. The amount of violence in a videogame matters much more for desensitization compared to the technology used to play that game
2. The immersive technology *does* have a small effect on desensitization, but:
3. The effect of new technologies still depends a lot on the amount of violence in that game -- without knowing what game someone is playing, it's difficult to say that VR alone is inherently more desensitizing compared to older technologies

This is borne out in the descriptive statistics table as well. There's a clear set of groups with each pair of rows, representing the amount of violence in the game. "Everyone" games produce the lowest scores, "Teen" games in the middle, and "Mature" has the highest means. Within each pair of rows, we can compare the means for both VR and TV conditions. It does appear that the means in virtual reality conditions are higher compared to their television counterparts, but those differences are quite small: ~4 on our scale in games rated "Everyone", ~8 in games rated "Teen", and ~11 in games rated "Mature". The change in the *size* of those differences as in-game violence increases is important: the differences between VR and TV get *bigger*. This is what is meant by an interaction effect! In other words, the effect of more immersive technologies on desensitization is conditional on the amount of violence in the game being played; it's much larger in very violent games compared to less violent games.

It may help to look at a graph. Below is something called a "marginal effects plot". You can add this to your own JASP results by opening the drop-down menu labelled "Descriptive Plots". Move `GameRating` into the "Horizontal Axis" window, move `PlayMode` into the "Separate Lines" window, and make sure that the "Display error bars" option is checked (leave it at the default for 95% confidence intervals).

<center> <img src="https://raw.githubusercontent.com/Matt-Sweitzer/Comm3163/master/Fall_2020/Example%20Analyses/Pictures/JASP_exp_Marginals.png", width=90%> </center>

So, how should we interpret this graph? Well first of all, the y-axis represents our dependent variable `ViolentImageRating_Mean`. Points near the top of the graph represent greater acceptance of the violent behaviors portrayed in the three photos, while points near the bottom represent lower acceptance. On the x-axis we have (from left to right) "Everyone", "Teen", and "Mature" rated games. Inside the graph, you'll notice that there are six circles -- white circles are the conditions where participants played on a traditional console and black circles are the conditions where participants used a virtual reality headset. There are two lines connecting the three circles in each group -- TV and VR. These lines are meant to help you interpret the trend over increasing levels of `GameRating`. Finally, each circle has two bars extending above and below it. This is the 95% confidence interval. You can think of these lines like the ones we draw on a data distribution to define the regions of rejection for our hypothesis testing -- 95% of the `ViolentImageRating_Mean` values for each condition will fall within this range, and extreme outliers will fall outside this range. If you see two conditions you would like to compare, you can see if this intervals cross over the mean (circle) for the other group. If neither confidence interval overlaps the mean of the other condition, then the two conditions will be significantly different from each other.

In interpreting this graph, we can see that 1) the trend lines are increasing from left to right (main effect for `GameRating`), 2) the black circle (VR) is always higher than the white one (TV) and the confidence intervals never overlap the circles (main effect for `PlayMode`), and 3) the gap between the two trend lines is very small on one side of the graph and larger on the other side (interaction effect for `GameRating * PlayMode`). So to answer **RQ<sub>1</sub>**, yes the mode of videogame playing DOES moderate the relationship between game violence and desensitization to violence.
