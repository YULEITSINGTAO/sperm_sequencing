echo "Install bwa"
git clone https://github.com/lh3/bwa.git \
	&& \
	cd bwa; make
cd ..

echo "Install fastqc"
wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip \
	&&\
	unzip fastqc_v0.11.9.zip

echo "Install gatk"
wget https://github.com/broadinstitute/gatk/releases/download/4.2.0.0/gatk-4.2.0.0.zip \
	&&\
	unzip gatk-4.2.0.0.zip
echo "Building the gatk"
cd gatk-4.2.0.0
./gradlew bundle
cd ..

echo "Install picard"
wget https://github.com/broadinstitute/picard/releases/download/2.25.6/picard.jar

echo "samtools"
wget https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2
tar -xf samtools-1.12.tar.bz2
