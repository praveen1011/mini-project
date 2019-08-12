function hlo(){
            var dt = new Date();
            var y = dt.getYear()+1900;
            var d = dt.getMonth();
            var fd = parseInt(document.getElementById('from').value);
            var td = parseInt(document.getElementById('to').value);
            if((fd == y && d+1 > 4)  || (fd > y))
                {
                    alert("not admitted batch");
                    strUser = '100';
                }
            else if(td - fd > 4 || td - fd < 4)
                {
                    alert("Please enter correct year");
                    strUser = '100';
                }
            else if(y - fd > 4)
                {
                    alert("Graduated batch");
                    strUser = '100';
                }
            else if(y - fd == 4 && d+1 >= 5 )
                {
                    alert("Graduated batch")
                    strUser = '100';
                }
            else if(d+1 >= 5)
            {
                var strUser = (y - fd)*2 + 1; 
            }
            else
            {
                var strUser = (y - fd)*2;
            }

var e1 = document.getElementById("branch");
var strUser1 = e1.options[e1.selectedIndex].value;
    if(strUser1 == "null")
        {
            $("#change").empty();
            alert("choose a branch");
        }
var e2 = document.getElementById("tos");
var strUser2 = e2.options[e2.selectedIndex].value;
var subj = strUser1 + strUser.toString();
var select = document.getElementById("change");
var CSE1 = [["English","15HE1101"],["Mathematics-I","15BM1101"],["Chemistry","15BC1101"],["Introduction to Computing","15CT1101"],["Basic Electrical Engineering","15EE1153"],["Elements of EE&ME","15EM1101"],["English Language Lab","15HE1102"],["Electrical Technology","15EE1155"],["Chemistry Lab","15BC1102"],["Engineering Workshop","15MT1101"]];
var CSE2 = [["Mathemathics-II","15BM11102"],["Physics","15BP1101"],["Computer Programming Through C","15CT1102"],["Engineering Mechanics","15CT1101"],["ELectronics Devices And Circuits","15EC1101"],["Physics Lab","15BP1102"],["Computer Programming Lab","15CT1103"],["Engineering Drawing","15ME1102"],["Basic Electric Enginerrring Lab","15EE1154"],["Electric Technology Lab","15EE1156"]];
var CSE3 = [["Discrete Mathematical Structures","15BM1106"],["Managerial Economics and Financial Analysis","15HM1101"],["Digital Logic Design","15EC1105"],["Environmental Studies","15BC1103"],["Computer Organization","15CT1104"],["Data Structures","15CT1105"],["Data Structures Lab","15CT1106"],["Analog and Digital Circuits Lab","15EC1147"]];
var CSE4 = [["Environmental Chemistry","15BC1103"],["Probability, Statistics and Numerical Methods","15BM1103"],["Random Variables and Numerical Methods","15BM1107"],["Design and Analysis of Algorithms","15CT1107"],["Database Management Systems","15CT1108"],["Object Oriented Programming Through JAVA","15CT1109"],["Operating Systems","15CT1110"],["Advanced Data Structures","15CT1111"],["Principles of Programming Languages","15CS1101"],["Computer Graphics","15CT1116"],["DBMS Lab","15CT1112"],["Object Oriented Programming Lab","15CT1113"]];
var CSE5 = [["Software Engineering","15CT1114"],["Unix & Shell Programming","15CT1115"],["Formal Languages and Automata Theory","15CT1119"],["Embedded Systems - 1","15CT1117"],["Web Programming","15CT1118"],["Artificial Intelligence","15CT1121"],["Software Testing","15CT1120"],["Human Computer Interaction","15CS1102"],["Embedded Systems Lab-1","15CT1122"],["Web Programming Lab","15CT1123"]];
var CSE6 = [["Management Science","15HM1102"],["Computer Networks","15CT1124"],["Compiler Design","15CS1103"],["Object Oriented Analysis & Design","15CT1125"],["Information Storage Systems","15CT1128"],["Image Processing","15CT1127"],["Software Project Management","15CT1126"],["Information Storage Security and Management","15CT1134"],["Middleware Technologies","15CT1129 "],["Advanced Computer Architecture","15CS1104"],["Industry Lectures","15CT11IL"],["Computer Networks Lab","15CT1131"]];
var CSE7 = [["Data Warehousing and Data mining","15CT1132"],["Network Security and Cryptography","15CS1105"],["Machine Learning","15CS1106"],["Big Data Analytics","15CT1135"],["Multimedia and Application Development","15CS1107"],["Distributed Operating Systems","15CS1110"],["Embedded Systems-II","15CT1136"],["Cloud Computing","15CT1137"],["Information Retrieval Systems","15CT1139"],["Mobile Communications","15CT1130"],["Multi Core Programming","15CT1138"],["R Programming Lab","15CS11S1"],["Hadoop Lab","15CS11S2"],["APP Development Lab","15CT11S1"],["Python Lab","15CT11S2"],["Data Warehousing and Data Mining lab","15CT1140"],["Network Security and Cryptography LAB","15CS1108"],["Industry Oriented Mini Project","15CS11MP"]];
var IT1 =  [["English","15HE1101"],["Mathematics-I","15BM1101"],["Chemistry","15BC1101"],["Introduction to Computing","15CT1101"],["Basic Electrical Engineering","15EE1153"],["Elements of EE&ME","15EM1101"],["English Language Lab","15HE1102"],["Electrical Technology","15EE1155"],["Chemistry Lab","15BC1102"],["Basic Electrical Engineering","15EE1154"]];
var IT2 =  [["Mathematics-II","15BM1102"],["Physics","15BP1101"],["Computer Programming Through C","15CT1102"],["Engineering Mechanics","15ME1101"],["Electronics Devices and Circuits","15EC1101"],["Physics Lab","15BP1102"],["Computer Programming Lab","15CT1103"],["Engineering Drawing","15ME1102"],["Engineering Workshop","15MT1101"]];
var IT3 =  [["Discrete Mathematical Structures","15BM1106"],["Managerial Economics And Financial Accounting","15HM1101"],["Digital Logic Design","15EC1105"],["Environmental Studies","15BC1104"],["Computer Organization","15CT1104"],["Data Structures","15CT1105"],["Data Structures Lab","15CT1106"],["Analog and Digital Circuits Lab","15EC1147"]];
var IT4 =  [["Environmental Chemistry","15BC1103"],["Probability, Statistics and Numerical Methods","15BM1103"],["Random Variables and Numerical Methods","15BM1107"],["Design and Analysis of Algorithms","15CT1107"],["Database Management Systems","15CT1108"],["Object Oriented Programming Through JAVA","15CT1109"],["Operating Systems","15CT1110"],["Advanced Data Structures","15CT1111"],["Application Development  Tools","15IT1101"],["Scripting Languages","15IT1102"],["DBMS Lab","15CT1112"],["Object Oriented Programming Lab","15CT1113"]];
var IT5 =  [["Software Engineering","15CT1114"],["Unix & Shell Programming","15CT1115"],["Computer Graphics","15CT1116"],["Embedded Systems - I","15CT1117"],["Web Programming","15CT1118"],["Formal Languages & Automata Theory","15CT1119"],["Software Testing","15CT1120"],["ERP & Supply Chain Management","15IT1103"],["Compiler Design","15IT11M1"],["Embedded Systems - I Lab","15CT1122"],["Web Programming Lab","15CT1123"]];
var IT6 =  [["Management Science","15HM1102"],["Computer Networks","15CT1124"],["Object Oriented Analysis & Design","15CT1125"],["Software Project Management","15CT1126"],["Image Processing","15CT1127"],["Artificial Intelligence","15CT1121"],["Middleware Technologies","15CT1129"],["Natural Language Processing","15IT11M2"],["Multimedia Systems","15IT1105"],["Information Storage Systems","15CT1128"],["Principles of Digital Signal Processing","15IT1104"],["Mobile Communications","15CT1130"],["Introduction to Machine Learning","15IT11M3"],["Industry Lectures","15IT11IL"],["Computer Networks Lab","15CT1131"]];
var IT7 =  [["Data Warehousing and Data Mining","15CT1132"],["Unix Network Programming","15CT1133"],["Information Storage Security and Management","15CT1134"],["Cloud Computing","15CT1137"],["Information Security","15IT1107"],["Big Data Analytics","15CT1135"],["Information Retrieval Systems","15CT1139"],["Embedded Systems-II","15CT1136"],["Wireless Communications","15IT1106"],["Multi Core Programming","15CT1138"],["Service Oriented Architecture","15IT1108"],["Internet of Things","15IT1109"],["UML Lab","15IT11S1"],["Software Testing Lab","15IT11S2"],["Data Warehousing and  Data Mining Lab","15CT1140"],["Network Programming Lab","15IT1110"],["Industry Oriented Mini Project","15IT11MP"]];
var ECE1 = [["Mathematics-I","15BM1101"],["Physics","15BP1101"],["Computer Programming through C","15CT1102"],["Engineering Mechanics","15ME1101"],["Network Analysis-I","15EE1101"],["Physics Lab","15BP1102"],["Computer Programming Lab","15CT1103"],["Engineering Drawing","15ME1102"],["Engineering Workshop","15MT1101"]];
var ECE2 = [["English","15HE1101"],["Mathemathics-II","15BM11102"],["Chemistry","15BC1101"],["Electronic Devices and Circuits","15EC1101"],["Elements of EE&ME","15EM1101"],["Basic Electrical Engineering","15EE1153"],["Electrical Technology","15EE1155"],["English Language Lab","15HE1102"],["Chemistry Lab","15BC1102"],["Electronic Devices  and  Circuits Lab","15EC1102"]];
var ECE3 = [["Special functions and complex variables","15BM1104"],["Network Analysis -II","15EE1104"],["Electronic Circuit analysis","15EC1103"],["Signals and Systems","15EC1104"],["Digital Logic Design","15EC1105"],["Environmental Studies","15BC1104"],["Electronic circuit analysis Lab","15EC1106"],["Basic Electrical Engineering Lab","15EE1154"],["Electrical Technology Lab","15EE1156"]];
var ECE4 = [["BASIC SCIENCE ELECTIVE",""],["EM Waves and Transmission Lines","15EC1107"],["Analog Communications","15EC1108"],["Linear and Digital IC applications","15EC1109"],["Computer Organization","15CT1104"],["Digital System Design","15EC1110"],["Data Structures for Engineering applications","15IT1111"],["Solid State Electronic Devices","15EC1111"],["Linear and Digital IC Applications lab","15EC1112"],["Analog Communications Lab","15EC1113"]];
var ECE5 = [["Control Systems","15EC1105"],["Digital Communications","15EC1114"],["Digital Signal Processing","15EC1115"],["Antennas and Wave Propagation","15EC1116"],["VLSI Design","15EC1117"],["Operating Systems","15CT1110"],["Optical Fiber Communications","15EC1119"],["Advanced Computer Architecture","15CS1104"],["VLSI Design Lab","15EC1120"],["Digital Communications Lab","15EC1121"]];
var ECE6 = [["Managerial Economics and Financial Analysis","15HM1101"],["Microcontroller and Interfacing","15EC1122"],["Microwave Engineering","15EC1123"],["Data Communication Networks","15EC1124"],["Information theory & Coding","15EC1125"],["Digital Image Processing","15EC1126"],["Digital IC Design","15EC1127"],["Wireless Communications","15EC1128"],["Computer Networks","15CT1124"],["Adv. Digital Signal Processing","15EC1129"],["FPGA Architecture","15EC1130"],["Digital TV Engineering","15EC1131"],["Industry Lectures","15CT11IL"],["Technical Communication and Soft Skills Lab","15HE1103"],["Digital Signal Processing Lab","15EC1132"]];
var ECE7 = [["Management Science","15HM1102"],["Electronic Measurements and Instrumentation","15EC1133"],["Satellite Communications","15EC1134"],["Advanced Optical Networks","15EC1135"],["Embedded Systems","15EC1136"]["Low Power VLSI Design","15EC1137"],["Digital System Design with PLD’s and FPGA","15EC11M1"],["Advanced 3G and 4G Wireless Mobile Communications","15EC11M2"],["RF Integrated Circuits","15EC11M3"],["Real Time Operating Systems","15EC1138"],["Radar Engineering","15EC1139"],["Hardware Software Co-Design","15EC1140"],["Digital Signal Processors and Architecture","15EC1141"],["Advanced Digital Signal Processing","15EC11M4"],["Adaptive Signal Processing","15EC11M5"],["Networking Tools","15EC11S1"],["Lab VIEW Tools","15EC11S2"],["ARM based/Aurdino Programming","15EC11S3"],["App Development","15EC11S4"],["VLSI Design Tools","15EC11S5"],["EDA Tools","15EC11S6"],["PCB Designing","15EC11S7"],["FPGA Validation","15EC11S8"],["Microwave and Antenna Design","15EC11S9"],["Microwave Engineering Lab","15EC1142"],["Microcontroller and Interfacing Lab","15EC1143"]["Industry Oriented Mini Project","15EC11MP"]];
var EEE1 = [["English","15HE1101"],["Mathematics-I","15BM1101"],["Physics","15BP1101"],["Engineering Mechanics","15ME1101"],["Computer Programming through C","15CT1102"],["English Language Lab","15HE1102"],["Physics Lab","15BP1102"],["Computer Programming Lab","15CT1103"]];
var EEE2 = [["Mathemathics-II","15BM11102"],["Special functions and complex variables","15BM1104"],["Chemistry","15BC1101"],["Electronic Devices and Circuits","15EC1101"],["Network Analysis-I","15EE1101"],["Chemistry Lab","15BC1102"],["Electronic Devices and Circuits Lab","15EC1102"],["Engineering Drawing","15ME1102"],["Engineering Workshop","15MT1101"]];
var EEE3 = [["Fluid Mechanics and Hydraulic Machines","15CE1169"],["Principles of Chemical Engg.","15CH1101"],["Electronics Engineering","15EC1145"],["Electrical Machines-I","15EE1102"],["Electro Magnetic Fields","15EE1103"],["Network Analysis-II","15EE1104"],["Control Systems","15EE1105"],["Environmental Studies","15BC1104"],["Networks and Simulation Lab","15EE1106"],["Fluid Mechanics and Hydraulic Machines lab","15CE1129"],["Basic Computation Lab","15CH1117"]];
var EEE4 = [["Environmental Chemistry","15BC1103"],["Probability, Statistics and Numerical Methods","15BM1103"],["Random Variables and Numerical Methods","15BM1107"],["Managerial Economics and Financial Accounting","15HM1101"],["Electrical Machines-II","15EE1107"],["Digital Logic Design","15EC1105"],["Power Generation Engineering","15EE1108"],["Introduction to Signals and Systems","15EE1122"],["State Variable Methods & Control","15EE1123"],["Energy conversion systems","15EE1124"],["Amplifier and regulators","15EE1125"],["Analog Circuits (MOOCS)","15EE11M1"],["Control Systems and Simulation Lab","15EE1109"],["Electrical Machines Lab-I","15EE1110"]];
var EEE5 = [["Power Transmission Engineering","15EE1111"],["Power Electronics","15EE1112"],["Electrical Measurements & Instrumentation","15EE1113"],["Management Science","15HM1102"],["Electronic Circuit Analysis","15EC1103"],["Analog Communications","15EC1108"],["Computer Organization","15CT1104"],["Electrical Engineering Materials","15EE1126"],["Optimization Techniques","15EE1127"],["Digital System Design","15EC1124"],["Dynamics & Control (MOOCS)","15EE11M2"],["Electrical Machines Lab-II","15EE1115"],["Technical Communication and Soft Skills Lab  Foreign Language","15HE1103"]];
var EEE6 = [["Embedded Processors ","15EE1114"],["Switchgear and Protection","15EE1116"],["Linear and Digital IC Applications","15EC1109"],["Programmable Logic Controllers","15EE1128"],["Introduction to Digital Signal Processing","15EE1129"],["Data Structures for engineering applications","15IT1111"],["Power Distribution Engineering","15EE1130"],["Instrumentation and Process Control","15EE1131"],["Digital Communications","15EC1112"],["Industrial Electronics","15EE1132"],["Power Electronic Converter Fed Drives","15EE1133"],["Optimal and Adaptive Control","15EE1134"],["Utilization OF Electrical Energy","15EE1135"],["Digital Control Systems","15EE1136"],["Sub Station Design","15EE1137"],["Industry Lectures","15CT11IL"],["Pulse and Integrated Circuits Lab","15EC1152"],["Electrical Measurements Lab","15EE1117"]];
var EEE7 = [["Power System Analysis","15EE1118"],["Power System Operation and Control","15EE1119"],["High Voltage Engineering","15EE1138"],["Electric Power Distribution automation","15EE1139"],["Electrical Power Quality","15EE1140"],["System Identification and Parameter Estimation","15EE1141"],["Energy Auditing","15EE1142"],["HVDC Transmission","15EE1143"],["Artificial Intelligence (MOOCS)","15EE11M3"],["Analysis of Power Electronic Converters","15EE1144"],["VLSI Design","15EC1115"],["Smart Grid","15EE1145"],["Introduction to Restructured  Power systems","15EE1146"],["Flexible AC Transmission System","15EE1147"],["Power System Dynamics","15EE1148"],["Solar Energy(MOOCS)","15EE11M4"],["Industrial Automation Laboratory COE PUNE)","15EE11S1"],["Industrial Automation Laboratory COE PUNE)","15EE11S1"],["PLC(COE PUNE)","15EE11S2"],["Virtual High Voltage lab (IIT Kharagpur)","15EE11S3"],["Analog Signals, Network and Measurement Laboratory(IIT Kharagpur)","15EE11S4"],["Real Time Embedded Systems Laboratory (IIT Kharagpur)","15EE11S5"],["Power Electronics & Simulation Lab","15EE1120"],["Embedded Processors Lab","15EE1121"],["Industry Oriented Mini Project","15CS11MP"]];
var CE1 =  [["English","15HE1101"],["Mathematics-I","15BM1101"],["Principles of Chemical Engineering","15CH1101"],["Physical Chemistry","15BC1105"],["Basic Electrical Engineering","15EE1153"],["Elements Of EE & ME","15EM1101"],["Electronics Engineering","15EC1145"],["Engineering Workshop","15MT1101"],["English Language Lab","15HE1102"],["Physical Chemistry Lab","15BC1106"]];
var CE2 =  [["Mathematics-II","15BM1102"],["Physics","15BP1101"],["Engineering Mechanics","15ME1101"],["Organic Chemistry","15BC1107"],["Computer programming through-C","15CT1102"],["Engineering Drawing","15ME1102"],["Physics Lab","15BP1102"],["Computer Programming Lab","15CT1103"],["Organic Chemistry Lab","15BC1108"]];
var CE3 =  [["Environmental Chemistry","15BC1103"],["Probability, Statistics & Numerical Methods","15BM1103"],["Random Variables & Numerical Methods","15BM1107"],["Probability and Statistics","15BM1105"],["Chemical Engineering Thermodynamics - I","15CH1102"],["Momentum Transfer","15CH1103"],["Chemical Process Calculations","15CH1104"],["Mechanical  Operations","15CH1105"],["Environmental Studies","15BC1104"],["Mechanical Operations Lab","15CH1106"],["Momentum Transfer Lab","15CH1107"]];
var CE4 =  [["Chemical Technology","15CH1108"],["Process Heat transfer","15CH1109"],["Chemical Engineering Thermodynamics -II","15CH1110"],["Mass Transfer Operation-I","15CH1111"],["Materail Science For Chemical Engineers","15CH1113"],["Nano Technology","15CH1114"],["Polymer Engineering","15CH1115"],["Process Instrumentation","15CH1112"],["Process Heat transfer Lab","15CH1116"],["Basic Computations LaB","15CH1117"]];
var CE5 =  [["Numerical Methods in Chemical Engineering","15CH1118"],["Chemical Reaction Engineering-I","15CH1119"],["Mass Transfer Operation-II","15CH1120"],["Industrial Pollution and Control","15CH1121"],["Process Dynamics and Control","15CH1122"],[" Green Chemical Engineering","15CH1123"],["Petroleum Refining and Petrochemicals","15CH1124"],["Instrumentation Methods for  Chemical Analysis","15CH1125"],["Mass Transfer Operations Lab","15CH1126"],["English","15HE1101"],["English Language Lab","15HE1103"],["Management Science","15HM1102"],[" Professional Ethics","15HM11PE"]];
var CE6 =  [["Management Science","15HM1102"],["Chemical Reaction Engineering-II","15CH1127"],["Chemical Plant Design and Economics","15CH1128"],[" Energy Engineering ","15CH1129"],["Corrosion Engineering","15CH1130"],["Safety & Hazard Analysis","15CH1131"],["Air pollution","15CH1132"],["Novel Separation Processes","15CH1133"],["Environmental Biotechnology","15CH1134"],["ndustry Lectures","15CH11IL"],["Process Dynamics and Control Lab","15CH1135"],["Chemical Reaction Engineering Lab","15CH1136"]];
var CE7 =  [["Chemical  Process  Equipment   Design","15CH1137"],["Transport Phenomena","15CH1138"],["Process Modeling and Simulation","15CH1139"],["Chemical Engineering Mathematics","15CH1140"],["Waste Water Treatment","15CH1141"],["Biochemical Engineering","15CH1142"],["Optimization of Chemical Processes","15CH1143"],["Solid Waste Management","15CH1144"],["Computational Fluid Dynamics","15CH1145"],["Downstream processing in Bio processing","15CH1146"],[" COMSOL","15CH11S1"],[" HEN ","15CH11S4"],["Computer Aided Design of Chemical Equipment Lab","15CH1147"],["Control System Design, Simulation and Optimization lab","15CH1148"],["Industry Oriented Mini Project","15CH11MP"]];
var MECH1 = [["Mathematics-I","15BM1101"],["Physics","15BP1101"],["Computer Programming through C","15CT1102"],["Engineering Mechanics","15ME1101"],["Basic Electronics","15EC1144"],["Electronics Engineering","15EC1145"],["Basic Electrical Engineering","15EE1153"],["Electrical Technology","15EE1155"],["Physics Lab","15BP1102"],["Computer Programming Lab","15CT1103"],["Engineering Drawing","15ME1102"]];
var MECH2 = [["English","15HE1101"],["Mathematics-II","15BM1102"],["Chemistry","15BC1101"],["Thermodynamics","15ME1103"],["English Language Lab","15HE1102"],["Chemistry Lab","15BC1102"],["Electrical and Electronics Lab","15EC1146"],["Engineering Workshop","15MT1101"]];
var MECH3 = [["Special functions and Complex variables","15BM1104"],["Probability & Statistics","15BM1105"],["Environmental Chemistry ","15BC1103"],["Fluid Mechanics","15ME1104"],["Mechanics of Solids","15ME1105"],["Manufacturing Technology-I","15ME1106"],["Material Science","15ME1107"],["Environmental Studies","15BC1104"],["Materials Testing Lab","15ME1108"],["Manufacturing Technology – I Lab","15ME1109"]];
var MECH4 = [["Numerical Methods","15BM1108"],["Fluid Machinery","15ME1110"],["Kinematics of Mechanisms","15ME1111"],["Thermal Engineering-I","15ME1112"],["Managerial Economics and Financial Analysis","15HM1101"],["Foundry Technology","15ME1113"],["Advanced Mechanics of Solids","15ME1114"],["Gas Dynamics","15ME11M2"],["Welding Technology","15ME11M1"],["Fluid Mechanics and Machinery Lab","15ME1115"],["Computer Aided Machine Drawing","15ME1116"]];
var MECH5 = [["Heat Transfer","15ME1117"],["Industrial Management","15HM1108"],["Dynamics of Machinery","15ME1118"],["Design of Machine Elements-I","15ME1119"],["Composite Materials","15ME1120"],["Introduction to Aircraft Systems","15ME1121"],["Automobile Engineering","15ME1122"],["Tribology","15ME1123"],["Operations Research","15ME1124"],["Thermal Engineering-II","15ME1125"],["Thermal Engineering Lab","15ME1126"],["Technical Communication & Soft Skills Lab","15HE1103"]];
var MECH6 = [["Manufacturing Technology-II","15ME1127"],["Design of Machine Elements-II","15ME1128"],["Finite Element Method","15ME1129"],["Production, Planning and Control","15ME1130"],["Design Optimization","15ME1131"],["Power Plant Engineering"," 15ME1132"],["Mechanical Vibrations & Condition Monitoring","15ME1133"],["Non-Destructive Testing","15ME1134"],["Advanced Manufacturing Processes","15ME1135"],["Introduction to Aircraft Structures","15ME1136"],["Heat Exchangers","15ME1137"],["Material handling","15ME1138"],["Hydraulic and Pneumatic Systems","15ME1139"],["Industrial Lectures","15ME11IL"],["Manufacturing Technology – II Lab","15ME1140"],["Heat Transfer Lab","15ME1141"]];
var MECH7 = [["Mechanical Measurements & Metrology","15ME1142"],["CAD/CAM","15ME1143"],["Automation in Manufacturing","15ME1144"],["Noise and Vibration Control","15ME1145"],["Refrigeration & Air Conditioning","15ME1146"],["Project Management","15ME1147"],["Mechatronics","15ME1148"],["Robotics","15ME1149"],["Design and Analysis of Experiments","15ME1150"],["Renewable Sources of Energy","15ME1151"],["Computer Graphics"," 15ME1152"],["Advanced Mechanisms","15ME1153"],["CFD","15ME11S1"],["Java Programming","15ME11S2"],["CAD/CAM Lab","15ME1154"],["Mechanical Measurements Lab","15ME1155"],["Industry Oriented Mini-Project","15ME11MP"]];
var CIVIL1 = [["Mathematics-I","15BM1101"],["Surveying","15CE1101"],["Engineering Mechanics","15ME1101"],["Chemistry","15BC1101"],["Elements of EE&ME","15EM1101"],["Basic Electrical Engineering","15EE1153"],["Electronics engg","15EC1145"],["PrincipleS of chemical engg","15CH1101"],["Chemistry Lab","15BC1102"],["Surveying lab","15CE1102"],["Engineering Drawing","15ME1102"]];
var CIVIL2 = [["English","15HE1101"],["Mathemathics-II","15BM11102"],["Computer Programming Through C","15CT1102"],["Physics","15BP1101"],["Building materials and construction","15CE1103"],["English Language Lab","15HE1102"],["Engineering Workshop","15MT1101"],["Physics Lab","15BP1102"],["Computer Programming Lab","15CT1103"]];
var CIVIL3 = [["Environmental Chemistry","15BC1103"],["Probability, Statistics and Numerical Methods","15BM1103"],["Random Variables and Numerical Methods","15BM1107"],["Environmental studies","15BC1104"],["Strength of materials","15CE1104"],["Fluid mechanics","15CE1105"],["Engineering Geology","15CE1106"],["Building planning and design","15CE1107"],["Strength of ,aterials lab","15CE1108"],["Engineering geology lab","15CE1109"]];
var CIVIL4 = [["Managerial economics and financial accounting","15HM1101"],["Hydraulics and hydraulic machinery","15CE1110"],["Structural Analysis-1","15CE1111"],["Concrete technology","15CE1112"],["Transportation engineering","15CE1113"],["Advances surveying","15CE1114"],["Ports and Harbors","15CE1115"],["Environmental sanitation","15CE1116"],["New construction materials","15CE1117"]["Transportation engineering lab","15CE1118"],["Concrete technology lab","15CE1119"]];
var CIVIL5 = [["Reinforced concrete structures","15CE1120"],["Water resources Enginnering-1","15CE1121"],["Geotechnical engineering-1","15CE1122"],["Structural Analysis-2","15CE1123"],["Environmental engineering","15CE1124"],["Pre-stressed Concrete","15CE1125"],["Railway engineering","15CE1126"],["Environmental Bio-Chemistry","15CE1127"],["Construction methods & equipment","15CE1128"]["Fluid mechanics and hydraulics lab","15CE1129"],["Technical communication and soft skills lab","15HE1103"]];
var CIVIL6 = [["Design of steel structures","15CE1130"],["Geotechnical engineering-2","15CE1131"],["Water resource engineering-2","15CE1132"],["Structural engg.detailing lab","15CE1133"],["Geotechnical engineerin lab","15CE1134"],["Advanced structural analysis","15CE1135"],["Ground improvement techniques","15CE1136"],["Traffic Engineering","15CE1137"],["Air Pollution and control","15CE1138"],["Ground Water development & Management","15CE1139"],["Repairs,re-habiliation &retrofitting techniques of structure","15CE1140"],["Advanced Reinforced Concrete Structures","15CE1141"],["Introduction to Geo-environmental Engineering","15CE1142"],["Airport planning","15CE1143"],["Watershed Management","15CE1144"],["industrial waste and waste water management","15CE1145"],["Building services and maintanance","15CE1146"],["Industrial Lectures","15CE1133"]];
var CIVIL7 = [["Estimation,Quantity surveying & construction management","15CE1147"],["management Science","15HM1102"],["Computer applications in civil engieering","15CE1148"],["Environmental Engineering lab","15CE1149"],["Advanced Design of Steel Structures","15CE1150"],["Soil Dynamics and machine Foundations","15CE1151"],["Surface Water Quality Modelling","15CE1152"],["Pavement analysis and Design","15CE1153"],["Water resource System Planning and Management ","15CE1154"],["Introduction to Rock Mechanics","15CE1155"],["design of form work and construction safety","15CE1156"],["Earthquake resistant design of Structures","15CE1157"],["Advanced foundation engineering","15CE1158"],["Reinforced Soil Technology","15CE1159"],["Transportation Planning and design","15CE1160"],["Remote Sensing and Gis","15CE1161"],["hazardous Waste Management","15CE1162"],["Quality Assesment and quality Controlmethods","15CE1163"],["Buliding Drawing lab using CAD","15CE11S1"],["Condition Monitoring of Structures","15CE11S2"],["Surveying using Total Station","15CE11S3"],["Traffic Management Lab","15CE11S4"],["Industry Oriented Miniproject","15CE11MP"]];
var OPEN = [["Design and Analysis of Experiments","15CH1149"],["Disaster Management","15CE1164"],["Green Buildings and Infrastructure","15CE1166"],["Biomedical Instrumentation","15EC1148"],["Renewable Sources of Energy","15ME1151"],["Project Management","15ME1147"],["E – Commerce","15CS1109"],["Database Management Systems","15CT1108"],["Electrical Safety Management","15EE1149"],["Special Electrical Machines for Industrial Applications","15EE1152"],["Object Oriented Programming Through JAVA","15CT1109"],["Entrepreneurship and Small Business Management","15HM1105"],["Financial Management","15HM1105"],["Management of Technology","15HM1106"]];
var FREE = [["Banking, Financial Services and Insurance","15FE1112"],["Business Intelligence","15FE1102"],["Basics of Securities and Stock Market","15FE1109"],["Entrepreneurial Finance","15FE1106"],["E - Tailing","15FE1111"],["Intellectual Property Rights and Patents","15FE1101"],["Life Skills","15FE1107"],["Psychology","15FE1103"],["Spread Sheet Modeling for Business","15FE1108"],["Women Entrepreneurship","15FE1105"],["Introduction to Cyber Security","15FE1114"],["Project Work","15IT11PW"],["Professional Ethics","15HM11PE"],["Social Work","15IT11SW"]];
var skl = [[["Simulation of Separation Processes Lab","15CH11S2"],["DCS Based Simulator Lab","15CH11S3"]],[["Computation Lab","15CE11S7"],["Project Management Lab","15CE11S8"]],[["App Development Lab","15CT11S1"],["Python Lab","15CT11S2"]],[["Networking Tools","15EC11S1"],["Lab VIEW Tools","15EC11S2"],["ARM based/Aurdino Programming","15EC11S3"],["App Developmen","15EC11S4"],["VLSI Design Tools","15EC11S5"],["EDA Tools","15EC11S6"],["PCB Designing","15EC11S7"],["FPGA Validation","15EC11S8"],["Microwave and Antenna Design","15EC11S9"]],[["Industrial Automation Laboratory (COE PUNE) ","15EE11S1"],["PLC(COE PUNE)","15EE11S2"],["Virtual High Voltage lab (IIT Kharagpur)","15EE11S3"],["Analog Signals, Network and Measurement Laboratory(IIT Kharagpur)","15EE11S4"],["Real Time Embedded Systems Laboratory (IIT Kharagpur)","15EE11S5"]],[["App Development Lab","15CT11S1"],["Python Lab","15CT11S2"]],[["Vibrations and Condition Monitoring","15ME11S3"],["CNC Machining","15ME11S4"]]] ; 
            if(strUser2 == "General"){
                $("#change").empty();
                     var ch = eval(subj);
                     for(var i = 0; i < ch.length; i++) {
                            var opt = ch[i][0];
                            var el = document.createElement("option");
                            el.text = opt;
                            el.value = ch[i][1];
                            select.add(el);
                    
                    }
                }
                        
            if(strUser2 == "Open elective"){
                     $("#change").empty();
                     var ch = OPEN;
                     for(var i = 0; i < ch.length; i++) {
                            var opt = ch[i][0];
                            var el = document.createElement("option");
                            el.text = opt;
                            el.value = ch[i][1];
                            select.add(el);
                    
                    }
                }
                else if(strUser2 == "Skill based lab elective"){
                            
                     if(strUser1 == 'CE'){
                                $("#change").empty();
                                var ch = skl[0];
                               for(var i = 0; i < ch.length; i++) {
                                        var opt = ch[i][0];
                                        var el = document.createElement("option");
                                        el.text = opt;
                                        el.value = ch[i][1];
                                        select.add(el);
                               }
                               }
                                else if(strUser1 == "CIVIL"){
                                $("#change").empty();
                               var ch = skl[1];
                               for(var i = 0; i < ch.length; i++) {
                                        var opt = ch[i][0];
                                        var el = document.createElement("option");
                                        el.text = opt;
                                        el.value = ch[i][1];
                                        select.add(el);
                               }
                                }
                                                                else if(strUser1 == "CSE"){
                                $("#change").empty();
                                var ch = skl[2];
                               for(var i = 0; i < ch.length; i++) {
                                        var opt = ch[i][0];
                                        var el = document.createElement("option");
                                        el.text = opt;
                                        el.value = ch[i][1];
                                        select.add(el);
                               }
                            }
                                                                else if(strUser1 == "ECE"){
                                $("#change").empty();
                                    var ch = skl[3];
                               for(var i = 0; i < ch.length; i++) {
                                        var opt = ch[i][0];
                                        var el = document.createElement("option");
                                        el.text = opt;
                                        el.value = ch[i][1];
                                        select.add(el);
                               }
                            }
                                                                else if(strUser1 == "EEE"){
                                $("#change").empty();
                                var ch = skl[4];
                               for(var i = 0; i < ch.length; i++) {
                                        var opt = ch[i][0];
                                        var el = document.createElement("option");
                                        el.text = opt;
                                        el.value = ch[i][1];
                                        select.add(el);
                               }
                            }
                                                                else if(strUser1 == "IT"){
                                $("#change").empty();
                                var ch = skl[5];
                               for(var i = 0; i < ch.length; i++) {
                                        var opt = ch[i][0];
                                        var el = document.createElement("option");
                                        el.text = opt;
                                        el.value = ch[i][1];
                                        select.add(el);
                               }
                            }
                                                                else if(strUser1 == "MECH"){
                                $("#change").empty();
                                var ch = skl[6];
                               for(var i = 0; i < ch.length; i++) {
                                        var opt = ch[i][0];
                                        var el = document.createElement("option");
                                        el.text = opt;
                                        el.value = ch[i][1];
                                        select.add(el);
                               }
                        }
                    }
                        else if(strUser2 == "Free elective"){
                     $("#change").empty();
                                var ch = FREE;
                               for(var i = 0; i < ch.length; i++) {
                                        var opt = ch[i][0];
                                        var el = document.createElement("option");
                                        el.text = opt;
                                        el.value = ch[i][1];
                                        select.add(el);
                    
                    }
                }
                }