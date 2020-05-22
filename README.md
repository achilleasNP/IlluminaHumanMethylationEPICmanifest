# IlluminaHumanMethylationEPICB5manifest

Illumina Human Methylation Manifest based on 1.0 B5 to be used with R and minfi.

The default Manifest used by minfi comes from the bioconductor package [IlluminaHumanMethylationEPICmanifest]( http://bioconductor.org/packages/release/data/annotation/html/IlluminaHumanMethylationEPICmanifest.html)
which at it's current version 0.6.0 uses manifest 1.0 B2. 

This package provides a manifest based on the 1.0B5 manifest file [infinium-methylationepic-v-1-0-b5-manifest-file-csv.zip](http://webdata.illumina.com.s3-website-us-east-1.amazonaws.com/downloads/productfiles/methylationEPIC/infinium-methylationepic-v-1-0-b5-manifest-file-csv.zip) from [Illumina](https://support.illumina.com/array/array_kits/infinium-methylationepic-beadchip-kit/downloads.html).

## Installation instructions
You can install it in R by using the devtools library and doing:
```r
 library(devtools)
 install_github("achilleasNP/IlluminaHumanMethylationEPICB5manifest") 
 ```
 and force minfi to use the package by setting the annotation of your "RGChannelSet" object as below:

## Usage instructions 
 ```r
RGset@annotation = c(array = "IlluminaHumanMethylationEPICB5", annotation = "ilm10b5.hg38")
```
