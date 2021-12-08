#!/bin/bash

# Usage:
# csmit -m 20G -c 47 "bash ./plotFingerprint_bam_samtools1.10_ChIP.sh t2t-col.20210610 MAPQ10_XM2 both max 081221 Col_CENH3_PE150_Rep1_input WT_CENH3_Rep1_ChIP_SRR4430537 Col_CENH3_PE150_Rep1_ChIP Col_CENH3_PE250_Rep1_ChIP met1_CENH3_PE150_Rep1_ChIP met1_CENH3_PE250_Rep1_ChIP ddc_CENH3_PE250_Rep1_ChIP kss_CENH3_PE250_Rep1_ChIP cmt2_cmt3_CENH3_PE250_Rep1_ChIP"

refbase=${1}
params=${2}
align=${3}
threads=${4}
date=${5}
dat1=${6}
dat2=${7}
dat3=${8}
dat4=${9}
dat5=${10}
dat6=${11}
dat7=${12}
dat8=${13}
dat9=${14}

source activate ChIPseq_mapping

[ -d ${params}_out ] || mkdir -p ${params}_out

plotFingerprint -b ${params}_bam/${dat1}_MappedOn_${refbase}_lowXM_${align}_sort.bam \
                   ${params}_bam/${dat2}_MappedOn_${refbase}_lowXM_${align}_sort.bam \
                   ${params}_bam/${dat3}_MappedOn_${refbase}_lowXM_${align}_sort.bam \
                   ${params}_bam/${dat4}_MappedOn_${refbase}_lowXM_${align}_sort.bam \
                   ${params}_bam/${dat5}_MappedOn_${refbase}_lowXM_${align}_sort.bam \
                   ${params}_bam/${dat6}_MappedOn_${refbase}_lowXM_${align}_sort.bam \
                   ${params}_bam/${dat7}_MappedOn_${refbase}_lowXM_${align}_sort.bam \
                   ${params}_bam/${dat8}_MappedOn_${refbase}_lowXM_${align}_sort.bam \
                   ${params}_bam/${dat9}_MappedOn_${refbase}_lowXM_${align}_sort.bam \
                --labels ${dat1} ${dat2} ${dat3} ${dat4} ${dat5} ${dat6} ${dat7} ${dat8} ${dat9} \
                -o ${params}_out/CENH3_ChIP_fingerprints_bam_MappedOn_${refbase}_${align}_${date}.pdf \
                --extendReads \
                --outRawCounts ${params}_out/CENH3_ChIP_fingerprints_bam_MappedOn_${refbase}_${align}_${date}.tab \
                --outQualityMetrics ${params}_out/CENH3_ChIP_fingerprints_bam_MappedOn_${refbase}_${align}_${date}_QC.txt \
                --JSDsample ${params}_bam/${dat1}_MappedOn_${refbase}_lowXM_${align}_sort.bam \
                -p ${threads}

conda deactivate
