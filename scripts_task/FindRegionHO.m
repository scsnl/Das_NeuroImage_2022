    function out = FindRegionHO(coords, roiFile, Intensity)
    
    %round coords
    coords_mni_space = round(coords);
    
    %load roi
    roiVol = spm_vol(roiFile);
    roiImg = double(spm_read_vols(roiVol));
    roiIdx = find(roiImg==Intensity);
    
    roiIdx_vox_space = zeros(length(roiIdx),3);
    for i = 1:length(roiIdx)
        [i1, i2, i3] = ind2sub(roiVol.dim, roiIdx(i));
        roiIdx_vox_space(i,1) = i1;
        roiIdx_vox_space(i,2) = i2;
        roiIdx_vox_space(i,3) = i3;
    end
    
    %convert coordinates from mni to voxel space
    coords_voxel_space = [coords_mni_space(:,1) coords_mni_space(:,2) coords_mni_space(:,3) ones(size(coords_mni_space,1),1)]*(inv(roiVol.mat))';
    coords_voxel_space(:,4) = [];
    coords_voxel_space = round(coords_voxel_space);
    
    %find coords in roi
    is_coords_in_roi = zeros(length(coords_voxel_space), 1);
    
    for i = 1:size(coords_voxel_space,1)
        icoords = coords_voxel_space(i,:);
        for j = 1:size(roiIdx_vox_space,1)
            jcoords = roiIdx_vox_space(j,:);
            if isequal(icoords, jcoords)
                is_coords_in_roi(i) = 1;
            end
        end
    end
    
    out = is_coords_in_roi;