# compare the anomaly scores from Python and Go for each digit
go0 = read.csv("go_data_0.csv")
go1 = read.csv("go_data_1.csv")
go2 = read.csv("go_data_2.csv")
go3 = read.csv("go_data_3.csv")
go4 = read.csv("go_data_4.csv")
go5 = read.csv("go_data_5.csv")
go6 = read.csv("go_data_6.csv")
go7 = read.csv("go_data_7.csv")
go8 = read.csv("go_data_8.csv")
go9 = read.csv("go_data_9.csv")
py0 = read.csv("pythonScores_0.csv")
py1 = read.csv("pythonScores_1.csv")
py2 = read.csv("pythonScores_2.csv")
py3 = read.csv("pythonScores_3.csv")
py4 = read.csv("pythonScores_4.csv")
py5 = read.csv("pythonScores_5.csv")
py6 = read.csv("pythonScores_6.csv")
py7 = read.csv("pythonScores_7.csv")
py8 = read.csv("pythonScores_8.csv")
py9 = read.csv("pythonScores_9.csv")
r0 = read.csv("isotreeRScores_0.csv")
r1 = read.csv("isotreeRScores_1.csv")
r2 = read.csv("isotreeRScores_2.csv")
r3 = read.csv("isotreeRScores_3.csv")
r4 = read.csv("isotreeRScores_4.csv")
r5 = read.csv("isotreeRScores_5.csv")
r6 = read.csv("isotreeRScores_6.csv")
r7 = read.csv("isotreeRScores_7.csv")
r8 = read.csv("isotreeRScores_8.csv")
r9 = read.csv("isotreeRScores_9.csv")

# merge the scoring data  
analyzeData0 <- data.frame(
	"scorePython0" = py0$iforestPythonScore,
	"scoreGo0"= go0$scores,
	"scoreR0"=r0$isotreeRScore)
analyzeData1 <- data.frame(
	"scorePython1" = py1$iforestPythonScore,
	"scoreGo1"= go1$scores,
	"scoreR1"=r1$isotreeRScore)
analyzeData2 <- data.frame(
	"scorePython2" = py2$iforestPythonScore,
	"scoreGo2"= go2$scores,
	"scoreR2"=r2$isotreeRScore)
analyzeData3 <- data.frame(
	"scorePython3" = py3$iforestPythonScore,
	"scoreGo3"= go3$scores,
	"scoreR3"=r3$isotreeRScore)
analyzeData4 <- data.frame(
	"scorePython4" = py4$iforestPythonScore,
	"scoreGo4"= go4$scores,
	"scoreR4"=r4$isotreeRScore)
analyzeData5 <- data.frame(
	"scorePython5" = py5$iforestPythonScore,
	"scoreGo5"= go5$scores,
	"scoreR5"=r5$isotreeRScore)
analyzeData6 <- data.frame(
	"scorePython6" = py6$iforestPythonScore,
	"scoreGo6"= go6$scores,
	"scoreR6"=r6$isotreeRScore)
analyzeData7 <- data.frame(
	"scorePython7" = py7$iforestPythonScore,
	"scoreGo7"= go7$scores,
	"scoreR7"=r7$isotreeRScore)
analyzeData8 <- data.frame(
	"scorePython8" = py8$iforestPythonScore,
	"scoreGo8"= go8$scores,
	"scoreR8"=r8$isotreeRScore)
analyzeData9 <- data.frame(
	"scorePython9" = py9$iforestPythonScore,
	"scoreGo9"= go9$scores,
	"scoreR9"=r9$isotreeRScore)


