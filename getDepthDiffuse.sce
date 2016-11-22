function [opticalDepth, diffuseFactor] = getDepthDiffuse(month)
    depthMatrix = [.142;.144;.156;.18;.196;.205;.207;.201;.177;.16;.149;.142]
    diffuseMatrix = [.058;.06;.071;.097;.121;.134;.136;.122;.092;.073;.063;.057]
    opticalDepth = depthMatrix(month);
    diffuseFactor = diffuseMatrix(month);
endfunction
