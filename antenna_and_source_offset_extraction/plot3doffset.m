function plot3doffset(StationID)

files = dir('x_input\*.mat');
i=1;
for file = files'
    filename = file.name;
    path = strcat('x_input/', filename);
    load(path)
    x_offset = transpose(extractfield(x_.coorx, 'val'));
	y_offset = transpose(extractfield(x_.coory, 'val'));
	z_offset = transpose(extractfield(x_.coorz, 'val'));
    antenna = transpose(extractfield(x_.antenna, 'name'));
	
	threeD_offset = sqrt(x_offset.^2 +y_offset.^2 +z_offset.^2);

    savename = convertCharsToStrings(filename);
    savename2 = regexprep(savename, '\.[^\.]*$', '');
    savename3 = savename2 + '_3dOffset';
    
    save(strcat('antenna_output/',savename3), 'threeD_offset', 'antenna')
    
    row_search = find( strcmp( antenna, StationID ));
    TF = isempty(row_search);
    if TF == 1
        %do nothing
    else
        off_2_plot = threeD_offset(row_search);
        plot(i, off_2_plot, 'x')
        hold on;
    end
    i=i+1;
    title('3D Offset (cm) vs Session No.')
    xlabel('Session No.')
    ylabel('3D Offset (cm)')
end
end