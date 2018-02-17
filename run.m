SimSetup.TestData1='./datasets/61508004 Test Data.txt'
SimSetup.TestData2='./datasets/61508006 Test Data.txt'
SimSetup.TestData3='./datasets/61508007 Test Data.txt'
SimSetup.TestData4='./datasets/61508008 Test Data.txt'
SimSetup.TestData5='./datasets/61508009 Test Data.txt'
SimSetup.TestData6='./datasets/61508010 Test Data.txt'
SimSetup.TestData7='./datasets/61508011 Test Data.txt'
SimSetup.TestData8='./datasets/61508013 Test Data.txt'
SimSetup.TestData9='./datasets/61508014 Test Data.txt'
SimSetup.TestData10='./datasets/61508015 Test Data.txt'
SimSetup.TestData11='./datasets/61508016 Test Data.txt'

prompt = 'Which Drive Cycle Would You Want To Run 4,6,7,8,9,10,11,13,14,15,16   '; 
SimSetup.Selection = input(prompt)

switch SimSetup.Selection
	case 4
		SimSetup.TestDataFile = SimSetup.TestData1
	case 6
		SimSetup.TestDataFile = SimSetup.TestData2
	case 7
		SimSetup.TestDataFile = SimSetup.TestData3
	case 8
		SimSetup.TestDataFile = SimSetup.TestData4
	case 9
		SimSetup.TestDataFile = SimSetup.TestData5
	case 10
		SimSetup.TestDataFile = SimSetup.TestData6
	case 11
		SimSetup.TestDataFile = SimSetup.TestData7
	case 13
		SimSetup.TestDataFile = SimSetup.TestData8
	case 14
		SimSetup.TestDataFile = SimSetup.TestData9
	case 15
		SimSetup.TestDataFile = SimSetup.TestData10
	case 16
		SimSetup.TestDataFile = SimSetup.TestData11
	otherwise 
		print("try again")
end

if (SimSetup.TestDataFile == SimSetup.TestData6)
	InputData.RoadGrade = 0.06;
else
	InputData.RoadGrade = 0;
end

SimSetup.StepSize = 0.1

InputData.TestData = readtable(SimSetup.TestDataFile)
SimSetup.End = InputData.TestData.Time_sec_(end)

InputData.InitialHVSOC = InputData.TestData.HV_Battery_SOC___(1)

InputData.ExpectedHVSOC = [InputData.TestData.Time_sec_,InputData.TestData.HV_Battery_SOC___]
InputData.ExpectedVel = [InputData.TestData.Time_sec_,(InputData.TestData.Dyno_Speed_mph_.*(1.60934/3.6))]
InputData.ExpectedHVVolt = [InputData.TestData.Time_sec_,InputData.TestData.HV_Battery_Voltage_V_]
InputData.ExpectedHVCurr = [InputData.TestData.Time_sec_,InputData.TestData.HV_Battery_Current_A_]
InputData.ExpectedTracForce = [InputData.TestData.Time_sec_,InputData.TestData.Dyno_Tractive_Effort_N_]

Chassis.Driver=102; %kg
Chassis.Mass=2821*0.453592; %lb*kg
Chassis.RR=0.0062;
Chassis.CD=0.326;
Chassis.FA=2.48;
Chassis.FrontDiameter=23.03*2.54/100; %in*cm/meter
Chassis.RearDiameter=23.48*2.54/100; %in*cm/meter
Chassis.FrontCirc=72.3*2.54/100 %in*cm/m
Chassis.RearCirc=73.6*2.54/100 %in*cm/m

Ptrain.MaxTq=444; %Nm
Ptrain.MaxPw=105000; %W
Ptrain.Finaldrive=3.87;

Ptrain.Motorspeed=0; %rps
Ptrain.Transspeed=0; %rps
Chassis.Vehiclespeed=0; %rpm

HVBattery.CellVoltMax=4.2;
HVBattery.Series=16;
HVBattery.Modules=6;

sim('untitled.slx')

