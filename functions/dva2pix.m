function [pixels] = dva2pix(dva)

global screenWidth viewDistance monitorDims

pixels = tand(dva/2) * 2 * viewDistance * screenWidth/monitorDims(1);

pixels = round(pixels);

end