#!/usr/bin/bash
# --taxonomy /home/projects/cpr_10006/people/svekut/mmseq2/almeida_taxonomy.tsv \
# --taxonomy_predictions /home/projects/cpr_10006/projects/vamb/almeida_vaevaeout/results_taxonomy_predictor.csv \
run_id=$1
    # --cuda \


vamb taxometer \
    --outdir /home/projects/cpr_10006/people/svekut/long_read_human_kfold_predictor_v207_${run_id}_gpu \
    --fasta /home/projects/cpr_10006/projects/semi_vamb/data/human_longread/contigs_2kbp.fna \
    --rpkm /home/projects/cpr_10006/projects/semi_vamb/data/human_longread/vambout/abundance.npz \
    --taxonomy /home/projects/cpr_10006/people/svekut/04_mmseq2/taxonomy_cami_kfold/human_longread_taxonomy_${run_id}.tsv \
    -pe 100 \
    -pq  \
    -pt 1024 \
    --cuda \
    -ploss flat_softmax
