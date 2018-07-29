# VLBI-ProjectFiles
Repository of project files and scripts for my VLBI honours project. Below I will explain the purpose of each set of scripts and how to use them

# antenna_and_source_offset_extraction
The scripts in this folder extract the 3d offset of a set of stations, and the Right Ascension and Declination offsets of a set of sources, over a collection of session input files. To use these scripts, you will need the x_ and out_ .mat files outputed by VieVS for your desired collection of sessions. Put these in the x_input and out_input folders respectively.
Then, open the 'Batch' .m scripts and define the sets of sources and antenna you wish to iterate over.
The script will create output folders containing .mat files with the extracted information, as well as figures of each of the sets.
