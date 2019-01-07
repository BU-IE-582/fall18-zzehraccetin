require(data.table)
require(TunePareto)
require(glmnet)

setwd("/Users/zehra/Desktop/IE582/Project")

testStart=as.Date('2018-11-16')
trainStart=as.Date('2012-07-15')
rem_miss_threshold=0.01 #parameter for removing bookmaker odds with missing ratio greater than this threshold

source('data_preprocessing.R')
source('feature_extraction.R')
source('performance_metrics.R')
source('train_models.R')

matches_data_path='/Users/zehra/Desktop/IE582/Project/df9b1196-e3cf-4cc7-9159-f236fe738215_matches.rds'
odd_details_data_path='/Users/zehra/Desktop/IE582/Project/df9b1196-e3cf-4cc7-9159-f236fe738215_odd_details.rds'

# read data
matches_raw=readRDS(matches_data_path)
odd_details_raw=readRDS(odd_details_data_path)

# preprocess matches
matches=matches_data_preprocessing(matches_raw)

# preprocess odd data
odd_details=details_data_preprocessing(odd_details_raw,matches)

# extract open and close odd type features from multiple bookmakers
features=extract_features.openclose(matches,odd_details,pMissThreshold=rem_miss_threshold,trainStart,testStart)
#SAAT12 
matches12=matches[Match_Hour=='12']
nofeachgame<-table(matches12$Match_Result)
totalgames<-sum(table((matches12$Match_Result)))
away_ratio_12<-nofeachgame["Away"]/totalgames
tie_ratio_12<-nofeachgame["Tie"]/totalgames
home_ratio_12<-nofeachgame["Home"]/totalgames

#SAAT13
matches13=matches[Match_Hour=='13']
nofeachgame<-table(matches13$Match_Result)
totalgames<-sum(table((matches13$Match_Result)))
away_ratio_13<-nofeachgame["Away"]/totalgames
tie_ratio_13<-nofeachgame["Tie"]/totalgames
home_ratio_13<-nofeachgame["Home"]/totalgames


#SAAT14
matches14=matches[Match_Hour=='14']
nofeachgame<-table(matches14$Match_Result)
totalgames<-sum(table((matches14$Match_Result)))
away_ratio_14<-nofeachgame["Away"]/totalgames
tie_ratio_14<-nofeachgame["Tie"]/totalgames
home_ratio_14<-nofeachgame["Home"]/totalgames


#SAAT15
matches15=matches[Match_Hour=='15']
nofeachgame<-table(matches15$Match_Result)
totalgames<-sum(table((matches15$Match_Result)))
away_ratio_15<-nofeachgame["Away"]/totalgames
tie_ratio_15<-nofeachgame["Tie"]/totalgames
home_ratio_15<-nofeachgame["Home"]/totalgames

#SAAT16
matches16=matches[Match_Hour=='16']
nofeachgame<-table(matches16$Match_Result)
totalgames<-sum(table((matches16$Match_Result)))
away_ratio_16<-nofeachgame["Away"]/totalgames
tie_ratio_16<-nofeachgame["Tie"]/totalgames
home_ratio_16<-nofeachgame["Home"]/totalgames

#SAAT17
matches17=matches[Match_Hour=='17']
nofeachgame<-table(matches17$Match_Result)
totalgames<-sum(table((matches17$Match_Result)))
away_ratio_17<-nofeachgame["Away"]/totalgames
tie_ratio_17<-nofeachgame["Tie"]/totalgames
home_ratio_17<-nofeachgame["Home"]/totalgames

#SAAT19
matches19=matches[Match_Hour=='19']
nofeachgame<-table(matches19$Match_Result)
totalgames<-sum(table((matches19$Match_Result)))
away_ratio_19<-nofeachgame["Away"]/totalgames
tie_ratio_19<-nofeachgame["Tie"]/totalgames
home_ratio_19<-nofeachgame["Home"]/totalgames

