
%Input your stations of interest below
Stations_of_interest =["HOBART12", "NYALES20", "KATH12M ", "HART15M ", "YARRA12M", "WETTZELL", "FORTLEZA", "WARK12M ", "ONSALA60"];

%Creating some output directories, if they already exist a warning will be
%returned but the script will continue.
status = mkdir('figures');
status = mkdir('antenna_output');

%Running the 3doffset function over these stations and saving their figures:
for name = Stations_of_interest
    plot3doffset(name)
    savename = strcat(name,'.fig');
    savefig(strcat('figures/',savename))
    close all
end

clear name savename Stations_of_interest status