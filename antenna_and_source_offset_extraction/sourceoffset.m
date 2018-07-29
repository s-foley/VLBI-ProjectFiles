function sourceoffset(SourceID,RorD)

files = dir('out_input\*.mat');
i=1;
for file = files'
    
    if RorD =='R'
        k = 0;
    elseif RorD =='D'
        k = 1;
    else
        %do 
    end
    filename = file.name;
    filename2 = erase(filename,'opt');
    filename3 = strcat('x',filename2);
    
    path = strcat('out_input/', filename);
    load(path)
    path2 = strcat('x_input/', filename3);
    load(path2)
    
    
    De = transpose(extractfield(x_.soura, 'val'));
    Ra = transpose(extractfield(x_.soude, 'val'));
    
    sources = transpose(extractfield(opt_.source, 'name'));

    savename = convertCharsToStrings(filename);
    savename2 = regexprep(savename, '\.[^\.]*$', '');
    savename3 = savename2 + '_DecAndRa';
    
    save(strcat('source_output/',savename3), 'Ra', 'De', 'sources')
    
    row_search = find( strcmp( sources, SourceID ));
    TF = isempty(row_search);
    if TF == 1;
        %do nothing
    else
        if k==1;
            
            off_2_plot = De(row_search);
            disp(off_2_plot)
            plot(i, off_2_plot, 'x')
            hold on;
        elseif k==0
            off_2_plot = Ra(row_search);
            disp(off_2_plot)
            plot(i, off_2_plot, 'x')
            hold on; 
        end
    end
    i=i+1;
    if k==1
        title('Ra or De (deg) vs Session No.')
        xlabel('Session No. (arb. right now)')
        ylabel('Ra/De (deg)')
    elseif k==0
        title('Ra Offset vs Session No.')
        xlabel('Session No. (arb.rightnow)')
        ylabel('Ra Offset')
    end
end


end