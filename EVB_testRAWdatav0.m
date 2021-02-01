%mducng/SoC/D2/G2touch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load ./DataConverted/C0_1.txt;
load ./DataConverted/C1_1.txt;
load ./DataConverted/C2_1.txt;
load ./DataConverted/C3_1.txt;
load ./DataConverted/C4_1.txt;
load ./DataConverted/C5_1.txt;
load ./DataConverted/C6_1.txt;
load ./DataConverted/C7_1.txt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Subtract mean
C0_1Test    = C0_1 - mean(C0_1);
C1_1Test    = C1_1 - mean(C1_1);
C2_1Test    = C2_1 - mean(C2_1);
C3_1Test    = C3_1 - mean(C3_1);
C4_1Test    = C4_1 - mean(C4_1);
C5_1Test    = C5_1 - mean(C5_1);
C6_1Test    = C6_1 - mean(C6_1);
C7_1Test    = C7_1 - mean(C7_1);
%Normalize MATLAB function
C0_1Nor     = normalize(C0_1);
C1_1Nor     = normalize(C1_1);
C2_1Nor     = normalize(C2_1);
C3_1Nor     = normalize(C3_1);
C4_1Nor     = normalize(C4_1);
C5_1Nor     = normalize(C5_1);
C6_1Nor     = normalize(C6_1);
C7_1Nor     = normalize(C7_1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);
subplot(3,1,1);
plot(C0_1);
title("Raw signal!");
axis([0 1400 -1 1]);
subplot(3,1,2);
plot(C0_1Test);
title("Proposed 'X - mean(X)' signal!");
axis([0 1400 -1 1]);
subplot(3,1,3);
plot(C0_1Nor);
title("MATLAB normalize function. function.");
axis([0 1400 -2 2]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2);
subplot(3,1,1);
plot(C1_1);
title("Raw signal!");
axis([0 1400 -1 1]);
subplot(3,1,2);
plot(C1_1Test);
title("Proposed 'X - mean(X)' signal!");
axis([0 1400 -1 1]);
subplot(3,1,3);
plot(C1_1Nor);
title("MATLAB normalize function.");
axis([0 1400 -2 2]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3);
subplot(3,1,1);
plot(C2_1);
title("Raw signal!");
axis([0 1400 -1 1]);
subplot(3,1,2);
plot(C2_1Test);
title("Proposed 'X - mean(X)' signal!");
axis([0 1400 -1 1]);
subplot(3,1,3);
plot(C2_1Nor);
title("MATLAB normalize function.");
axis([0 1400 -2 2]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4);
subplot(3,1,1);
plot(C3_1);
title("Raw signal!");
axis([0 1400 -1 1]);
subplot(3,1,2);
plot(C3_1Test);
title("Proposed 'X - mean(X)' signal!");
axis([0 1400 -1 1]);
subplot(3,1,3);
plot(C3_1Nor);
title("MATLAB normalize function.");
axis([0 1400 -2 2]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(5);
subplot(3,1,1);
plot(C4_1);
title("Raw signal!");
axis([0 1400 -1 1]);
subplot(3,1,2);
plot(C4_1Test);
title("Proposed 'X - mean(X)' signal!");
axis([0 1400 -1 1]);
subplot(3,1,3);
plot(C4_1Nor);
title("MATLAB normalize function.");
axis([0 1400 -2 2]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(6);
subplot(3,1,1);
plot(C5_1);
title("Raw signal!");
axis([0 1400 -1 1]);
subplot(3,1,2);
plot(C5_1Test);
title("Proposed 'X - mean(X)' signal!");
axis([0 1400 -1 1]);
subplot(3,1,3);
plot(C5_1Nor);
title("MATLAB normalize function.");
axis([0 1400 -2 2]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(7);
subplot(3,1,1);
plot(C6_1);
title("Raw signal!");
axis([0 1400 -1 1]);
subplot(3,1,2);
plot(C6_1Test);
title("Proposed 'X - mean(X)' signal!");
axis([0 1400 -1 1]);
subplot(3,1,3);
plot(C6_1Nor);
title("MATLAB normalize function.");
axis([0 1400 -2 2]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(8);
subplot(3,1,1);
plot(C7_1);
title("Raw signal!");
axis([0 1400 -1 1]);
subplot(3,1,2);
plot(C7_1Test);
title("Proposed 'X - mean(X)' signal!");
axis([0 1400 -1 1]);
subplot(3,1,3);
plot(C7_1Nor);
title("MATLAB normalize function.");
axis([0 1400 -2 2]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%