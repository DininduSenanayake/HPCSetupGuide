# Load single cell modules
# - It is assumed that the core.sh set has already been load so the
#   MODULEPATH environment variable should be set appropriately

# From KGen these are the packages that we would want:
# bio/bamtofastq/1.2.0          
# bio/bamtools/2.4.2            
# bio/bayesembler/1.2.0         
# bio/bbmap/38.0.0              
# bio/bcftools/1.3.1            
# bio/bedtools2/2.25.0          
# bio/blat/2018.01.09           
# bio/bowtie2/2.3.0             
# bio/bustools/0.39.3           
# bio/bwa/0.7.15                
# bio/cpat/1.2.2                
# bio/cramtools/3.0             
# bio/cufflinks/2.2.1           
# bio/exonerate/2.2.0           
# bio/fastq_screen/0.5.2        
# bio/fastqc/0.11.4             
# bio/fastx_toolkit/0.0.14      
# bio/gffcompare/0.10.6         
# bio/gffread/0.9.12            
# bio/gmap/2018.02.12           
# bio/hisat2/2.1.0              
# bio/htslib/1.3.1              
# bio/igv/2.3.68                
# bio/kallisto/0.46.1           
# bio/kent/328                  
# bio/meme/4.11.2
# bio/minimap/2.15
# bio/ngs/2.10.5
# bio/ngsutils/0.5.7       
# bio/rmats/4.0.1
# bio/salmon/0.11.3
# bio/samtools/1.9
# bio/sratoolkit/2.8.2     
# bio/star/2.5.1b
# bio/stringtie/1.3.5      
# bio/subread/1.6.3
# bio/trimgalore/0.4.5     
# bio/trimmomatic/0.35     

module load BEDTools/2.29.2-GCC-9.3.0
module load FastQC
module load HISAT2/2.2.1-foss-2020a
module load Kent_tools/422-foss-2020a
module load SAMtools/1.10-GCC-9.3.0
module load Salmon/1.9.0-gompi-2020a
module load Subread/2.0.1-GCC-9.3.0
module load cutadapt/2.10-GCCcore-9.3.0-Python-3.8.2
module load kallisto/0.46.2-foss-2020a
module load picard/2.25.1-Java-11 &> /dev/null

