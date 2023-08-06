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
  
# merge the scoring data  
analyzeData0 <- data.frame(
	"scorePython0" = py0$iforestPythonScore,
	"scoreGo0"= go0$scores)
analyzeData1 <- data.frame(
	"scorePython1" = py1$iforestPythonScore,
	"scoreGo1"= go1$scores)
analyzeData2 <- data.frame(
	"scorePython2" = py2$iforestPythonScore,
	"scoreGo2"= go2$scores)
analyzeData3 <- data.frame(
	"scorePython3" = py3$iforestPythonScore,
	"scoreGo3"= go3$scores)
analyzeData4 <- data.frame(
	"scorePython4" = py4$iforestPythonScore,
	"scoreGo4"= go4$scores)
analyzeData5 <- data.frame(
	"scorePython5" = py5$iforestPythonScore,
	"scoreGo5"= go5$scores)
analyzeData6 <- data.frame(
	"scorePython6" = py6$iforestPythonScore,
	"scoreGo6"= go6$scores)
analyzeData7 <- data.frame(
	"scorePython7" = py7$iforestPythonScore,
	"scoreGo7"= go7$scores)
analyzeData8 <- data.frame(
	"scorePython8" = py8$iforestPythonScore,
	"scoreGo8"= go8$scores)
analyzeData9 <- data.frame(
	"scorePython9" = py9$iforestPythonScore,
	"scoreGo9"= go9$scores)

# Note that distributions of anomaly scores have different shapes
# Are there hyperparameter settings that may bring the 
# Python and R results closer together?
cat("\n","Correlation scores between Python and Go running independent tests for each digit", "\n", "\n")
cat("Correlation scores for the digit 0: ",round(with(analyzeData0,cor(scorePython0,scoreGo0)),digits = 2), "\n")
cat("Correlation scores for the digit 1: ",round(with(analyzeData1,cor(scorePython1,scoreGo1)),digits = 2), "\n")
cat("Correlation scores for the digit 2: ",round(with(analyzeData2,cor(scorePython2,scoreGo2)),digits = 2), "\n")
cat("Correlation scores for the digit 3: ",round(with(analyzeData3,cor(scorePython3,scoreGo3)),digits = 2), "\n")
cat("Correlation scores for the digit 4: ",round(with(analyzeData4,cor(scorePython4,scoreGo4)),digits = 2), "\n")
cat("Correlation scores for the digit 5: ",round(with(analyzeData5,cor(scorePython5,scoreGo5)),digits = 2), "\n")
cat("Correlation scores for the digit 6: ",round(with(analyzeData6,cor(scorePython6,scoreGo6)),digits = 2), "\n")
cat("Correlation scores for the digit 7: ",round(with(analyzeData7,cor(scorePython7,scoreGo7)),digits = 2), "\n")
cat("Correlation scores for the digit 8: ",round(with(analyzeData8,cor(scorePython8,scoreGo8)),digits = 2), "\n")
cat("Correlation scores for the digit 9: ",round(with(analyzeData9,cor(scorePython9,scoreGo9)),digits = 2), "\n")