cat("\n","Correlation scores between Python and Go running independent tests for each digit with average 0.92", "\n", "\n")
cat("Correlation scores for the digit 0: ",round(with(analyzeData0,cor(scorePython0,scoreGo0)),digits = 2), "\n") #0.89
cat("Correlation scores for the digit 1: ",round(with(analyzeData1,cor(scorePython1,scoreGo1)),digits = 2), "\n") #0.95
cat("Correlation scores for the digit 2: ",round(with(analyzeData2,cor(scorePython2,scoreGo2)),digits = 2), "\n") #0.88
cat("Correlation scores for the digit 3: ",round(with(analyzeData3,cor(scorePython3,scoreGo3)),digits = 2), "\n") #0.93
cat("Correlation scores for the digit 4: ",round(with(analyzeData4,cor(scorePython4,scoreGo4)),digits = 2), "\n") #0.9
cat("Correlation scores for the digit 5: ",round(with(analyzeData5,cor(scorePython5,scoreGo5)),digits = 2), "\n") #0.92
cat("Correlation scores for the digit 6: ",round(with(analyzeData6,cor(scorePython6,scoreGo6)),digits = 2), "\n") #0.94
cat("Correlation scores for the digit 7: ",round(with(analyzeData7,cor(scorePython7,scoreGo7)),digits = 2), "\n") #0.94
cat("Correlation scores for the digit 8: ",round(with(analyzeData8,cor(scorePython8,scoreGo8)),digits = 2), "\n") #0.91
cat("Correlation scores for the digit 9: ",round(with(analyzeData9,cor(scorePython9,scoreGo9)),digits = 2), "\n") #0.94

cat("\n","Correlation scores between Python and Risotree running independent tests for each digit with average 0.67", "\n", "\n")
cat("Correlation scores for the digit 0: ",round(with(analyzeData0,cor(scorePython0,scoreR0)),digits = 2), "\n") #0.43
cat("Correlation scores for the digit 1: ",round(with(analyzeData1,cor(scorePython1,scoreR1)),digits = 2), "\n") #0.77
cat("Correlation scores for the digit 2: ",round(with(analyzeData2,cor(scorePython2,scoreR2)),digits = 2), "\n") #0.48
cat("Correlation scores for the digit 3: ",round(with(analyzeData3,cor(scorePython3,scoreR3)),digits = 2), "\n") #0.66
cat("Correlation scores for the digit 4: ",round(with(analyzeData4,cor(scorePython4,scoreR4)),digits = 2), "\n") #0.61
cat("Correlation scores for the digit 5: ",round(with(analyzeData5,cor(scorePython5,scoreR5)),digits = 2), "\n") #0.69
cat("Correlation scores for the digit 6: ",round(with(analyzeData6,cor(scorePython6,scoreR6)),digits = 2), "\n") #0.73
cat("Correlation scores for the digit 7: ",round(with(analyzeData7,cor(scorePython7,scoreR7)),digits = 2), "\n") #0.68
cat("Correlation scores for the digit 8: ",round(with(analyzeData8,cor(scorePython8,scoreR8)),digits = 2), "\n") #0.7
cat("Correlation scores for the digit 9: ",round(with(analyzeData9,cor(scorePython9,scoreR9)),digits = 2), "\n") #0.74

cat("\n","Correlation scores between Risotree and Go running independent tests for each digit with average 0.65", "\n", "\n")
cat("Correlation scores for the digit 0: ",round(with(analyzeData0,cor(scoreR0,scoreGo0)),digits = 2), "\n") #0.42
cat("Correlation scores for the digit 1: ",round(with(analyzeData1,cor(scoreR1,scoreGo1)),digits = 2), "\n") #0.75
cat("Correlation scores for the digit 2: ",round(with(analyzeData2,cor(scoreR2,scoreGo2)),digits = 2), "\n") #0.46
cat("Correlation scores for the digit 3: ",round(with(analyzeData3,cor(scoreR3,scoreGo3)),digits = 2), "\n") #0.61
cat("Correlation scores for the digit 4: ",round(with(analyzeData4,cor(scoreR4,scoreGo4)),digits = 2), "\n") #0.59
cat("Correlation scores for the digit 5: ",round(with(analyzeData5,cor(scoreR5,scoreGo5)),digits = 2), "\n") #0.67
cat("Correlation scores for the digit 6: ",round(with(analyzeData6,cor(scoreR6,scoreGo6)),digits = 2), "\n") #0.69
cat("Correlation scores for the digit 7: ",round(with(analyzeData7,cor(scoreR7,scoreGo7)),digits = 2), "\n") #0.68
cat("Correlation scores for the digit 8: ",round(with(analyzeData8,cor(scoreR8,scoreGo8)),digits = 2), "\n") #0.7
cat("Correlation scores for the digit 9: ",round(with(analyzeData9,cor(scoreR9,scoreGo9)),digits = 2), "\n") #0.72
