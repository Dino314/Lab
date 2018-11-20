install.packages("seqinr")
library(seqinr)

tolower("ASD")

toupper("asd")

vektor <- (s2c("asdasds"))

c2s(vektor)

choosebank("swissprot")

s1<-query("s1", "AC=Q9CD83")
s1seq <- getSequence(s1$req[[1]])

s2<-query("s2", "AC=A0PQ23")
s2seq <- getSequence(s2$req[[1]])
closebank()

str(s1)

str(s1$req)

s1$req[[1]]

head(s1seq,30)

tail(s1seq,30)

vse <- list(s1, s2)

vse$Q9CD83$req

names(vse$Q9CD83$req)

sapply(vse, function(x) x$req)

s <- "SA*ALMAGML*A"
s
start <- regexpr("\\*.*M",s)
start

s2c(s)
1:start
s1 <- s2c(s)[-(1:start)]
s1


lfn <- "brca.fasta"
lfn <- read.fasta(lfn)

header <- readLines(lfn, n = 1)
header

data <- readLines(lfn, n=-1)

dna <- data[-1]

paste(dna, collapse="")

################knjiga vaje

fasta <- "NC_001477.fasta"

readLines(fasta, n=1)




choosebank("refseqViruses")
a <-query("Dengue1", "AC=NC_001477")
a
