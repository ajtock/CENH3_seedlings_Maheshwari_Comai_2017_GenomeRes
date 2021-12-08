#!/bin/bash

source ~/.profile
source activate ChIPseq_mapping
snakemake -p --cores 48
source deactivate
