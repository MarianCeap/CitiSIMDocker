BEGIN TRANSACTION;
CREATE TABLE Users (
userID integer primary key autoincrement,
userName varchar(50),
userEmail varchar(50),
userPass varchar(100));
INSERT INTO `Users` (userID,userName,userEmail,userPass) VALUES (1,'Test','test@mail.ro','$2b$12$PLa/AQarGTkpgbamsd4d8uJFubmarX5qDMkRbwfl1LBWCxpW6hAwa'),
 (2,'A','A','$2b$12$NAJl8ncrT9.1nQNe8c3zS.ukCW4H9GDQA8QEqrBFemWzbT16BG9Tu'),
 (3,'B','B','$2b$12$IRcYm3NZcaKRl80tqw2HxuWE/s/4wbo7LjKQlxjulCX.mMIqxziI6'),
 (4,'Marian','m','$2b$12$GJHSPllJGp2KeKWHric5weCRjv/SHP8bg3gxrL414XoKKo/rrJv0S'),
 (5,'Andu','griga.andreea@gmail.com','$2b$12$/AWX.8h6tcC7.XRktJdTfuEQ7djWtQIPGgw9kdM2Nsp9MXo8IXMbO'),
 (6,'a','a','$2b$12$Lafx1Z.NCAgT3XkQYCWmFO/0Gw3ZWjJlMjXVUxMBlywGClqrYYuQq'),
 (7,'c','c@mail.ro','$2b$12$.uRJYN0CFd2WXw237vq1BOUP4qa2D5dYaLzWCHKEpqHRA5SQ60ECa'),
 (8,'anais.sachian','anais.sachian@beia.ro','$2b$12$Z0DvhBCHUdVJmPMYy54u5eH9sWdOVIq6eFrcAtRx5ggvDGx7HExgq'),
 (9,'TestUser','testuser@mail.com','$2b$12$p.zyxnyWDoSyzzSa16V7c.aS26fGbuqrZIcmD0L3hKpu9uddt5PyW'),
 (10,'teodor','teo.bostiog@yahoo.com','$2b$12$OFlsPPzQb04152v1S80dWeubYTVGkvX3fQLEAkzDNRv/QkoCLXtdS'),
 (11,'anais.sachian','anaissacian@beia.ro','$2b$12$n11ynxrT3PyOq2umtqKhTeNwfkSvRCL.2TzDFOC6.CfhW5o9OnCOe');
CREATE TABLE "Scenarios" (
	`ID`	integer PRIMARY KEY AUTOINCREMENT,
	`UserID`	INTEGER,
	`Name`	varchar(100),
	`Value`	real,
	`ValueType`	varchar(10),
	`Duration`	integer,
	`DurationType`	varchar(10),
	`Description`	varchar(255),
	`StartDate`	varchar(10)
);
INSERT INTO `Scenarios` (ID,UserID,Name,Value,ValueType,Duration,DurationType,Description,StartDate) VALUES (32,2,'Scenario Teo',5000.0,'EUR',6,'Months',' 5k euro investment for the implementation of a PV solution...the offer is based on 6 month contract','2019-01'),
 (46,1,'Demo CitiSim Business Intelligence (Scenario 1)',60000.0,'EUR',24,'Months','Implementation of a PV solution (Scenario 1)','2019-01'),
 (55,4,'MTest',2000.0,'EUR',12,'Months',' Test Marian','2019-01'),
 (57,1,'Demo CitiSim Business Intelligence (Scenario 2)',50000.0,'EUR',24,'Months',' Acquisition of PV system for the headquarter (Scenario 2)','2019-01'),
 (71,1,'Final Scenario',40000.0,'EUR',12,'Months',' hhhh','2020-01'),
 (72,1,'Test',2500.0,'EUR',5,'Months',' ','2020-01');
CREATE TABLE Rules (
RuleID integer primary key autoincrement,
ScenarioID integer,
RuleName varchar(100),
RuleMin real,
RuleMax real,
RuleEsco real,
RuleClient real
);
INSERT INTO `Rules` (RuleID,ScenarioID,RuleName,RuleMin,RuleMax,RuleEsco,RuleClient) VALUES (27,32,'Rule 1',0.0,10.0,0.0,100.0),
 (28,32,'Rule 2',10.0,20.0,20.0,80.0),
 (29,32,'Rule 3',20.0,40.0,50.0,50.0),
 (31,32,'Rule 4',40.0,100.0,70.0,30.0),
 (64,46,'Rule 1',0.0,10.0,0.0,100.0),
 (65,46,'Rule 2',10.0,20.0,20.0,80.0),
 (66,46,'Rule 3',20.0,40.0,50.0,50.0),
 (67,46,'Rule 4',40.0,100.0,70.0,30.0),
 (77,55,'Rule1',0.0,50.0,25.0,75.0),
 (78,55,'Rule2',50.0,100.0,50.0,50.0),
 (82,57,'Rule 1',0.0,10.0,0.0,100.0),
 (83,57,'Rule 2',10.0,20.0,30.0,70.0),
 (86,57,'Rule 3',20.0,30.0,50.0,50.0),
 (88,57,'Rule 4',30.0,100.0,60.0,40.0);
