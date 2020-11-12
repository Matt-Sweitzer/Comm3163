# Codebook for <a href="https://github.com/Matt-Sweitzer/Comm3163/raw/master/Fall_2020/Example%20Analyses/ExampleExperimentData.csv">example experiment data</a><sup>1</sup>

<sup>1</sup>(right click, save linked file)

This example data set contains data for 180 participants in a factorial experiment. The goal of this example experiment is to determine whether 1) the amount of violence or 2) the style of play in a videogame produces greater desensitization to violent imagery. The data are used in <a href="https://github.com/Matt-Sweitzer/Comm3163/blob/master/Fall_2020/Example%20Analyses/JASP_CheatSheet.md">a tutorial for the JASP statistical software</a>. JASP is freely available for download at https://jasp-stats.org.

## Participant

Nominal Category - identifier to distinguish between responses. Because the sample size (*n*) is 180, there are 180 rows in this data set, each indicating a unique set of responses from one participant.

## Condition

Nominal Category - identifier to distinguish the condition assigned to the participant. This imagined experiment follows a 2 (play mode) by 3 (violence) factorial experimental design. Play mode is operationalized with either a TV or virual reality headset (see `PlayMode` below). Violence is operationalized as the ESRB rating of the games used as experimental stimuli (see `GameRating` below). The conditions are labeled as follows:

|  | Everyone | Teen | Mature |
| :--- | :---: | :---: | :---: |
| Television | Condition 1 | Condition 2 | Condition 3 |
| Virtual Reality | Condition 4 | Condition 5 | Condition 6 |

## ViolentImageRating_1

Interval Numeric - participants' self-reported rating of the level of acceptable violence portrayed in the first image. The question was phrased: "On a scale from 1 to 100, where 1 represents totally unacceptable and 100 represents perfectly acceptable, how would you rate the actions of the person depicted in the following image?"

## ViolentImageRating_2

Interval Numeric - participants' self-reported rating of the level of acceptable violence portrayed in the second image. The question was phrased: "On a scale from 1 to 100, where 1 represents totally unacceptable and 100 represents perfectly acceptable, how would you rate the actions of the person depicted in the following image?"

## ViolentImageRating_3

Interval Numeric - participants' self-reported rating of the level of acceptable violence portrayed in the third image. The question was phrased: "On a scale from 1 to 100, where 1 represents totally unacceptable and 100 represents perfectly acceptable, how would you rate the actions of the person depicted in the following image?"

## ViolentImageRating_Mean

Interval Numeric - mean index of `ViolentImageRating_1`, `ViolentImageRating_2`, and `ViolentImageRating_3`, to be used as the primary dependent variable.

## Gender

Nominal Category - participants' response to the survey question "What is your gender identity?"; (0 = male, 1 = female).

## GameRating

Ordinal Category - the amount of violence in the videogame played by the participants in `Condition`. The values represent the ESRB rating for violence represented in the videogame: (in increasing order) "Everyone", "Teen", or "Mature".

## PlayMode

Nominal Category - the modality of videogame played by the participants in `Condition`. "Television" means that the game was played using a standard videogame mode of a television and single controller. "Virtual Reality" means that the game was played on a virtual reality headset with two independent, motion tracking controllers.
