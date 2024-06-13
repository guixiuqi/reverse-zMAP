#export scriptdir

scriptPATH=/mnt/storage/user/guixiuqi/rsgeno/protein/reversezMAP_github/python_script
export scriptPATH
gmtPATH=/mnt/storage/user/guixiuqi/rsgeno/protein/reversezMAP_github/data/gmt
inputdataPATH=/mnt/storage/user/guixiuqi/rsgeno/protein/reversezMAP_github/data/test_data

#reverse-zMAP
python $scriptPATH/reverse_zmap.py --intensity_data $inputdataPATH/small_data_protein_level_intensity.txt --sample_information $inputdataPATH/small_data_sample_info_add_internal_ref.txt --outdir $inputdataPATH/reverse_zMAP_results --window_size 400 --step_size 100 --percent 50 --method natural_cubic_spline

############# downstream analysis #############


#sample quality control
python $scriptPATH/SampleQC.py --z_statistic_matrix $inputdataPATH/reverse_zMAP_results/z_statistic_table.txt --sample_info $inputdataPATH/small_data_sample_info_add_internal_ref.txt --outdir $inputdataPATH/SampleQC


#subgrouping
python $scriptPATH/SampleSubgrouping.py --z_statistic_matrix $inputdataPATH/cervical_cancer_z_statistic.txt --sample_info $inputdataPATH/cervical_cancer_sample_info.txt --sample_condition Tumor_tissue --outdir $inputdataPATH/SampleSubgrouping --top_n 3000

#gsva 
python $scriptPATH/gsva.py --z_statistic_matrix $inputdataPATH/cervical_cancer_z_statistic.txt --sample_info $inputdataPATH/cervical_cancer_sample_info.txt --outdir $inputdataPATH/gsva --top_n 50 --fdr 0.05

#Survival analysis
python $scriptPATH/sample_group_survival_analysis.py --input_file $inputdataPATH/survival_analysis_data.txt --outdir $inputdataPATH/SurvivalAnalysis



#Association with clinical features
python $scriptPATH/AssClinicalMolecular.py --z_statistic_matrix $inputdataPATH/cervical_cancer_z_statistic.txt --cluster_f $inputdataPATH/SampleSubgrouping/cluster_3.csv --clinical_info $inputdataPATH/cervical_cancer_clinical_info.txt --discrete 'Histology,Degree,Stage,Lymph_node,Abnormal_SCC' --continuous 'Tumor_size_cm,Age' --color_f $inputdataPATH/discrete_feature_color_RGB.txt --colorbar_f $inputdataPATH/continuous_feature_colorbar.txt --outdir $inputdataPATH/AssClinicalMolecular --fdr 0.05 --cluster_n 4 


#Association with survival data
python $scriptPATH/AssSurvival.py --survival_f $inputdataPATH/survival_analysis_data.txt --z_statistic_matrix $inputdataPATH/HCC_z_statistic_df.txt --outdir $inputdataPATH/AssSurvival

#Association with mutation data
python $scriptPATH/AssMutation.py --mutation_f $inputdataPATH/snp_df_10.txt --z_statistic_matrix $inputdataPATH/HCC_z_statistic_df.txt --covariates_f $inputdataPATH/covariates_df.txt --gene_tss_location $inputdataPATH/gene_tss_location.txt --chr_length $inputdataPATH/hg19_chrom_sizes_remove_xy.txt --outdir $inputdataPATH/AssMutation --fdr 0.05

































