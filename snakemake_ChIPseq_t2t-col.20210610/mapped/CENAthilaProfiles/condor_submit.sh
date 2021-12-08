#!/bin/bash

# Usage on node7 of the Plant Sciences cluster:
# /scripts/csmit -m 20G -c 24 "bash condor_submit.sh"

source activate ChIPseq_mapping
snakemake -p --cores 24
source deactivate
