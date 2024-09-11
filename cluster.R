library("Ckmeans.1d.dp")
library("rjson")
holecard_pmfs <- fromJSON(file = "C:/Users/tieyo/projects/holdem_rank_clustering/outs.json")
weights = vector("integer", 4823)
for(key in names(holecard_pmfs)) {
	weights <- weights + unlist(holecard_pmfs[key])
}
t = seq(0,4822)
max_clusters = 500
result_distances = vector("integer", max_clusters)

for(i in seq(2, max_clusters)) {
	result_distances[i-1] <- Ckmeans.1d.dp(t, k=40, weights)$betweenss
}	

relative_distances = vector("numeric", max_clusters - 3)
for(i in seq(3, max_clusters - 1)) {
    relative_distances[i-3] <- result_distances[i] - result_distances[i-1]
}
print(relative_distances)