#SAAT20
matches20=matches[Match_Hour=='20']
nofeachgame<-table(matches20$Match_Result)
totalgames<-sum(table((matches20$Match_Result)))
away_ratio_20<-nofeachgame["Away"]/totalgames
tie_ratio_20<-nofeachgame["Tie"]/totalgames
home_ratio_20<-nofeachgame["Home"]/totalgames


#SAAT12 DATAFRAME
dfhour12<-data.frame(home_ratio_12,tie_ratio_12,away_ratio_12)	
row.names(dfhour12)<-c("Hour12")
names(dfhour12)<-c("Home","Tie","Away")

#SAAT13 DATAFRAME
dfhour13<-data.frame(home_ratio_13,tie_ratio_13,away_ratio_13)	
row.names(dfhour13)<-c("Hour13")
names(dfhour13)<-c("Home","Tie","Away")

#SAAT14 DATAFRAME
dfhour14<-data.frame(home_ratio_14,tie_ratio_14,away_ratio_14)	
row.names(dfhour14)<-c("Hour14")
names(dfhour14)<-c("Home","Tie","Away")

#SAAT15 DATAFRAME
dfhour15<-data.frame(home_ratio_15,tie_ratio_15,away_ratio_15)	
row.names(dfhour15)<-c("Hour15")
names(dfhour15)<-c("Home","Tie","Away")

#SAAT16 DATAFRAME
dfhour16<-data.frame(home_ratio_16,tie_ratio_16,away_ratio_16)	
row.names(dfhour16)<-c("Hour16")
names(dfhour16)<-c("Home","Tie","Away")

#SAAT17 DATAFRAME
dfhour17<-data.frame(home_ratio_17,tie_ratio_17,away_ratio_17)	
row.names(dfhour17)<-c("Hour17")
names(dfhour17)<-c("Home","Tie","Away")

#SAAT19 DATAFRAME
dfhour19<-data.frame(home_ratio_19,tie_ratio_19,away_ratio_19)	
row.names(dfhour19)<-c("Hour19")
names(dfhour19)<-c("Home","Tie","Away")

#SAAT20 DATAFRAME
dfhour20<-data.frame(home_ratio_20,tie_ratio_20,away_ratio_20)	
row.names(dfhour20)<-c("Hour20")
names(dfhour20)<-c("Home","Tie","Away")

#TABLO
dfhour<-rbind(dfhour12, dfhour13, dfhour14, dfhour15, dfhour16, dfhour17, dfhour19, dfhour20)


features[Match_Hour==12,Home:=dfhour[1,1]]

features[Match_Hour==12,Tie:=dfhour[1,2]]

features[Match_Hour==12, Away:=dfhour[1,3]]

features[Match_Hour==13,Home:=dfhour[2,1]]

features[Match_Hour==13,Tie:=dfhour[2,2]]

features[Match_Hour==13, Away:=dfhour[2,3]]
features[Match_Hour==14,Home:=dfhour[3,1]]

features[Match_Hour==14,Tie:=dfhour[3,2]]

features[Match_Hour==14, Away:=dfhour[3,3]]
features[Match_Hour==15,Home:=dfhour[4,1]]

features[Match_Hour==15,Tie:=dfhour[4,2]]

features[Match_Hour==15, Away:=dfhour[4,3]]
features[Match_Hour==16,Home:=dfhour[5,1]]

features[Match_Hour==16,Tie:=dfhour[5,2]]

features[Match_Hour==16, Away:=dfhour[5,3]]
features[Match_Hour==17,Home:=dfhour[6,1]]

features[Match_Hour==17,Tie:=dfhour[6,2]]

features[Match_Hour==17, Away:=dfhour[6,3]]
features[Match_Hour==19,Home:=dfhour[7,1]]

features[Match_Hour==19,Tie:=dfhour[7,2]]

features[Match_Hour==19, Away:=dfhour[7,3]]
features[Match_Hour==20,Home:=dfhour[8,1]]

features[Match_Hour==20,Tie:=dfhour[8,2]]

features[Match_Hour==20, Away:=dfhour[8,3]]

