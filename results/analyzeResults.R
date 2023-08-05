# compare the anomaly scores from Python and R
digitLabels = read.csv("labels.csv")
scoresR = read.csv("solitudeRScores.csv")
scoresPython = read.csv("pythonScores.csv")
  
analyzeData = data.frame("digitLabel" = digitLabels$digitLabel,
	"scoreR" = scoresR$iforestRScore.anomaly_score,
	"scorePython" = scoresPython$iforestPythonScore)

# Note that distributions of anomaly scores have different shapes
# Are there hyperparameter settings that may bring the 
# Python and R results closer together?
pdf(file = "fig-python-anomaly-scores.pdf", width = 11, height = 8.5)
with(analyzeData, plot(density(scorePython)))
dev.off()

pdf(file = "fig-r-anomaly-scores.pdf", width = 11, height = 8.5)
with(analyzeData, plot(density(scoreR)))
dev.off()

pdf(file = "fig-scatterplot-solitude-anomaly-scores.pdf", width = 11, height = 8.5)
with(analyzeData, plot(scorePython,scoreR))
title(paste("Correlation between Python and R solitude anomaly scores:",
	as.character(round(with(analyzeData,cor(scorePython,scoreR)),digits = 2))))
dev.off()


