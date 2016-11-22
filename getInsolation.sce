function [insolationTotal] = getInsolation(solarAltitudeAngle,solarAzimuthAngle, panelTiltAngle, panelAzimuthAngle, groundReflectance, month, daysPassed)
    
    exec('getDepthDiffuse.sce');
    i = acosd(cosd(solarAltitudeAngle)*cosd(solarAzimuthAngle-panelAzimuthAngle)*sind(panelTiltAngle)+sind(solarAltitudeAngle)*cosd(panelTiltAngle))

    [opticalDepth, diffuseFactor] = getDepthDiffuse(month);
    
    insolationExtra =1353*(1+.034*cosd(360*daysPassed/365.25)) 
    instantRadiation = insolationExtra*exp(-opticalDepth/sind(solarAltitudeAngle))// Cn omitted (assume Cn = 1)
    beamRadiation = instantRadiation*cosd(i);
    diffuseRadiation = diffuseFactor*instantRadiation*cosd(panelTiltAngle/2)^2;
    groundRadiation = groundReflectance*instantRadiation*(sind(solarAltitudeAngle)+diffuseFactor)*sind(panelTiltAngle/2)^2;
    insolationTotal = beamRadiation + diffuseRadiation +groundRadiation;
    
endfunction

