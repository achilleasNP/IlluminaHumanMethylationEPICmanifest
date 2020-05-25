# The code for the manifest creation is based on the code included in the package
# IlluminaHumanMethylationEPICanno.ilm10b4.hg19.
# The raw data used are the input files listed below with the md5sums.:
# de6945904b5b1d750ff5b76dba0b0840  MethylationEPIC_v-1-0_B5.csv
# 3bb0678989318410489ce77173c7d236  minfiDataEPIC/inst/extdata/200144450021/200144450021_R05C01_Grn.idat
# The idat file is from the minfiDataEpic package while the manifest file is from illumina 
# (https://support.illumina.com/array/array_kits/infinium-methylationepic-beadchip-kit/downloads.html)
library(minfi)
library(illuminaio)
library(devtools)
idat.filepath <- "../../minfiDataEPIC/inst/extdata/200144450021/200144450021_R05C01_Grn.idat" 
manifest.filepath <- "../../../../resources/manifest/MethylationEPIC_v-1-0_B5.csv"

if(!file.exists(idat.filepath) || !file.exists(manifest.filepath)) {
    cat("Missing files, quitting\n")
    q(save = "no")
}

maniTmp <- minfi:::read.manifest.EPIC(manifest.filepath)
anno <- maniTmp$manifest
manifestList <- maniTmp$manifestList

## Checking
epic <- readIDAT(idat.filepath)
address.epic <- as.character(epic$MidBlock)
dropCpGs <- anno$Name[anno$AddressB != "" & !anno$AddressB %in% address.epic]
dropCpGs <- anno$Name[anno$AddressA != "" & !anno$AddressA %in% address.epic]
table(substr(dropCpGs, 1,2))


## Manifest package
IlluminaHumanMethylationEPICmanifest <- do.call(IlluminaMethylationManifest,
                                                list(TypeI = manifestList$TypeI,
                                                     TypeII = manifestList$TypeII,
                                                     TypeControl = manifestList$TypeControl,
                                                     TypeSnpI = manifestList$TypeSnpI,
                                                     TypeSnpII = manifestList$TypeSnpII,
                                                     annotation = "IlluminaHumanMethylationEPIC"))

## Save package data
setwd("..")
use_data(IlluminaHumanMethylationEPICmanifest, internal=TRUE)
