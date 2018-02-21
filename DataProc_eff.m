SimSetup.TestData1='./datasets/61508004 Test Data.txt';
SimSetup.TestData2='./datasets/61508006 Test Data.txt';
SimSetup.TestData3='./datasets/61508007 Test Data.txt';
SimSetup.TestData4='./datasets/61508008 Test Data.txt';
SimSetup.TestData5='./datasets/61508009 Test Data.txt';
SimSetup.TestData6='./datasets/61508010 Test Data.txt';
SimSetup.TestData7='./datasets/61508011 Test Data.txt';
SimSetup.TestData8='./datasets/61508013 Test Data.txt';
SimSetup.TestData9='./datasets/61508014 Test Data.txt';
SimSetup.TestData10='./datasets/61508015 Test Data.txt';
SimSetup.TestData11='./datasets/61508016 Test Data.txt';
SimSetup.TestData12='./datasets/61508017 Test Data.txt';
SimSetup.TestData13='./datasets/61508018 Test Data.txt';
SimSetup.TestData14='./datasets/61508019 Test Data.txt';
SimSetup.TestData15='./datasets/61508020 Test Data.txt';
SimSetup.TestData16='./datasets/61508021 Test Data.txt';
SimSetup.TestData17='./datasets/61508022 Test Data.txt';
SimSetup.TestData18='./datasets/61508024 Test Data.txt';
SimSetup.TestData19='./datasets/61508025 Test Data.txt';
SimSetup.TestData20='./datasets/61508026 Test Data.txt';
SimSetup.TestData21='./datasets/61508027 Test Data.txt';

fields = fieldnames(SimSetup);
BatPower=[0];
TracPower=[0];
Tq=[0];
Spd=[0];
Count=numel(fields);
  
for i=4:1:12
    InputData = readtable(SimSetup.(fields{i}));
    Scan=[InputData.HV_Battery_Voltage_V_ InputData.HV_Battery_Current_A_ InputData.Dyno_Tractive_Effort_N_ InputData.Dyno_Speed_mph_];
    
    for x=size(Scan,1):-1:1
        vol=Scan(x,1);
        cur=Scan(x,2);
        force=Scan(x,3);
        Spdmph=Scan(x,4);
            a=vol*cur;
            BatPower=[BatPower; a];
            spdshaft=(((Spdmph/2.236936292054402)/(72.3*2.54/100))*3.87*(2*3.141592));
            mottq=(force*((23.03*2.54/100)/2)/3.87);
            b=spdshaft* mottq;
            TracPower=[TracPower; b];
            Tq=[Tq; mottq];
            Spd=[Spd; spdshaft];
    end

end


LumpedEff=TracPower./BatPower;

for y=size(LumpedEff,1):-1:1
    if (LumpedEff(y,1) > 1)|(LumpedEff(y,1) <= -1)
        LumpedEff(y, :)=[];
        Tq(y,:)=[];
        Spd(y,:)=[];
    end
end

    
%plot(BatPower)
%hold
%plot(TracPower)


%{
BatPower(1,:)=[];

f1=fit(BatPower(:,1),BatPower(:,2),'fourier4')


x=BatPower(:,1);
y=BatPower(:,2);

f=fit(BatPower(:,1),BatPower(:,2),'exp2')


scatter(Data(:,1),Data(:,2))
hold
plot(f1)
plot(f2)
%}