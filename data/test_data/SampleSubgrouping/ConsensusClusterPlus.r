setwd('/mnt/storage/user/guixiuqi/rsgeno/protein/reversezMAP_github/data/test_data/SampleSubgrouping')
library(ConsensusClusterPlus)
dc = read.csv('/mnt/storage/user/guixiuqi/rsgeno/protein/reversezMAP_github/data/test_data/SampleSubgrouping/top_variance_tumor_z_df_dropna_3000_1673.txt',sep='	',row.names = 1,check.names=FALSE)
dc = as.matrix(dc)
rcc = ConsensusClusterPlus(dc,maxK=8,reps=1000,pItem=0.8,pFeature=1,title='euclidean_km',                            distance='euclidean',clusterAlg='km',plot='pdf',seed=1262118322)
cluster <- rcc[[2]]$consensusClass
write.csv(cluster,file='/mnt/storage/user/guixiuqi/rsgeno/protein/reversezMAP_github/data/test_data/SampleSubgrouping/cluster_2.csv', quote = FALSE)
cluster <- rcc[[3]]$consensusClass
write.csv(cluster,file='/mnt/storage/user/guixiuqi/rsgeno/protein/reversezMAP_github/data/test_data/SampleSubgrouping/cluster_3.csv', quote = FALSE)
cluster <- rcc[[4]]$consensusClass
write.csv(cluster,file='/mnt/storage/user/guixiuqi/rsgeno/protein/reversezMAP_github/data/test_data/SampleSubgrouping/cluster_4.csv', quote = FALSE)
cluster <- rcc[[5]]$consensusClass
write.csv(cluster,file='/mnt/storage/user/guixiuqi/rsgeno/protein/reversezMAP_github/data/test_data/SampleSubgrouping/cluster_5.csv', quote = FALSE)
cluster <- rcc[[6]]$consensusClass
write.csv(cluster,file='/mnt/storage/user/guixiuqi/rsgeno/protein/reversezMAP_github/data/test_data/SampleSubgrouping/cluster_6.csv', quote = FALSE)
cluster <- rcc[[7]]$consensusClass
write.csv(cluster,file='/mnt/storage/user/guixiuqi/rsgeno/protein/reversezMAP_github/data/test_data/SampleSubgrouping/cluster_7.csv', quote = FALSE)
cluster <- rcc[[8]]$consensusClass
write.csv(cluster,file='/mnt/storage/user/guixiuqi/rsgeno/protein/reversezMAP_github/data/test_data/SampleSubgrouping/cluster_8.csv', quote = FALSE)
