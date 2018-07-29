
%Input your sources of interest below
Sources_of_interest =["1418+546", "0202+319"];

%Creating some output folders, if they already exist a warning will be
%returned but the script will continue.
status = mkdir('figures');
status = mkdir('source_output');

%Running the sourceoffset function over these stations and saving their figures:
%First for Declination:
for name = Sources_of_interest
    sourceoffset(name,"D");
    savename = strcat(name,'_Dec.fig');
    savefig(strcat('figures/',savename))
    close all
end
%Now for Right Ascension:
for name = Sources_of_interest
    sourceoffset(name,"R");
    savename = strcat(name,'_Ra.fig');
    savefig(strcat('figures/',savename))
    close all
end

clear name savename Sources_of_interest status