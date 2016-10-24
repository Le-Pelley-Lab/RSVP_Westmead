function showInstructions2

global MainWindow
global bColour white screenWidth
global cueBalance

instrWindow = Screen('OpenOffscreenWindow', MainWindow, bColour);
Screen('TextFont', instrWindow, 'Segoe UI');
Screen('TextStyle', instrWindow, 0);

yellow = [255, 255, 0];

if cueBalance == 1
    rewardString = 'BIRD';
    nonRewardString = 'CAR';
    rewardStringLC = 'bird/car';
else
    rewardString = 'CAR';
    nonRewardString = 'BIRD';
    rewardStringLC = 'car/bird';
end


imgMatrix=imread(['images\', rewardString, '_distract_example.jpg'], 'jpg');

imageTop = 800;
imageHeight = size(imgMatrix,1);
imageWidth = size(imgMatrix,2);
exampleImageTexture = Screen('MakeTexture', MainWindow, imgMatrix);


instrString = 'Great job!\n\nFrom now on you can win points for correct responses.\n\nThis is important because you will receive money at the end of the experiment, based on how many points you have earned. Most participants are able to earn between $7 and $12.';
instrString2 = ['If the stream of images includes a picture of a ', rewardString,', you will be able to WIN 50 POINTS on that trial if you respond correctly to the target. However, if you make an incorrect response, you will LOSE 50 POINTS.\n\nOn other trials, when the stream contains a picture of a ', nonRewardString,', you will not receive any points for making a correct response, or lose any points for making an incorrect response.'];
instrString3 = ['Note that the ', rewardStringLC,' will NEVER be the target stimulus.\n\nIn fact, you will do better at this task (you will earn more points) if you IGNORE the ', rewardStringLC,' altogether. Sometimes the target be presented shortly after the ', rewardStringLC,': you will find that if you are paying attention to the ', rewardStringLC,', you will often miss the target that follows it.\n\nThe best strategy in this task is to ignore the ', rewardStringLC,' completely and just try to identify the target as accurately as possible on each trial. On average you will win around $5 more if you use this strategy.\n\nThe ', rewardStringLC,' is just there to distract you and make the task harder!'];
instrString4 = 'Remember, at the end of the experiment, the number of points that you have earned will be used to calculate how much you get paid. So you should try to respond as accurately as you can, in order to earn as many points as possible.\n\nPlease let the experimenter know when you are ready to begin the task.';

Screen('TextSize', instrWindow, 40);

DrawFormattedText(instrWindow, instrString, 150, 150, white, 90, [], [], 1.3);
Screen('DrawTexture', MainWindow, instrWindow);

Screen('Flip', MainWindow);
RestrictKeysForKbCheck(KbName('Space'));   % Only accept spacebar
KbWait([], 2);

Screen('FillRect', instrWindow, bColour);
DrawFormattedText(instrWindow, instrString2, 150, 150, white, 90, [], [], 1.3);
Screen('DrawTexture', MainWindow, instrWindow);
Screen('Flip', MainWindow);
RestrictKeysForKbCheck(KbName('Space'));   % Only accept spacebar
KbWait([], 2);

Screen('FillRect', instrWindow, bColour);
Screen('DrawTexture', instrWindow, exampleImageTexture, [], [screenWidth/2 - imageWidth/2, imageTop, screenWidth/2 + imageWidth/2, imageTop + imageHeight]);
DrawFormattedText(instrWindow, instrString3, 140, 120, white, 93, [], [], 1.3);
Screen('DrawTexture', MainWindow, instrWindow);
Screen('Flip', MainWindow);
RestrictKeysForKbCheck(KbName('Space'));   % Only accept spacebar
KbWait([], 2);

Screen('FillRect', instrWindow, bColour);
DrawFormattedText(instrWindow, instrString4, 150, 150, yellow, 90, [], [], 1.3);
Screen('DrawTexture', MainWindow, instrWindow);
Screen('Flip', MainWindow);
RestrictKeysForKbCheck(KbName('Space'));   % Only accept spacebar
KbWait([], 2);

Screen('Flip', MainWindow);

Screen('Close', instrWindow);


end