CREATE TABLE "BasicOutput" (
	`OutputID`	integer PRIMARY KEY AUTOINCREMENT,
	`ScenarioID`	integer,
	`BillName`	varchar(50),
	`BaselineBill`	real,
	`CurrentBill`	real,
	`SavingsMU`	real,
	`SavingsPercent`	real,
	`AmountReturned`	real,
	`AmountYetToBeReturned`	real,
	`ROI`	real,
	`IRR`	real,
	`NPV`	real,
	`ESCO`	real,
	`Client`	real
);
INSERT INTO `BasicOutput` (OutputID,ScenarioID,BillName,BaselineBill,CurrentBill,SavingsMU,SavingsPercent,AmountReturned,AmountYetToBeReturned,ROI,IRR,NPV,ESCO,Client) VALUES (16,32,'january 2018',5000.0,4000.0,1000.0,20.0,1000.0,4000.0,20.0,-80.0,-4029.13,500.0,500.0),
 (17,32,'february 2018',4700.0,3900.0,800.0,17.02,1800.0,3200.0,36.0,-48.77,-3275.05,160.0,640.0),
 (18,32,'march 2018',5500.0,4200.0,1300.0,23.64,3100.0,1900.0,62.0,-19.72,-2085.37,650.0,650.0),
 (19,32,'april 2018',4600.0,3800.0,800.0,17.39,3900.0,1100.0,78.0,-9.3,-1374.58,160.0,640.0),
 (20,32,'may 2018',5000.0,3800.0,1200.0,24.0,5100.0,0.0,102.0,0.65,-339.45,600.0,600.0),
 (21,32,'june 2018',5700.0,4600.0,1100.0,19.3,6200.0,0.0,124.0,6.33,581.79,220.0,880.0),
 (67,46,'2019-01',8000.0,7100.0,900.0,11.25,900.0,59100.0,1.5,-98.5,-59126.21,180.0,720.0),
 (68,46,'2019-02',8110.0,6000.0,2110.0,26.02,3010.0,56990.0,5.02,-80.48,-57137.34,1055.0,1055.0),
 (69,46,'2019-03',5500.0,3800.0,1700.0,30.91,4710.0,55290.0,7.85,-65.12,-55581.6,850.0,850.0),
 (70,46,'2019-04',6500.0,4300.0,2200.0,33.85,6910.0,53090.0,11.52,-50.24,-53626.92,1100.0,1100.0),
 (71,46,'2019-05',7200.0,4100.0,3100.0,43.06,10010.0,49990.0,16.68,-37.32,-50952.84,2170.0,930.0),
 (72,46,'2019-06',7600.0,4200.0,3400.0,44.74,13410.0,46590.0,22.35,-28.38,-48105.39,2380.0,1020.0),
 (96,32,'July 2018',1200.0,1620.0,-420.0,-35.0,5780.0,0.0,115.6,4.49,240.29,0.0,0.0),
 (97,55,'Month1',170.0,100.0,70.0,41.18,70.0,1930.0,3.5,-96.5,-1932.04,17.5,52.5),
 (98,55,'Month2',200.0,100.0,100.0,50.0,170.0,1830.0,8.5,-75.82,-1837.78,50.0,50.0),
 (101,57,'2019-01',8000.0,6500.0,1500.0,18.75,1500.0,48500.0,3.0,-97.0,-48543.69,450.0,1050.0),
 (102,57,'2019-02',8110.0,5600.0,2510.0,30.95,4010.0,45990.0,8.02,-76.04,-46177.77,1506.0,1004.0),
 (103,57,'2019-03',5500.0,3550.0,1950.0,35.45,5960.0,44040.0,11.92,-60.03,-44393.25,1170.0,780.0),
 (104,57,'2019-04',6500.0,4000.0,2500.0,38.46,8460.0,41540.0,16.92,-44.98,-42172.03,1500.0,1000.0),
 (105,57,'2019-05',7200.0,3900.0,3300.0,45.83,11760.0,38240.0,23.52,-32.61,-39325.42,1980.0,1320.0),
 (106,57,'2019-06',7600.0,4000.0,3600.0,47.37,15360.0,34640.0,30.72,-24.02,-36310.48,2160.0,1440.0),
 (107,57,'2019-07',7760.0,4200.0,3560.0,45.88,18920.0,31080.0,37.84,-18.11,-33415.87,2136.0,1424.0),
 (108,57,'2019-08',7830.0,4300.0,3530.0,45.08,22450.0,27550.0,44.9,-13.79,-30629.26,2118.0,1412.0),
 (109,57,'2019-09',7650.0,4320.0,3330.0,43.53,25780.0,24220.0,51.56,-10.64,-28077.09,1998.0,1332.0),
 (110,57,'2019-10',7570.0,4300.0,3270.0,43.2,29050.0,20950.0,58.1,-8.17,-25643.9,1962.0,1308.0),
 (111,57,'2019-11',7900.0,5700.0,2200.0,27.85,31250.0,18750.0,62.5,-6.77,-24054.58,1100.0,1100.0),
 (112,57,'2019-12',8350.0,6990.0,1360.0,16.29,32610.0,17390.0,65.22,-5.98,-23100.7,408.0,952.0),
 (113,57,'2020-01',8000.0,6550.0,1450.0,18.13,34060.0,15940.0,68.12,-5.2,-22113.32,435.0,1015.0),
 (114,57,'2020-02',8110.0,5650.0,2460.0,30.33,36520.0,13480.0,73.04,-4.02,-20486.97,1476.0,984.0),
 (115,57,'2020-03',5500.0,3600.0,1900.0,34.55,38420.0,11580.0,76.84,-3.23,-19267.43,1140.0,760.0),
 (116,57,'2020-04',6500.0,4050.0,2450.0,37.69,40870.0,9130.0,81.74,-2.35,-17740.67,1470.0,980.0),
 (117,57,'2020-05',7200.0,3950.0,3250.0,45.14,44120.0,5880.0,88.24,-1.37,-15774.37,1950.0,1300.0),
 (118,57,'2020-06',7600.0,4050.0,3550.0,46.71,47670.0,2330.0,95.34,-0.49,-13689.12,2130.0,1420.0),
 (119,57,'2020-07',7760.0,4200.0,3560.0,45.88,51230.0,0.0,102.46,0.24,-11658.9,2136.0,1424.0),
 (120,57,'2020-08',7830.0,4300.0,3530.0,45.08,54760.0,0.0,109.52,0.85,-9704.42,2118.0,1412.0),
 (121,57,'2020-09',7650.0,4320.0,3330.0,43.53,58090.0,0.0,116.18,1.35,-7914.39,1998.0,1332.0),
 (122,57,'2020-10',7570.0,4300.0,3270.0,43.2,61360.0,0.0,122.72,1.77,-6207.8,1962.0,1308.0),
 (123,57,'2020-11',7900.0,5700.0,2200.0,27.85,63560.0,0.0,127.12,2.03,-5093.08,1100.0,1100.0),
 (124,57,'2020-12',8350.0,7000.0,1350.0,16.17,64910.0,0.0,129.82,2.17,-4428.96,405.0,945.0),
 (125,46,'2019-07',7760.0,4250.0,3510.0,45.23,16920.0,43080.0,28.2,-22.01,-45251.44,2457.0,1053.0),
 (126,46,'2019-08',7830.0,4420.0,3410.0,43.55,20330.0,39670.0,33.88,-17.44,-42559.55,2387.0,1023.0),
 (127,46,'2019-09',7650.0,4500.0,3150.0,41.18,23480.0,36520.0,39.13,-14.15,-40145.34,2205.0,945.0),
 (128,46,'2019-10',7570.0,4390.0,3180.0,42.01,26660.0,33340.0,44.43,-11.48,-37779.12,2226.0,954.0),
 (129,46,'2019-11',7900.0,5800.0,2100.0,26.58,28760.0,31240.0,47.93,-9.97,-36262.04,1050.0,1050.0),
 (130,46,'2019-12',8350.0,7300.0,1050.0,12.57,29810.0,30190.0,49.68,-9.26,-35525.59,210.0,840.0),
 (131,46,'2020-01',8000.0,7000.0,1000.0,12.5,30810.0,29190.0,51.35,-8.6,-34844.64,200.0,800.0),
 (132,46,'2020-02',8110.0,6000.0,2110.0,26.02,32920.0,27080.0,54.87,-7.32,-33449.68,1055.0,1055.0),
 (133,46,'2020-03',5500.0,3700.0,1800.0,32.73,34720.0,25280.0,57.87,-6.38,-32294.33,900.0,900.0),
 (134,46,'2020-06',7600.0,4350.0,3250.0,42.76,37970.0,22030.0,63.28,-4.96,-30269.03,2275.0,975.0),
 (135,46,'2020-07',7760.0,4500.0,3260.0,42.01,41230.0,18770.0,68.72,-3.82,-28296.68,2282.0,978.0),
 (136,46,'2020-08',7830.0,4350.0,3480.0,44.44,44710.0,15290.0,74.52,-2.83,-26252.55,2436.0,1044.0),
 (137,46,'2020-09',7650.0,4390.0,3260.0,42.61,47970.0,12030.0,79.95,-2.05,-24393.42,2282.0,978.0),
 (138,46,'2020-10',7570.0,4800.0,2770.0,36.59,50740.0,9260.0,84.57,-1.48,-22859.73,1385.0,1385.0),
 (139,46,'2020-11',7900.0,5800.0,2100.0,26.58,52840.0,7160.0,88.07,-1.09,-21730.88,1050.0,1050.0),
 (140,46,'2020-12',8350.0,7800.0,550.0,6.59,53390.0,6610.0,88.98,-0.99,-21443.84,0.0,550.0),
 (350,72,'2020-01',0.0,0.0,0.0,0.0,0.0,2500.0,0.0,NULL,-2500.0,0.0,0.0),
 (351,72,'2020-02',0.0,0.0,0.0,0.0,0.0,2500.0,0.0,NULL,-2500.0,0.0,0.0),
 (352,72,'2020-03',0.0,0.0,0.0,0.0,0.0,2500.0,0.0,NULL,-2500.0,0.0,0.0),
 (353,72,'2020-04',0.0,0.0,0.0,0.0,0.0,2500.0,0.0,NULL,-2500.0,0.0,0.0),
 (354,72,'2020-05',0.0,0.0,0.0,0.0,0.0,2500.0,0.0,NULL,-2500.0,0.0,0.0),
 (355,71,'2020-01',814.0,345.0,469.0,57.62,469.0,39531.0,1.17,-98.83,-39544.66,0.0,0.0),
 (356,71,'2020-02',1203.68851444991,0.0,1203.68851444991,100.0,1672.68851444991,38327.3114855501,4.18,-82.06,-38410.07,0.0,0.0),
 (357,71,'2020-03',1492.90451376547,0.0,1492.90451376547,100.0,3165.59302821538,36834.4069717846,7.91,-63.16,-37043.85,0.0,0.0),
 (358,71,'2020-04',1480.54528414078,0.0,1480.54528414078,100.0,4646.13831235616,35353.8616876438,11.62,-49.5,-35728.4,0.0,0.0),
 (359,71,'2020-05',455.940775003022,0.0,455.940775003022,100.0,5102.07908735918,34897.9209126408,12.76,-45.35,-35335.11,0.0,0.0),
 (360,71,'2020-06',429.586229360504,0.0,429.586229360504,100.0,5531.66531671969,34468.3346832803,13.83,-40.9,-34975.33,0.0,0.0),
 (361,71,'2020-07',1660.79679813388,0.0,1660.79679813388,100.0,7192.46211485356,32807.5378851464,17.98,-29.94,-33624.95,0.0,0.0),
 (362,71,'2020-08',2014.79925552138,0.0,2014.79925552138,100.0,9207.26137037494,30792.7386296251,23.02,-22.84,-32034.45,0.0,0.0),
 (363,71,'2020-09',3292.79982689831,0.0,3292.79982689831,100.0,12500.0611972733,27499.9388027267,31.25,-16.11,-29510.8,0.0,0.0),
 (364,71,'2020-10',2480.39995975144,0.0,2480.39995975144,100.0,14980.4611570247,25019.5388429753,37.45,-12.74,-27665.15,0.0,0.0),
 (365,71,'2020-11',1271.99999064165,0.0,1271.99999064165,100.0,16252.4611476663,23747.5388523337,40.63,-11.28,-26746.23,0.0,0.0),
 (366,71,'2020-12',787.199997824049,0.0,787.199997824049,100.0,17039.6611454904,22960.3388545096,42.6,-10.42,-26194.1,0.0,0.0);
COMMIT;