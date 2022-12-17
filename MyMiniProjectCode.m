%{
Authors: Ayimbombi Danie Ashley
Assignment:  My MiniProject main code
History: 08 November 2022
Purpose:Write a program that directs the servo motor to move  some sort of
display pointer to show that a material has been placed on the sensor
%}
%Clear workspace
clear
%connect to arduino
a = arduino();
%Connect the servo and initialise the values needed
s1 = servo(a, 'D9', 'MinPulseDuration', 700*10^-6, 'MaxPulseDuration', 2300*10^-6);
%start with position zero
writePosition(s1,0);
% Turn off all three LEDs.  TODO: change this to match your pins
writeDigitalPin(a, 'D5', 0);
writeDigitalPin(a, 'D6', 0);
writeDigitalPin(a, 'D7', 0);
% initialize values
material = [ "papercard", "ipadcover" , "wood" ];

Value=1;

%start a while loop

while Value == 1
    %prompt thye user to insert material
    disp("Insert a material and press enter");
    pause();
        % Take the reading with each colorwriteDigitalPin(a, 'D5', 1); % on
        writeDigitalPin(a, 'D5', 1)
        pause(0.1);
        redReadings = readVoltage(a, 'A0');
        pause(0.1);
        writeDigitalPin(a, 'D5', 0); % off
        pause(0.1);
        %readings for green
        writeDigitalPin(a, 'D6', 1); % on
        pause(0.1);
        GreenRead= readVoltage(a, 'A0');
        pause(0.1);
        writeDigitalPin(a, 'D6', 0); % off
        pause(0.1);
        %readings for blue
        writeDigitalPin(a,'D7',1);
        pause(0.1);
        BLUEread = readVoltage(a,'A0'); %read from arduino
        %pause (1); %slows down read speed
        writeDigitalPin(a,'D7',0)
        pause(0.1);
        if redReadings < 1.91349
            
            material = "ipadcover";
             %move the pointer to ipad cover
             writePosition(s1,0.33);
             pause(3)
             %after 3 seconds, move the pointer back to 0 position
             writePosition(s1,0);
        elseif redReadings < 2.58798
                material = "wood";
                %move the pointer to wood
                writePosition(s1,0.66);
                %after 3 seconds, move the pointer back to 0 position
                pause(3)
                writePosition(s1,0);
        else
                material = "papercard";
                %move the pointer to papercard
                writePosition(s1,1);
                %after 3 seconds, move the pointer back to 0 position
                pause(3)
                writePosition(s1,0);
        end
       
        disp(redReadings);

        pause(1)
        Value = input('Press 1 to continue or 0 to end: ');
       

end



