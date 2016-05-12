%%%%%%%%%%
%   332:346 Digital Signal Processing Spring 2016
%   Prof. Waheed Bajwa
%   Term Project - Image Processing
%   DA/AV/WS
%%%%%%%%%%

img = imread('guineapig.jpg');

% 2-D Low-pass filter

figure;
title('blur'); 
subplot(2, 3, 1);
image(img); axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('Original');

% 5px 2-D blur
f = 1/25 .* ones(5, 5);
img_lp5 = imfilter(img, f, 'replicate');
subplot(2, 3, 2);
image(img_lp5); axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('5x5px Blur');

% 20px 2-D blur
f = 1/400 .* ones(20, 20);
img_lp20 = imfilter(img, f, 'replicate');
subplot(2, 3, 3);
image(img_lp20); axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('20x20px Blur');

% 100px 2-D blur
f = 1/10000 .* ones(100, 100);
img_lp100 = imfilter(img, f, 'replicate');
subplot(2, 3, 4);
image(img_lp100); axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('100x100px Blur');

% 5x20px 2-D blur
f = 1/100 .* ones(5, 20);
img_lp5x20 = imfilter(img, f, 'replicate');
subplot(2, 3, 5);
image(img_lp5x20); axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('5x20px Blur');

% 1x50px 2-D blur
f = 1/50 .* ones(1, 50);
img_lp1x50 = imfilter(img, f, 'replicate');
subplot(2, 3, 6);
image(img_lp1x50); axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('1x50px Blur');

%% Gaussian Blur
f = @(m, n, sig) 1000/(2*pi*sig^2) * exp(-1*(m.^2+n.^2)/(2*sig^2)); 


%% kernels

emboss = [-2 1 0; -1 1 1; 0 1 2];
edgedetect = [0 1 0;1 -4 1;0 1 0];
edgeenhance = [0 0 0; -1 1 0; 0 0 0];
sharpen = [0 0 0 0 0; 0 0 -1 0 0; 0 -1 5 -1 0; 0 0 -1 0 0; 0 0 0 0 0];

Hem = imfilter(img,emboss,'replicate');
Hed = imfilter(img,edgedetect,'replicate');
Hedg = imfilter(img,edgeenhance,'replicate');
Hsharp = imfilter(img, sharpen, 'replicate');

figure
subplot(2,2,1)
image(uint8(Hem))
axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('Embossing');

subplot(2,2,2)
image(uint8(Hed))
axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('Edge Detection');

subplot(2,2,3)
image(uint8(Hedg))
axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('Edge Enhancement');

subplot(2,2,4)
image(uint8(Hsharp))
axis equal tight;
set(gca,'xtick',[]); set(gca,'xticklabel',[]);
set(gca,'ytick',[]); set(gca,'yticklabel',[]);
title('Sharpening');
