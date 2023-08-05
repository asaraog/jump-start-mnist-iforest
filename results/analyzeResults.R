# compare the anomaly scores from Python and R
digitLabels = read.csv("labels.csv")
scoresSolitudeR = read.csv("solitudeRScores.csv")
scoresIsotreeR = read.csv("isotreeRScores.csv")
scoresPython = read.csv("pythonScores.csv")
  
# merge the scoring data  
analyzeData <- data.frame("digitLabel" = digitLabels$digitLabel,
	"scoreSolitudeR" = scoresSolitudeR$iforestRScore.anomaly_score,
	"scoreIsotreeR" = scoresIsotreeR$isotreeRScore,
	"scorePython" = scoresPython$iforestPythonScore)

# Note that distributions of anomaly scores have different shapes
# Are there hyperparameter settings that may bring the 
# Python and R results closer together?
pdf(file = "fig-python-anomaly-scores.pdf", width = 11, height = 8.5)
with(analyzeData, plot(density(scorePython)))
dev.off()

pdf(file = "fig-r-solitude-anomaly-scores.pdf", width = 11, height = 8.5)
with(analyzeData, plot(density(scoreSolitudeR)))
dev.off()

pdf(file = "fig-r-isotree-anomaly-scores.pdf", width = 11, height = 8.5)
with(analyzeData, plot(density(scoreIsotreeR)))
dev.off()

pdf(file = "fig-scatterplot-solitude-anomaly-scores.pdf", width = 11, height = 8.5)
with(analyzeData, plot(scorePython,scoreSolitudeR))
title(paste("Correlation between Python and R solitude anomaly scores:",
	as.character(round(with(analyzeData,cor(scorePython,scoreSolitudeR)),digits = 2))))
dev.off()

pdf(file = "fig-scatterplot-isotree-anomaly-scores.pdf", width = 11, height = 8.5)
with(analyzeData, plot(scorePython,scoreIsotreeR))
title(paste("Correlation between Python and R isotree anomaly scores:",
	as.character(round(with(analyzeData,cor(scorePython,scoreIsotreeR)),digits = 2))))
dev.off()
