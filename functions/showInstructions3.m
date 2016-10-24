function showInstructions3(instrPause)

global MainWindow
global bColour white

instrWindow = Screen('OpenOffscreenWindow', MainWindow, bColour);
Screen('TextFont', instrWindow, 'Segoe UI');
Screen('TextStyle', instrWindow, 0);

yellow = [255, 255, 0];

instrString1a = 'You''re doing a great job!';
instrString1b = '\n\n\nFROM NOW ON, YOU WILL NOT BE ABLE TO WIN OR LOSE ANY POINTS IN THIS TASK, REGARDLESS OF THE PICTURES PRESENTED IN THE STREAM.';
instrString1c = '\n\n\nNevertheless, you should carry on responding to the rotated target as accurately as you can on each trial.';

Screen('TextSize', instrWindow, 40);
[~, ny, ~] = DrawFormattedText(instrWindow, instrString1a, 150, 150, white, 90);
Screen('TextSize', instrWindow, 48);
Screen('TextStyle', instrWindow, 1);
[~, ny, ~] = DrawFormattedText(instrWindow, instrString1b, 180, ny, yellow, 60, [], [], 1.3);
Screen('TextSize', instrWindow, 40);
Screen('TextStyle', instrWindow, 0);
DrawFormattedText(instrWindow, instrString1c, 150, ny, white, 90, [], [], 1.2);
Screen('DrawTexture', MainWindow, instrWindow);

Screen('Flip', MainWindow);

WaitSecs(instrPause);

Screen('TextStyle', instrWindow, 1);
DrawFormattedText(instrWindow, 'Press space when you are ready to continue with the task', 'center', 900, [0, 255, 255]);

Screen('DrawTexture', MainWindow, instrWindow);
Screen('Flip', MainWindow);

RestrictKeysForKbCheck(KbName('Space'));   % Only accept spacebar
KbWait([], 2);

Screen('Flip', MainWindow);

Screen('Close', instrWindow);


end