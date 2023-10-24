#!/usr/bin/bash
dataset=$1
annotator=$2
thres=$3

    # --taxonomy /home/projects/cpr_10006/people/svekut/mmseq2/${dataset}_taxonomy_2023.tsv \
    # --taxonomy_predictions /home/projects/cpr_10006/people/svekut/cami2_urog_out_32_667/results_taxonomy_predictor.csv
    # --taxonomy /home/projects/cpr_10006/people/svekut/mmseq2/${dataset}_taxonomy.tsv \

# vamb \
#     --model vaevae \
#     --outdir /home/projects/cpr_10006/people/svekut/cami2_${dataset}_${annotator}_${thres}_test \
#     --fasta /home/projects/cpr_10006/projects/vamb/data/datasets/cami2_${dataset}/contigs_2kbp.fna.gz \
#     --rpkm /home/projects/cpr_10006/projects/vamb/data/datasets/cami2_${dataset}/abundance.npz \
#     --taxonomy /home/projects/cpr_10006/people/svekut/04_mmseq2/taxonomy_cami_kfold/${dataset}_taxonomy_${annotator}.tsv \
#     -l 32 \
#     -e 300 \
#     -q  \
#     -t 1024 \
#     -pe 100 \
#     -pq  \
#     -pt 1024 \
#     -pthr ${thres} \
#     -o C \
#     --cuda \
#     --minfasta 200000

vamb \
    --model reclustering \
    --latent_path /home/projects/cpr_10006/people/svekut/cami2_${dataset}_${annotator}_${thres}/vaevae_latent.npy \
    --clusters_path /home/projects/cpr_10006/people/svekut/cami2_${dataset}_${annotator}_${thres}/vaevae_clusters.tsv  \
    --fasta /home/projects/cpr_10006/projects/vamb/data/datasets/cami2_${dataset}/contigs_2kbp.fna.gz \
    --rpkm /home/projects/cpr_10006/projects/vamb/data/datasets/cami2_${dataset}/abundance.npz \
    --outdir /home/projects/cpr_10006/people/svekut/cami2_${dataset}_reclustering_${annotator}_${thres}_test \
    --hmmout_path /home/projects/cpr_10006/projects/semi_vamb/data/marker_genes/markers_cami_${dataset}.hmmout \
    --algorithm kmeans \
    --minfasta 200000
