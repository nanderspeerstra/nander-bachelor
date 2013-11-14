# PCA with function prcomp
tabel_NG = read.table("../features/ng1_tabel.txt", header=FALSE)
pca1 = prcomp(tabel_NG)
# pca1$sdev       		# sqrt of eigenvalues
# pca1$rotation   		# loadings
# pca1$x          		# pcs (aka scores)

columns = 200
pcad = matrix(nrow=600, ncol=columns)
for(i in 1:columns){
	pcad[,i] = pca1$x[,i];
}

write.table(pcad, file="ng1_PCA.txt", row.names=FALSE,col.names=FALSE,sep=",")