features=features[,meanodd1_10bet:=(features$Odd_Open_odd1_10Bet+features$Odd_Close_odd1_10Bet)/2]
features=features[,meanodd1_12BET:=(features$Odd_Open_odd1_12BET+features$Odd_Close_odd1_12BET)/2]
features=features[,meanodd1_BetVictor:=(features$Odd_Open_odd1_BetVictor+features$Odd_Close_odd1_BetVictor)/2]
features=features[,meanodd1_Betclic:=(features$Odd_Open_odd1_Betclic+features$Odd_Close_odd1_Betclic)/2]

features=features[,meanodd1_Betway:=(features$Odd_Open_odd1_Betway+features$Odd_Close_odd1_Betway)/2]  

features=features[,meanodd1_WilliamHill:=(features$Odd_Open_odd1_WilliamHill+features$Odd_Close_odd1_WilliamHill)/2] 

features=features[,meanodd1_bet365:=(features$Odd_Open_odd1_bet365+features$Odd_Close_odd1_bet365)/2]

features=features[,meanodd1_bwin:=(features$Odd_Open_odd1_bwin+features$Odd_Close_odd1_bwin)/2]
features=features[,meanodd2_10bet:=(features$Odd_Open_odd2_10Bet+features$Odd_Close_odd2_10Bet)/2]
features=features[,meanodd2_12BET:=(features$Odd_Open_odd2_12BET+features$Odd_Close_odd2_12BET)/2]
features=features[,meanodd2_BetVictor:=(features$Odd_Open_odd2_BetVictor+features$Odd_Close_odd2_BetVictor)/2]
features=features[,meanodd2_Betclic:=(features$Odd_Open_odd2_Betclic+features$Odd_Close_odd2_Betclic)/2]
features=features[,meanodd2_Betway:=(features$Odd_Open_odd2_Betway+features$Odd_Close_odd2_Betway)/2]
features=features[,meanodd2_WilliamHill:=(features$Odd_Open_odd2_WilliamHill+features$Odd_Close_odd2_WilliamHill)/2]
features=features[,meanodd2_bet365:=(features$Odd_Open_odd2_bet365+features$Odd_Close_odd2_bet365)/2]
features=features[,meanodd2_bwin:=(features$Odd_Open_odd2_bwin+features$Odd_Close_odd2_bwin)/2]
features=features[,meanoddX_10bet:=(features$Odd_Open_oddX_10Bet+features$Odd_Close_oddX_10Bet)/2]
features=features[,meanoddX_12BET:=(features$Odd_Open_oddX_12BET+features$Odd_Close_oddX_12BET)/2]
features=features[,meanoddX_BetVictor:=(features$Odd_Open_oddX_BetVictor+features$Odd_Close_oddX_BetVictor)/2]
features=features=features[,meanoddX_Betclic:=(features$Odd_Open_oddX_Betclic+features$Odd_Close_oddX_Betclic)/2]
features=features[,meanoddX_Betway:=(features$Odd_Open_oddX_Betway+features$Odd_Close_oddX_Betway)/2]
features=features[,meanoddX_WilliamHill:=(features$Odd_Open_oddX_WilliamHill+features$Odd_Close_oddX_WilliamHill)/2]
features=features[,meanoddX_bet365:=(features$Odd_Open_oddX_bet365+features$Odd_Close_oddX_bet365)/2]
features=features[,meanoddX_bwin:=(features$Odd_Open_oddX_bwin+features$Odd_Close_oddX_bwin)/2]


features=features[,-6:-53]
features=features[,-4]
# divide data based on the provided dates 
train_features=features[Match_Date>=trainStart & Match_Date<testStart] 
test_features=features[Match_Date>=testStart] 

# run glmnet on train data with tuning lambda parameter based on RPS and return predictions based on lambda with minimum RPS
predictions=train_glmnet(train_features, test_features,not_included_feature_indices=c(1:5), alpha=1,nlambda=50, tune_lambda=TRUE,nofReplications=2,nFolds=10,trace=T)
predictions   