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

if (SimSetup.TestDataFile == SimSetup.TestData4 | SimSetup.TestDataFile == SimSetup.TestData5 | SimSetup.TestDataFile == SimSetup.TestData6 | SimSetup.TestDataFile ==SimSetup.TestData7)
	InputData.SampleRate = 0.02;
else
	InputData.SampleRate = 0.1;
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

InputData.TestData1 = readtable(SimSetup.TestData1);
InputData.TestData2 = readtable(SimSetup.TestData2);
InputData.TestData3 = readtable(SimSetup.TestData3);
InputData.TestData4 = readtable(SimSetup.TestData4);
InputData.TestData5 = readtable(SimSetup.TestData5);
InputData.TestData6 = readtable(SimSetup.TestData6);
InputData.TestData7 = readtable(SimSetup.TestData7);
InputData.TestData8 = readtable(SimSetup.TestData8);
InputData.TestData9 = readtable(SimSetup.TestData9);
InputData.TestData10 = readtable(SimSetup.TestData10);
InputData.TestData11 = readtable(SimSetup.TestData11);

ParamEx.Com1=[InputData.TestData1.HV_Battery_SOC___ InputData.TestData1.HV_Battery_Voltage_V_];
for x =size(ParamEx.Com1,1):-1:1
    y=2;
    check=ParamEx.Com1(x,y);
    if check<=250
        ParamEx.Com1(x, :)=[];
    end
end

ParamEx.Com2=[InputData.TestData2.HV_Battery_SOC___ InputData.TestData2.HV_Battery_Voltage_V_];
for x =size(ParamEx.Com2,1):-1:1
    y=2;
    check=ParamEx.Com2(x,y);
    if check<=250
        ParamEx.Com2(x, :)=[];
    end
end

ParamEx.Com3=[InputData.TestData3.HV_Battery_SOC___ InputData.TestData3.HV_Battery_Voltage_V_];
for x =size(ParamEx.Com3,1):-1:1
    y=2;
    check=ParamEx.Com3(x,y);
    if check<=250
        ParamEx.Com3(x, :)=[];
    end
end

ParamEx.Com4=[InputData.TestData4.HV_Battery_SOC___ InputData.TestData4.HV_Battery_Voltage_V_];
for x =size(ParamEx.Com4,1):-1:1
    y=2;
    check=ParamEx.Com4(x,y);
    if check<=250
        ParamEx.Com4(x, :)=[];
    end
end

ParamEx.Com5=[InputData.TestData5.HV_Battery_SOC___ InputData.TestData5.HV_Battery_Voltage_V_];
for x =size(ParamEx.Com5,1):-1:1
    y=2;
    check=ParamEx.Com5(x,y);
    if check<=250
        ParamEx.Com5(x, :)=[];
    end
end

ParamEx.Com6=[InputData.TestData6.HV_Battery_SOC___ InputData.TestData6.HV_Battery_Voltage_V_];
for x =size(ParamEx.Com6,1):-1:1
    y=2;
    check=ParamEx.Com6(x,y);
    if check<=250
        ParamEx.Com6(x, :)=[];
    end
end

ParamEx.Com7=[InputData.TestData7.HV_Battery_SOC___ InputData.TestData7.HV_Battery_Voltage_V_];
for x =size(ParamEx.Com7,1):-1:1
    y=2;
    check=ParamEx.Com7(x,y);
    if check<=250
        ParamEx.Com7(x, :)=[];
    end
end

ParamEx.Com8=[InputData.TestData8.HV_Battery_SOC___ InputData.TestData8.HV_Battery_Voltage_V_];
for x =size(ParamEx.Com8,1):-1:1
    y=2;
    check=ParamEx.Com8(x,y);
    if check<=250
        ParamEx.Com8(x, :)=[];
    end
end

ParamEx.Com9=[InputData.TestData9.HV_Battery_SOC___ InputData.TestData9.HV_Battery_Voltage_V_];
for x =size(ParamEx.Com9,1):-1:1
    y=2;
    check=ParamEx.Com9(x,y);
    if check<=250
        ParamEx.Com9(x, :)=[];
    end
end

ParamEx.Com10=[InputData.TestData10.HV_Battery_SOC___ InputData.TestData10.HV_Battery_Voltage_V_];
for x =size(ParamEx.Com10,1):-1:1
    y=2;
    check=ParamEx.Com10(x,y);
    if check<=250
        ParamEx.Com10(x, :)=[];
    end
end

ParamEx.Com11=[InputData.TestData11.HV_Battery_SOC___ InputData.TestData11.HV_Battery_Voltage_V_];
for x =size(ParamEx.Com11,1):-1:1
    y=2;
    check=ParamEx.Com11(x,y);
    if check<=250
        ParamEx.Com11(x, :)=[];
    end
end

Comparison=[ParamEx.Com1; ParamEx.Com2; ParamEx.Com3; ParamEx.Com4; ParamEx.Com5; ParamEx.Com6; ParamEx.Com7; ParamEx.Com8; ParamEx.Com9; ParamEx.Com10;ParamEx. Com11];

x=Comparison(:,1);
y=Comparison(:,2);
f=fit(x,y,'fourier2');

f=fit(x,y,'exp2');
%plot(f,x,y);

sim('untitled.slx');
s
scur=Outputcur.Data();
svol=Outputvolt.Data();
ssoc=Outputsoc.Data();

if (SimSetup.TestDataFile == SimSetup.TestData4 | SimSetup.TestDataFile == SimSetup.TestData5 | SimSetup.TestDataFile == SimSetup.TestData6 | SimSetup.TestDataFile ==SimSetup.TestData7)
    dcur=InputData.TestData.HV_Battery_Current_A_;
    for i=1:1:500
        dcur(1,:)=[];
    end
    dvol=InputData.TestData.HV_Battery_Voltage_V_;
    for i=1:1:500
        dvol(1,:)=[];
    end
    dsoc=InputData.TestData.HV_Battery_SOC___;
    for i=1:1:500
        dsoc(1,:)=[];
    end
else
       dcur=InputData.TestData.HV_Battery_Current_A_;
    for i=1:1:101
        dcur(1,:)=[];
    end
    dvol=InputData.TestData.HV_Battery_Voltage_V_;
    for i=1:1:101
        dvol(1,:)=[];
    end
    dsoc=InputData.TestData.HV_Battery_SOC___;
    for i=1:1:101
        dsoc(1,:)=[];
    end
end
    

delcur=dcur-scur;
delvol=dvol-svol;
delsoc=dsoc-ssoc;
errcur=sqrt(sum(delcur.^2)/Outputcur.length())
errvol=sqrt(sum(delvol.^2)/Outputcur.length())
errsoc=sqrt(sum(delsoc.^2)/Outputcur.length())

