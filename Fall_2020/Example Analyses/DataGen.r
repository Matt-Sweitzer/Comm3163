data<-data.frame(
  Participant=1:180,
  Condition=rep(1:6, 30),
  ViolentImageRating_1=NA,
  ViolentImageRating_2=NA,
  ViolentImageRating_3=NA,
  ViolentImageRating_Mean=NA,
  Gender=NA
)

set.seed(123)
data$Gender<-sample(c(0,1), 180, replace=T)

set.seed(123)
data$ViolentImageRating_1[data$Condition==1]<-floor(rnorm(30, m=12, sd=10))
data$ViolentImageRating_2[data$Condition==1]<-floor(rnorm(30, m=12, sd=9))
data$ViolentImageRating_3[data$Condition==1]<-floor(rnorm(30, m=12, sd=8))

set.seed(456)
data$ViolentImageRating_1[data$Condition==2]<-floor(rnorm(30, m=40, sd=13))
data$ViolentImageRating_2[data$Condition==2]<-floor(rnorm(30, m=40, sd=13.5))
data$ViolentImageRating_3[data$Condition==2]<-floor(rnorm(30, m=40, sd=15))

set.seed(789)
data$ViolentImageRating_1[data$Condition==3]<-floor(rnorm(30, m=75, sd=16))
data$ViolentImageRating_2[data$Condition==3]<-floor(rnorm(30, m=75, sd=15.5))
data$ViolentImageRating_3[data$Condition==3]<-floor(rnorm(30, m=75, sd=16.5))

set.seed(135)
data$ViolentImageRating_1[data$Condition==4]<-floor(rnorm(30, m=17, sd=7))
data$ViolentImageRating_2[data$Condition==4]<-floor(rnorm(30, m=16, sd=7))
data$ViolentImageRating_3[data$Condition==4]<-floor(rnorm(30, m=17, sd=8))

set.seed(246)
data$ViolentImageRating_1[data$Condition==5]<-floor(rnorm(30, m=50, sd=6))
data$ViolentImageRating_2[data$Condition==5]<-floor(rnorm(30, m=49, sd=14))
data$ViolentImageRating_3[data$Condition==5]<-floor(rnorm(30, m=52, sd=12))

set.seed(987)
data$ViolentImageRating_1[data$Condition==6]<-floor(rnorm(30, m=86, sd=13))
data$ViolentImageRating_2[data$Condition==6]<-floor(rnorm(30, m=87, sd=12))
data$ViolentImageRating_3[data$Condition==6]<-floor(rnorm(30, m=83, sd=13))

data$ViolentImageRating_1[data$ViolentImageRating_1<1]<-1
data$ViolentImageRating_2[data$ViolentImageRating_2<1]<-1
data$ViolentImageRating_3[data$ViolentImageRating_3<1]<-1
data$ViolentImageRating_1[data$ViolentImageRating_1>100]<-100
data$ViolentImageRating_2[data$ViolentImageRating_2>100]<-100
data$ViolentImageRating_3[data$ViolentImageRating_3>100]<-100

data$ViolentImageRating_Mean<-rowMeans(cbind(data$ViolentImageRating_1, data$ViolentImageRating_2, data$ViolentImageRating_3))

data$GameRating<-NA
data$PlayMode<-NA

data$GameRating[data$Condition==1]<-"Everyone"
data$GameRating[data$Condition==2]<-"Teen"
data$GameRating[data$Condition==3]<-"Mature"
data$GameRating[data$Condition==4]<-"Everyone"
data$GameRating[data$Condition==5]<-"Teen"
data$GameRating[data$Condition==6]<-"Mature"

data$PlayMode[data$Condition==1]<-"Television"
data$PlayMode[data$Condition==2]<-"Television"
data$PlayMode[data$Condition==3]<-"Television"
data$PlayMode[data$Condition==4]<-"Virtual Reality"
data$PlayMode[data$Condition==5]<-"Virtual Reality"
data$PlayMode[data$Condition==6]<-"Virtual Reality"

set.seed(1987)
data2<-data[sample(1:180, 180, replace=F),]
data2$Participant<-1:180

write.csv(data2, "/Users/Sweitzer/Box/Fall 2020 Semester/Comm_3163/Lab Slides/SoftwareGuides/ExampleData/Experiment/ExampleExperimentData.csv", row.names=F)
