-- NOGA 2008 Seed Data - Part 1: Sections A-J
-- Swiss NOGA (Nomenclature Générale des Activités économiques) based on NACE Rev. 2

-- ============================================================
-- SECTION LEVEL (level=1)
-- ============================================================
INSERT INTO noga_codes (code, label_de, label_fr, section, section_label_de, division, group_code, class_code, level) VALUES
('A','Land- und Forstwirtschaft, Fischerei','Agriculture, sylviculture et pêche','A','Land- und Forstwirtschaft, Fischerei',NULL,NULL,NULL,1),
('B','Bergbau und Gewinnung von Steinen und Erden','Industries extractives','B','Bergbau und Gewinnung von Steinen und Erden',NULL,NULL,NULL,1),
('C','Verarbeitendes Gewerbe / Herstellung von Waren','Industrie manufacturière','C','Verarbeitendes Gewerbe / Herstellung von Waren',NULL,NULL,NULL,1),
('D','Energieversorgung','Production et distribution d''électricité, de gaz, de vapeur et d''air conditionné','D','Energieversorgung',NULL,NULL,NULL,1),
('E','Wasserversorgung/ Abwasser- und Abfallentsorgung','Production et distribution d''eau/ assainissement','E','Wasserversorgung/ Abwasser- und Abfallentsorgung',NULL,NULL,NULL,1),
('F','Baugewerbe / Bau','Construction','F','Baugewerbe / Bau',NULL,NULL,NULL,1),
('G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','Commerce/ réparation d''automobiles','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen',NULL,NULL,NULL,1),
('H','Verkehr und Lagerei','Transports et entreposage','H','Verkehr und Lagerei',NULL,NULL,NULL,1),
('I','Gastgewerbe / Beherbergung und Gastronomie','Hébergement et restauration','I','Gastgewerbe / Beherbergung und Gastronomie',NULL,NULL,NULL,1),
('J','Information und Kommunikation','Information et communication','J','Information und Kommunikation',NULL,NULL,NULL,1)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION A: DIVISIONS (level=2)
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('01','Landwirtschaft, Jagd und damit verbundene Tätigkeiten','A','Land- und Forstwirtschaft, Fischerei','01',NULL,NULL,2),
('02','Forstwirtschaft und Holzeinschlag','A','Land- und Forstwirtschaft, Fischerei','02',NULL,NULL,2),
('03','Fischerei und Aquakultur','A','Land- und Forstwirtschaft, Fischerei','03',NULL,NULL,2)
ON CONFLICT (code) DO NOTHING;

-- SECTION A: GROUPS (level=3)
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('01.1','Anbau einjähriger Pflanzen','A','Land- und Forstwirtschaft, Fischerei','01','01.1',NULL,3),
('01.2','Anbau mehrjähriger Pflanzen','A','Land- und Forstwirtschaft, Fischerei','01','01.2',NULL,3),
('01.3','Betrieb von Baumschulen/ Anbau von Pflanzen zu Vermehrungszwecken','A','Land- und Forstwirtschaft, Fischerei','01','01.3',NULL,3),
('01.4','Tierhaltung','A','Land- und Forstwirtschaft, Fischerei','01','01.4',NULL,3),
('01.5','Gemischte Landwirtschaft','A','Land- und Forstwirtschaft, Fischerei','01','01.5',NULL,3),
('01.6','Erbringung von landwirtschaftlichen Dienstleistungen','A','Land- und Forstwirtschaft, Fischerei','01','01.6',NULL,3),
('01.7','Jagd, Fallenstellung und damit verbundene Tätigkeiten','A','Land- und Forstwirtschaft, Fischerei','01','01.7',NULL,3),
('02.1','Forstwirtschaft','A','Land- und Forstwirtschaft, Fischerei','02','02.1',NULL,3),
('02.2','Holzeinschlag','A','Land- und Forstwirtschaft, Fischerei','02','02.2',NULL,3),
('02.3','Sammeln von wildwachsenden Erzeugnissen (ohne Holz)','A','Land- und Forstwirtschaft, Fischerei','02','02.3',NULL,3),
('02.4','Erbringung von Dienstleistungen für Forstwirtschaft und Holzeinschlag','A','Land- und Forstwirtschaft, Fischerei','02','02.4',NULL,3),
('03.1','Fischerei','A','Land- und Forstwirtschaft, Fischerei','03','03.1',NULL,3),
('03.2','Aquakultur','A','Land- und Forstwirtschaft, Fischerei','03','03.2',NULL,3)
ON CONFLICT (code) DO NOTHING;

-- SECTION A: CLASSES (level=4)
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('01.11','Anbau von Getreide (ohne Reis), Hülsenfrüchten und Ölsaaten','A','Land- und Forstwirtschaft, Fischerei','01','01.1','01.11',4),
('01.12','Anbau von Reis','A','Land- und Forstwirtschaft, Fischerei','01','01.1','01.12',4),
('01.13','Anbau von Gemüse und Melonen sowie Wurzeln und Knollen','A','Land- und Forstwirtschaft, Fischerei','01','01.1','01.13',4),
('01.14','Anbau von Zuckerrohr','A','Land- und Forstwirtschaft, Fischerei','01','01.1','01.14',4),
('01.15','Anbau von Tabak','A','Land- und Forstwirtschaft, Fischerei','01','01.1','01.15',4),
('01.16','Anbau von Faserpflanzen','A','Land- und Forstwirtschaft, Fischerei','01','01.1','01.16',4),
('01.19','Anbau von sonstigen einjährigen Pflanzen','A','Land- und Forstwirtschaft, Fischerei','01','01.1','01.19',4),
('01.21','Anbau von Weintrauben','A','Land- und Forstwirtschaft, Fischerei','01','01.2','01.21',4),
('01.22','Anbau von tropischen und subtropischen Früchten','A','Land- und Forstwirtschaft, Fischerei','01','01.2','01.22',4),
('01.23','Anbau von Zitrusfrüchten','A','Land- und Forstwirtschaft, Fischerei','01','01.2','01.23',4),
('01.24','Anbau von Kernobst und Steinobst','A','Land- und Forstwirtschaft, Fischerei','01','01.2','01.24',4),
('01.25','Anbau von sonstigen Baum- und Strauchfrüchten sowie Nüssen','A','Land- und Forstwirtschaft, Fischerei','01','01.2','01.25',4),
('01.26','Anbau von ölhaltigen Früchten','A','Land- und Forstwirtschaft, Fischerei','01','01.2','01.26',4),
('01.27','Anbau von Pflanzen zur Herstellung von Getränken','A','Land- und Forstwirtschaft, Fischerei','01','01.2','01.27',4),
('01.28','Anbau von Gewürz-, Aroma- und Drogenpflanzen','A','Land- und Forstwirtschaft, Fischerei','01','01.2','01.28',4),
('01.29','Anbau von sonstigen mehrjährigen Pflanzen','A','Land- und Forstwirtschaft, Fischerei','01','01.2','01.29',4),
('01.30','Betrieb von Baumschulen/ Anbau von Pflanzen zu Vermehrungszwecken','A','Land- und Forstwirtschaft, Fischerei','01','01.3','01.30',4),
('01.41','Haltung von Milchkühen','A','Land- und Forstwirtschaft, Fischerei','01','01.4','01.41',4),
('01.42','Haltung von anderen Rindern und Büffeln','A','Land- und Forstwirtschaft, Fischerei','01','01.4','01.42',4),
('01.43','Haltung von Pferden und Eseln','A','Land- und Forstwirtschaft, Fischerei','01','01.4','01.43',4),
('01.44','Haltung von Kamelen und Kamelartigen','A','Land- und Forstwirtschaft, Fischerei','01','01.4','01.44',4),
('01.45','Haltung von Schafen und Ziegen','A','Land- und Forstwirtschaft, Fischerei','01','01.4','01.45',4),
('01.46','Haltung von Schweinen','A','Land- und Forstwirtschaft, Fischerei','01','01.4','01.46',4),
('01.47','Haltung von Geflügel','A','Land- und Forstwirtschaft, Fischerei','01','01.4','01.47',4),
('01.49','Haltung von sonstigen Tieren','A','Land- und Forstwirtschaft, Fischerei','01','01.4','01.49',4),
('01.50','Gemischte Landwirtschaft','A','Land- und Forstwirtschaft, Fischerei','01','01.5','01.50',4),
('01.61','Erbringung von Dienstleistungen für den Pflanzenbau','A','Land- und Forstwirtschaft, Fischerei','01','01.6','01.61',4),
('01.62','Erbringung von Dienstleistungen für die Tierhaltung','A','Land- und Forstwirtschaft, Fischerei','01','01.6','01.62',4),
('01.63','Erbringung von Dienstleistungen nach der Ernte','A','Land- und Forstwirtschaft, Fischerei','01','01.6','01.63',4),
('01.64','Aufbereitung von Saatgut','A','Land- und Forstwirtschaft, Fischerei','01','01.6','01.64',4),
('01.70','Jagd, Fallenstellung und damit verbundene Tätigkeiten','A','Land- und Forstwirtschaft, Fischerei','01','01.7','01.70',4),
('02.10','Forstwirtschaft','A','Land- und Forstwirtschaft, Fischerei','02','02.1','02.10',4),
('02.20','Holzeinschlag','A','Land- und Forstwirtschaft, Fischerei','02','02.2','02.20',4),
('02.30','Sammeln von wildwachsenden Erzeugnissen (ohne Holz)','A','Land- und Forstwirtschaft, Fischerei','02','02.3','02.30',4),
('02.40','Erbringung von Dienstleistungen für Forstwirtschaft und Holzeinschlag','A','Land- und Forstwirtschaft, Fischerei','02','02.4','02.40',4),
('03.11','Seefischerei','A','Land- und Forstwirtschaft, Fischerei','03','03.1','03.11',4),
('03.12','Süsswasserfischerei','A','Land- und Forstwirtschaft, Fischerei','03','03.1','03.12',4),
('03.21','Meerwasseraquakultur','A','Land- und Forstwirtschaft, Fischerei','03','03.2','03.21',4),
('03.22','Süsswasseraquakultur','A','Land- und Forstwirtschaft, Fischerei','03','03.2','03.22',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION B: DIVISIONS + GROUPS + CLASSES
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('05','Kohlenbergbau','B','Bergbau und Gewinnung von Steinen und Erden','05',NULL,NULL,2),
('06','Gewinnung von Erdöl und Erdgas','B','Bergbau und Gewinnung von Steinen und Erden','06',NULL,NULL,2),
('07','Erzbergbau','B','Bergbau und Gewinnung von Steinen und Erden','07',NULL,NULL,2),
('08','Gewinnung von Steinen und Erden, sonstiger Bergbau','B','Bergbau und Gewinnung von Steinen und Erden','08',NULL,NULL,2),
('09','Erbringung von Dienstleistungen für den Bergbau','B','Bergbau und Gewinnung von Steinen und Erden','09',NULL,NULL,2)
ON CONFLICT (code) DO NOTHING;

INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('05.1','Steinkohlenbergbau','B','Bergbau und Gewinnung von Steinen und Erden','05','05.1',NULL,3),
('05.2','Braunkohlenbergbau','B','Bergbau und Gewinnung von Steinen und Erden','05','05.2',NULL,3),
('06.1','Gewinnung von Erdöl','B','Bergbau und Gewinnung von Steinen und Erden','06','06.1',NULL,3),
('06.2','Gewinnung von Erdgas','B','Bergbau und Gewinnung von Steinen und Erden','06','06.2',NULL,3),
('07.1','Eisenerzbergbau','B','Bergbau und Gewinnung von Steinen und Erden','07','07.1',NULL,3),
('07.2','NE-Metallerzbergbau','B','Bergbau und Gewinnung von Steinen und Erden','07','07.2',NULL,3),
('08.1','Gewinnung von Natursteinen, Kies, Sand, Ton und Kaolin','B','Bergbau und Gewinnung von Steinen und Erden','08','08.1',NULL,3),
('08.9','Gewinnung von sonstigen Mineralien/ Torfgewinnung/ Salzgewinnung','B','Bergbau und Gewinnung von Steinen und Erden','08','08.9',NULL,3),
('09.1','Erbringung von Dienstleistungen für Erdöl- und Erdgasgewinnung','B','Bergbau und Gewinnung von Steinen und Erden','09','09.1',NULL,3),
('09.9','Erbringung von Dienstleistungen für den sonstigen Bergbau','B','Bergbau und Gewinnung von Steinen und Erden','09','09.9',NULL,3)
ON CONFLICT (code) DO NOTHING;

INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('05.10','Steinkohlenbergbau','B','Bergbau und Gewinnung von Steinen und Erden','05','05.1','05.10',4),
('05.20','Braunkohlenbergbau','B','Bergbau und Gewinnung von Steinen und Erden','05','05.2','05.20',4),
('06.10','Gewinnung von Erdöl','B','Bergbau und Gewinnung von Steinen und Erden','06','06.1','06.10',4),
('06.20','Gewinnung von Erdgas','B','Bergbau und Gewinnung von Steinen und Erden','06','06.2','06.20',4),
('07.10','Eisenerzbergbau','B','Bergbau und Gewinnung von Steinen und Erden','07','07.1','07.10',4),
('07.21','Bergbau auf Uran- und Thoriumerze','B','Bergbau und Gewinnung von Steinen und Erden','07','07.2','07.21',4),
('07.29','Sonstiger NE-Metallerzbergbau','B','Bergbau und Gewinnung von Steinen und Erden','07','07.2','07.29',4),
('08.11','Gewinnung von Naturwerksteinen und Natursteinen, Kalk- und Gipsstein, Kreide und Schiefer','B','Bergbau und Gewinnung von Steinen und Erden','08','08.1','08.11',4),
('08.12','Gewinnung von Kies, Sand, Ton und Kaolin','B','Bergbau und Gewinnung von Steinen und Erden','08','08.1','08.12',4),
('08.91','Gewinnung von Mineralien für die chemische Industrie und Düngemittelindustrie','B','Bergbau und Gewinnung von Steinen und Erden','08','08.9','08.91',4),
('08.92','Torfgewinnung','B','Bergbau und Gewinnung von Steinen und Erden','08','08.9','08.92',4),
('08.93','Salzgewinnung','B','Bergbau und Gewinnung von Steinen und Erden','08','08.9','08.93',4),
('08.99','Gewinnung von sonstigen Mineralien a.n.g.','B','Bergbau und Gewinnung von Steinen und Erden','08','08.9','08.99',4),
('09.10','Erbringung von Dienstleistungen für die Gewinnung von Erdöl und Erdgas','B','Bergbau und Gewinnung von Steinen und Erden','09','09.1','09.10',4),
('09.90','Erbringung von Dienstleistungen für den sonstigen Bergbau','B','Bergbau und Gewinnung von Steinen und Erden','09','09.9','09.90',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION C: DIVISIONS (level=2)
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('10','Herstellung von Nahrungs- und Futtermitteln','C','Verarbeitendes Gewerbe / Herstellung von Waren','10',NULL,NULL,2),
('11','Getränkeherstellung','C','Verarbeitendes Gewerbe / Herstellung von Waren','11',NULL,NULL,2),
('12','Tabakverarbeitung','C','Verarbeitendes Gewerbe / Herstellung von Waren','12',NULL,NULL,2),
('13','Herstellung von Textilien','C','Verarbeitendes Gewerbe / Herstellung von Waren','13',NULL,NULL,2),
('14','Herstellung von Bekleidung','C','Verarbeitendes Gewerbe / Herstellung von Waren','14',NULL,NULL,2),
('15','Herstellung von Leder, Lederwaren und Schuhen','C','Verarbeitendes Gewerbe / Herstellung von Waren','15',NULL,NULL,2),
('16','Herstellung von Holz-, Flecht-, Korb- und Korkwaren (ohne Möbel)','C','Verarbeitendes Gewerbe / Herstellung von Waren','16',NULL,NULL,2),
('17','Herstellung von Papier, Pappe und Waren daraus','C','Verarbeitendes Gewerbe / Herstellung von Waren','17',NULL,NULL,2),
('18','Herstellung von Druckerzeugnissen/ Vervielfältigung von bespielten Ton-, Bild- und Datenträgern','C','Verarbeitendes Gewerbe / Herstellung von Waren','18',NULL,NULL,2),
('19','Kokerei und Mineralölverarbeitung','C','Verarbeitendes Gewerbe / Herstellung von Waren','19',NULL,NULL,2),
('20','Herstellung von chemischen Erzeugnissen','C','Verarbeitendes Gewerbe / Herstellung von Waren','20',NULL,NULL,2),
('21','Herstellung von pharmazeutischen Erzeugnissen','C','Verarbeitendes Gewerbe / Herstellung von Waren','21',NULL,NULL,2),
('22','Herstellung von Gummi- und Kunststoffwaren','C','Verarbeitendes Gewerbe / Herstellung von Waren','22',NULL,NULL,2),
('23','Herstellung von Glas und Glaswaren, Keramik, Verarbeitung von Steinen und Erden','C','Verarbeitendes Gewerbe / Herstellung von Waren','23',NULL,NULL,2),
('24','Metallerzeugung und -bearbeitung','C','Verarbeitendes Gewerbe / Herstellung von Waren','24',NULL,NULL,2),
('25','Herstellung von Metallerzeugnissen','C','Verarbeitendes Gewerbe / Herstellung von Waren','25',NULL,NULL,2),
('26','Herstellung von Datenverarbeitungsgeräten, elektronischen und optischen Erzeugnissen','C','Verarbeitendes Gewerbe / Herstellung von Waren','26',NULL,NULL,2),
('27','Herstellung von elektrischen Ausrüstungen','C','Verarbeitendes Gewerbe / Herstellung von Waren','27',NULL,NULL,2),
('28','Maschinenbau','C','Verarbeitendes Gewerbe / Herstellung von Waren','28',NULL,NULL,2),
('29','Herstellung von Kraftwagen und Kraftwagenteilen','C','Verarbeitendes Gewerbe / Herstellung von Waren','29',NULL,NULL,2),
('30','Sonstiger Fahrzeugbau','C','Verarbeitendes Gewerbe / Herstellung von Waren','30',NULL,NULL,2),
('31','Herstellung von Möbeln','C','Verarbeitendes Gewerbe / Herstellung von Waren','31',NULL,NULL,2),
('32','Herstellung von sonstigen Waren','C','Verarbeitendes Gewerbe / Herstellung von Waren','32',NULL,NULL,2),
('33','Reparatur und Installation von Maschinen und Ausrüstungen','C','Verarbeitendes Gewerbe / Herstellung von Waren','33',NULL,NULL,2)
ON CONFLICT (code) DO NOTHING;

-- SECTION C: CLASSES (level=4) - Division 10-18
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('10.11','Schlachten (ohne Schlachten von Geflügel)','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.1','10.11',4),
('10.12','Schlachten von Geflügel','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.1','10.12',4),
('10.13','Fleischverarbeitung','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.1','10.13',4),
('10.20','Fischverarbeitung','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.2','10.20',4),
('10.31','Kartoffelverarbeitung','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.3','10.31',4),
('10.32','Herstellung von Frucht- und Gemüsesäften','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.3','10.32',4),
('10.39','Sonstige Verarbeitung von Obst und Gemüse','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.3','10.39',4),
('10.41','Herstellung von Ölen und Fetten (ohne Margarine)','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.4','10.41',4),
('10.42','Herstellung von Margarine und ähnlichen Nahrungsfetten','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.4','10.42',4),
('10.51','Milchverarbeitung und Herstellung von Käse','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.5','10.51',4),
('10.52','Herstellung von Speiseeis','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.5','10.52',4),
('10.61','Mahl- und Schälmühlen','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.6','10.61',4),
('10.62','Herstellung von Stärke und Stärkeerzeugnissen','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.6','10.62',4),
('10.71','Herstellung von Backwaren (ohne Dauerbackwaren)','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.7','10.71',4),
('10.72','Herstellung von Dauerbackwaren','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.7','10.72',4),
('10.73','Herstellung von Teigwaren','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.7','10.73',4),
('10.81','Herstellung von Zucker','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.8','10.81',4),
('10.82','Herstellung von Süsswaren (ohne Dauerbackwaren)','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.8','10.82',4),
('10.83','Verarbeitung von Kaffee und Tee','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.8','10.83',4),
('10.84','Herstellung von Würzmitteln und Sossen','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.8','10.84',4),
('10.85','Herstellung von Fertiggerichten','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.8','10.85',4),
('10.86','Herstellung von homogenisierten und diätetischen Nahrungsmitteln','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.8','10.86',4),
('10.89','Herstellung von sonstigen Nahrungsmitteln a.n.g.','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.8','10.89',4),
('10.91','Herstellung von Futtermitteln für Nutztiere','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.9','10.91',4),
('10.92','Herstellung von Futtermitteln für sonstige Tiere','C','Verarbeitendes Gewerbe / Herstellung von Waren','10','10.9','10.92',4),
('11.01','Herstellung von Spirituosen','C','Verarbeitendes Gewerbe / Herstellung von Waren','11','11.0','11.01',4),
('11.02','Herstellung von Traubenwein','C','Verarbeitendes Gewerbe / Herstellung von Waren','11','11.0','11.02',4),
('11.03','Herstellung von Apfelwein und anderen Obstweinen','C','Verarbeitendes Gewerbe / Herstellung von Waren','11','11.0','11.03',4),
('11.04','Herstellung von anderen nicht destillierten gegorenen Getränken','C','Verarbeitendes Gewerbe / Herstellung von Waren','11','11.0','11.04',4),
('11.05','Herstellung von Bier','C','Verarbeitendes Gewerbe / Herstellung von Waren','11','11.0','11.05',4),
('11.06','Herstellung von Malz','C','Verarbeitendes Gewerbe / Herstellung von Waren','11','11.0','11.06',4),
('11.07','Herstellung von Erfrischungsgetränken/ Gewinnung natürlicher Mineralwässer','C','Verarbeitendes Gewerbe / Herstellung von Waren','11','11.0','11.07',4),
('12.00','Tabakverarbeitung','C','Verarbeitendes Gewerbe / Herstellung von Waren','12','12.0','12.00',4),
('13.10','Spinnstoffaufbereitung und Spinnerei','C','Verarbeitendes Gewerbe / Herstellung von Waren','13','13.1','13.10',4),
('13.20','Weberei','C','Verarbeitendes Gewerbe / Herstellung von Waren','13','13.2','13.20',4),
('13.30','Veredlung von Textilien und Bekleidung','C','Verarbeitendes Gewerbe / Herstellung von Waren','13','13.3','13.30',4),
('13.91','Herstellung von gewirktem und gestricktem Stoff','C','Verarbeitendes Gewerbe / Herstellung von Waren','13','13.9','13.91',4),
('13.92','Herstellung von konfektionierten Textilwaren (ohne Bekleidung)','C','Verarbeitendes Gewerbe / Herstellung von Waren','13','13.9','13.92',4),
('13.93','Herstellung von Teppichen und Auslegeware','C','Verarbeitendes Gewerbe / Herstellung von Waren','13','13.9','13.93',4),
('13.94','Herstellung von Seilen, Tauen, Bändern und Netzen','C','Verarbeitendes Gewerbe / Herstellung von Waren','13','13.9','13.94',4),
('13.95','Herstellung von Vliesstoff und Erzeugnissen daraus (ohne Bekleidung)','C','Verarbeitendes Gewerbe / Herstellung von Waren','13','13.9','13.95',4),
('13.96','Herstellung von technischen Textilien','C','Verarbeitendes Gewerbe / Herstellung von Waren','13','13.9','13.96',4),
('13.99','Herstellung von sonstigen Textilwaren a.n.g.','C','Verarbeitendes Gewerbe / Herstellung von Waren','13','13.9','13.99',4),
('14.11','Herstellung von Arbeits- und Berufsbekleidung','C','Verarbeitendes Gewerbe / Herstellung von Waren','14','14.1','14.11',4),
('14.12','Herstellung von sonstiger Oberbekleidung','C','Verarbeitendes Gewerbe / Herstellung von Waren','14','14.1','14.12',4),
('14.13','Herstellung von Wäsche','C','Verarbeitendes Gewerbe / Herstellung von Waren','14','14.1','14.13',4),
('14.14','Herstellung von sonstiger Bekleidung und Bekleidungszubehör','C','Verarbeitendes Gewerbe / Herstellung von Waren','14','14.1','14.14',4),
('14.19','Herstellung von sonstiger Bekleidung a.n.g.','C','Verarbeitendes Gewerbe / Herstellung von Waren','14','14.1','14.19',4),
('14.20','Herstellung von Pelzwaren','C','Verarbeitendes Gewerbe / Herstellung von Waren','14','14.2','14.20',4),
('14.31','Herstellung von Strumpfwaren','C','Verarbeitendes Gewerbe / Herstellung von Waren','14','14.3','14.31',4),
('14.39','Herstellung von sonstiger Strick- und Wirkware','C','Verarbeitendes Gewerbe / Herstellung von Waren','14','14.3','14.39',4),
('15.11','Herstellung von Leder und Lederfaserstoff','C','Verarbeitendes Gewerbe / Herstellung von Waren','15','15.1','15.11',4),
('15.12','Herstellung von Reisegepäck, Handtaschen und ähnlichen Lederwaren','C','Verarbeitendes Gewerbe / Herstellung von Waren','15','15.1','15.12',4),
('15.20','Herstellung von Schuhen','C','Verarbeitendes Gewerbe / Herstellung von Waren','15','15.2','15.20',4),
('16.10','Säge-, Hobel- und Holzimprägnierwerke','C','Verarbeitendes Gewerbe / Herstellung von Waren','16','16.1','16.10',4),
('16.21','Herstellung von Furnier, Sperrholz, Span- und Faserplatten','C','Verarbeitendes Gewerbe / Herstellung von Waren','16','16.2','16.21',4),
('16.22','Herstellung von Parkett','C','Verarbeitendes Gewerbe / Herstellung von Waren','16','16.2','16.22',4),
('16.23','Herstellung von Konstruktionsteilen und Fertigbauteilen aus Holz','C','Verarbeitendes Gewerbe / Herstellung von Waren','16','16.2','16.23',4),
('16.24','Herstellung von Verpackungsmitteln aus Holz','C','Verarbeitendes Gewerbe / Herstellung von Waren','16','16.2','16.24',4),
('16.29','Herstellung von sonstigen Holz-, Kork-, Flecht- und Korbwaren','C','Verarbeitendes Gewerbe / Herstellung von Waren','16','16.2','16.29',4),
('17.11','Herstellung von Holzstoff und Zellstoff','C','Verarbeitendes Gewerbe / Herstellung von Waren','17','17.1','17.11',4),
('17.12','Herstellung von Papier, Karton und Pappe','C','Verarbeitendes Gewerbe / Herstellung von Waren','17','17.1','17.12',4),
('17.21','Herstellung von Wellpapier und -pappe sowie Verpackungsmitteln aus Papier','C','Verarbeitendes Gewerbe / Herstellung von Waren','17','17.2','17.21',4),
('17.22','Herstellung von Haushalts-, Hygiene- und Toilettenartikeln aus Papier','C','Verarbeitendes Gewerbe / Herstellung von Waren','17','17.2','17.22',4),
('17.23','Herstellung von Schreibwaren und Bürobedarf aus Papier','C','Verarbeitendes Gewerbe / Herstellung von Waren','17','17.2','17.23',4),
('17.24','Herstellung von Tapeten','C','Verarbeitendes Gewerbe / Herstellung von Waren','17','17.2','17.24',4),
('17.29','Herstellung von sonstigen Papier-, Karton- und Pappewaren','C','Verarbeitendes Gewerbe / Herstellung von Waren','17','17.2','17.29',4),
('18.11','Drucken von Zeitungen','C','Verarbeitendes Gewerbe / Herstellung von Waren','18','18.1','18.11',4),
('18.12','Drucken a.n.g.','C','Verarbeitendes Gewerbe / Herstellung von Waren','18','18.1','18.12',4),
('18.13','Druck- und Medienvorstufe','C','Verarbeitendes Gewerbe / Herstellung von Waren','18','18.1','18.13',4),
('18.14','Buchbinderei und zugehörige Dienstleistungen','C','Verarbeitendes Gewerbe / Herstellung von Waren','18','18.1','18.14',4),
('18.20','Vervielfältigung von bespielten Ton-, Bild- und Datenträgern','C','Verarbeitendes Gewerbe / Herstellung von Waren','18','18.2','18.20',4)
ON CONFLICT (code) DO NOTHING;

-- SECTION C: CLASSES (level=4) - Division 19-26
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('19.10','Kokerei','C','Verarbeitendes Gewerbe / Herstellung von Waren','19','19.1','19.10',4),
('19.20','Mineralölverarbeitung','C','Verarbeitendes Gewerbe / Herstellung von Waren','19','19.2','19.20',4),
('20.11','Herstellung von Industriegasen','C','Verarbeitendes Gewerbe / Herstellung von Waren','20','20.1','20.11',4),
('20.12','Herstellung von Farbstoffen und Pigmenten','C','Verarbeitendes Gewerbe / Herstellung von Waren','20','20.1','20.12',4),
('20.13','Herstellung von sonstigen anorganischen Grundstoffen und Chemikalien','C','Verarbeitendes Gewerbe / Herstellung von Waren','20','20.1','20.13',4),
('20.14','Herstellung von sonstigen organischen Grundstoffen und Chemikalien','C','Verarbeitendes Gewerbe / Herstellung von Waren','20','20.1','20.14',4),
('20.15','Herstellung von Düngemitteln und Stickstoffverbindungen','C','Verarbeitendes Gewerbe / Herstellung von Waren','20','20.1','20.15',4),
('20.16','Herstellung von Kunststoffen in Primärformen','C','Verarbeitendes Gewerbe / Herstellung von Waren','20','20.1','20.16',4),
('20.17','Herstellung von synthetischem Kautschuk in Primärformen','C','Verarbeitendes Gewerbe / Herstellung von Waren','20','20.1','20.17',4),
('20.20','Herstellung von Schädlingsbekämpfungs- und Pflanzenschutzmitteln','C','Verarbeitendes Gewerbe / Herstellung von Waren','20','20.2','20.20',4),
('20.30','Herstellung von Anstrichmitteln, Druckfarben und Kitten','C','Verarbeitendes Gewerbe / Herstellung von Waren','20','20.3','20.30',4),
('20.41','Herstellung von Seifen und Wasch- und Reinigungsmitteln','C','Verarbeitendes Gewerbe / Herstellung von Waren','20','20.4','20.41',4),
('20.42','Herstellung von Kosmetika und Körperpflegemitteln','C','Verarbeitendes Gewerbe / Herstellung von Waren','20','20.4','20.42',4),
('20.51','Herstellung von Explosivstoffen','C','Verarbeitendes Gewerbe / Herstellung von Waren','20','20.5','20.51',4),
('20.52','Herstellung von Klebstoffen','C','Verarbeitendes Gewerbe / Herstellung von Waren','20','20.5','20.52',4),
('20.53','Herstellung von ätherischen Ölen','C','Verarbeitendes Gewerbe / Herstellung von Waren','20','20.5','20.53',4),
('20.59','Herstellung von sonstigen chemischen Erzeugnissen a.n.g.','C','Verarbeitendes Gewerbe / Herstellung von Waren','20','20.5','20.59',4),
('20.60','Herstellung von Chemiefasern','C','Verarbeitendes Gewerbe / Herstellung von Waren','20','20.6','20.60',4),
('21.10','Herstellung von pharmazeutischen Grundstoffen','C','Verarbeitendes Gewerbe / Herstellung von Waren','21','21.1','21.10',4),
('21.20','Herstellung von pharmazeutischen Spezialitäten u.ä.','C','Verarbeitendes Gewerbe / Herstellung von Waren','21','21.2','21.20',4),
('22.11','Herstellung und Runderneuerung von Bereifungen','C','Verarbeitendes Gewerbe / Herstellung von Waren','22','22.1','22.11',4),
('22.19','Herstellung von sonstigen Gummiwaren','C','Verarbeitendes Gewerbe / Herstellung von Waren','22','22.1','22.19',4),
('22.21','Herstellung von Kunststoffplatten, -folien, -schläuchen und -profilen','C','Verarbeitendes Gewerbe / Herstellung von Waren','22','22.2','22.21',4),
('22.22','Herstellung von Kunststoffverpackungen','C','Verarbeitendes Gewerbe / Herstellung von Waren','22','22.2','22.22',4),
('22.23','Herstellung von Baubedarfsartikeln aus Kunststoff','C','Verarbeitendes Gewerbe / Herstellung von Waren','22','22.2','22.23',4),
('22.29','Herstellung von sonstigen Kunststoffwaren','C','Verarbeitendes Gewerbe / Herstellung von Waren','22','22.2','22.29',4),
('23.11','Herstellung von Flachglas','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.1','23.11',4),
('23.12','Veredlung und Bearbeitung von Flachglas','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.1','23.12',4),
('23.13','Herstellung von Hohlglas','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.1','23.13',4),
('23.14','Herstellung von Glasfasern','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.1','23.14',4),
('23.19','Herstellung und Bearbeitung von sonstigem Glas einschl. technischem Spezialglas','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.1','23.19',4),
('23.20','Herstellung von feuerfesten keramischen Werkstoffen und Waren','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.2','23.20',4),
('23.31','Herstellung von keramischen Wand- und Bodenfliesen','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.3','23.31',4),
('23.32','Herstellung von Ziegeln und sonstiger Baukeramik','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.3','23.32',4),
('23.41','Herstellung von keramischen Haushaltswaren und Ziergegenständen','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.4','23.41',4),
('23.42','Herstellung von Sanitärkeramik','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.4','23.42',4),
('23.43','Herstellung von keramischen Isolatoren und Isolierteilen','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.4','23.43',4),
('23.44','Herstellung von sonstigen technischen keramischen Erzeugnissen','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.4','23.44',4),
('23.49','Herstellung von sonstigen keramischen Erzeugnissen','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.4','23.49',4),
('23.51','Herstellung von Zement','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.5','23.51',4),
('23.52','Herstellung von Kalk und gebranntem Gips','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.5','23.52',4),
('23.61','Herstellung von Betonerzeugnissen für den Bau','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.6','23.61',4),
('23.62','Herstellung von Gipserzeugnissen für den Bau','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.6','23.62',4),
('23.63','Herstellung von Frischbeton','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.6','23.63',4),
('23.64','Herstellung von Mörtel','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.6','23.64',4),
('23.65','Herstellung von Faserzement','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.6','23.65',4),
('23.69','Herstellung von sonstigen Erzeugnissen aus Beton, Gips und Zement','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.6','23.69',4),
('23.70','Herstellung von Naturstein','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.7','23.70',4),
('23.91','Herstellung von Schleifkörpern und Schleifmitteln','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.9','23.91',4),
('23.99','Herstellung von sonstigen Erzeugnissen aus nichtmetallischen Mineralien a.n.g.','C','Verarbeitendes Gewerbe / Herstellung von Waren','23','23.9','23.99',4),
('24.10','Erzeugung von Roheisen, Stahl und Ferrolegierungen','C','Verarbeitendes Gewerbe / Herstellung von Waren','24','24.1','24.10',4),
('24.20','Herstellung von Stahlrohren und Rohrverbindungsstücken aus Stahl','C','Verarbeitendes Gewerbe / Herstellung von Waren','24','24.2','24.20',4),
('24.31','Herstellung von Blankstahl','C','Verarbeitendes Gewerbe / Herstellung von Waren','24','24.3','24.31',4),
('24.32','Herstellung von Kaltband mit einer Breite von weniger als 600 mm','C','Verarbeitendes Gewerbe / Herstellung von Waren','24','24.3','24.32',4),
('24.33','Herstellung von Kaltprofilen','C','Verarbeitendes Gewerbe / Herstellung von Waren','24','24.3','24.33',4),
('24.34','Herstellung von kaltgezogenem Draht','C','Verarbeitendes Gewerbe / Herstellung von Waren','24','24.3','24.34',4),
('24.41','Erzeugung und erste Bearbeitung von Edelmetallen','C','Verarbeitendes Gewerbe / Herstellung von Waren','24','24.4','24.41',4),
('24.42','Erzeugung und erste Bearbeitung von Aluminium','C','Verarbeitendes Gewerbe / Herstellung von Waren','24','24.4','24.42',4),
('24.43','Erzeugung und erste Bearbeitung von Blei, Zink und Zinn','C','Verarbeitendes Gewerbe / Herstellung von Waren','24','24.4','24.43',4),
('24.44','Erzeugung und erste Bearbeitung von Kupfer','C','Verarbeitendes Gewerbe / Herstellung von Waren','24','24.4','24.44',4),
('24.45','Erzeugung und erste Bearbeitung von sonstigen NE-Metallen','C','Verarbeitendes Gewerbe / Herstellung von Waren','24','24.4','24.45',4),
('24.46','Aufbereitung von Kernbrennstoffen','C','Verarbeitendes Gewerbe / Herstellung von Waren','24','24.4','24.46',4),
('24.51','Eisengiesserein','C','Verarbeitendes Gewerbe / Herstellung von Waren','24','24.5','24.51',4),
('24.52','Stahlgiessereien','C','Verarbeitendes Gewerbe / Herstellung von Waren','24','24.5','24.52',4),
('24.53','Leichtmetallgiessereien','C','Verarbeitendes Gewerbe / Herstellung von Waren','24','24.5','24.53',4),
('24.54','Buntmetallgiessereien','C','Verarbeitendes Gewerbe / Herstellung von Waren','24','24.5','24.54',4),
('25.11','Herstellung von Metallkonstruktionen','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.1','25.11',4),
('25.12','Herstellung von Ausbauelementen aus Metall','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.1','25.12',4),
('25.21','Herstellung von Heizkörpern und -kesseln für Zentralheizungen','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.2','25.21',4),
('25.29','Herstellung von sonstigen Metall-Tanks und -Behältern','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.2','25.29',4),
('25.30','Herstellung von Dampfkesseln (ohne Zentralheizungskessel)','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.3','25.30',4),
('25.40','Herstellung von Waffen und Munition','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.4','25.40',4),
('25.50','Herstellung von geschmiedeten und gepressten Metallerzeugnissen/ Pulvermetallurgie','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.5','25.50',4),
('25.61','Oberflächenveredlung und Wärmebehandlung','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.6','25.61',4),
('25.62','Mechanik a.n.g.','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.6','25.62',4),
('25.71','Herstellung von Schneidwaren und Essbestecken','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.7','25.71',4),
('25.72','Herstellung von Schlössern und Beschlägen','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.7','25.72',4),
('25.73','Herstellung von Handwerkzeug und Handwerkzeugmaschinen','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.7','25.73',4),
('25.91','Herstellung von Stahl- und Leichtmetallbehältern','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.9','25.91',4),
('25.92','Herstellung von Verpackungen aus Leichtmetall','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.9','25.92',4),
('25.93','Herstellung von Drahtwaren, Ketten und Federn','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.9','25.93',4),
('25.94','Herstellung von Schrauben und Nieten','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.9','25.94',4),
('25.99','Herstellung von sonstigen Metallerzeugnissen a.n.g.','C','Verarbeitendes Gewerbe / Herstellung von Waren','25','25.9','25.99',4),
('26.11','Herstellung von elektronischen Bauelementen','C','Verarbeitendes Gewerbe / Herstellung von Waren','26','26.1','26.11',4),
('26.12','Herstellung von bestückten Leiterplatten','C','Verarbeitendes Gewerbe / Herstellung von Waren','26','26.1','26.12',4),
('26.20','Herstellung von Datenverarbeitungsgeräten und peripheren Geräten','C','Verarbeitendes Gewerbe / Herstellung von Waren','26','26.2','26.20',4),
('26.30','Herstellung von Geräten und Einrichtungen der Telekommunikationstechnik','C','Verarbeitendes Gewerbe / Herstellung von Waren','26','26.3','26.30',4),
('26.40','Herstellung von Geräten der Unterhaltungselektronik','C','Verarbeitendes Gewerbe / Herstellung von Waren','26','26.4','26.40',4),
('26.51','Herstellung von Mess-, Kontroll- und Navigationsinstrumenten','C','Verarbeitendes Gewerbe / Herstellung von Waren','26','26.5','26.51',4),
('26.52','Herstellung von Uhren','C','Verarbeitendes Gewerbe / Herstellung von Waren','26','26.5','26.52',4),
('26.60','Herstellung von Bestrahlungs- und elektromedizinischen Geräten','C','Verarbeitendes Gewerbe / Herstellung von Waren','26','26.6','26.60',4),
('26.70','Herstellung von optischen und fotografischen Instrumenten und Geräten','C','Verarbeitendes Gewerbe / Herstellung von Waren','26','26.7','26.70',4),
('26.80','Herstellung von magnetischen und optischen Datenträgern','C','Verarbeitendes Gewerbe / Herstellung von Waren','26','26.8','26.80',4)
ON CONFLICT (code) DO NOTHING;

-- SECTION C: CLASSES (level=4) - Division 27-33
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('27.11','Herstellung von Elektromotoren, Generatoren und Transformatoren','C','Verarbeitendes Gewerbe / Herstellung von Waren','27','27.1','27.11',4),
('27.12','Herstellung von Geräten zur Elektrizitätsverteilung und -schaltung','C','Verarbeitendes Gewerbe / Herstellung von Waren','27','27.1','27.12',4),
('27.20','Herstellung von Batterien und Akkumulatoren','C','Verarbeitendes Gewerbe / Herstellung von Waren','27','27.2','27.20',4),
('27.31','Herstellung von Glasfaserkabeln','C','Verarbeitendes Gewerbe / Herstellung von Waren','27','27.3','27.31',4),
('27.32','Herstellung von sonstigen elektronischen und elektrischen Drähten und Kabeln','C','Verarbeitendes Gewerbe / Herstellung von Waren','27','27.3','27.32',4),
('27.33','Herstellung von elektrischen Installationsgeräten','C','Verarbeitendes Gewerbe / Herstellung von Waren','27','27.3','27.33',4),
('27.40','Herstellung von elektrischen Lampen und Leuchten','C','Verarbeitendes Gewerbe / Herstellung von Waren','27','27.4','27.40',4),
('27.51','Herstellung von elektrischen Haushaltsgeräten','C','Verarbeitendes Gewerbe / Herstellung von Waren','27','27.5','27.51',4),
('27.52','Herstellung von nichtelektrischen Haushaltsgeräten','C','Verarbeitendes Gewerbe / Herstellung von Waren','27','27.5','27.52',4),
('27.90','Herstellung von sonstigen elektrischen Ausrüstungen und Geräten a.n.g.','C','Verarbeitendes Gewerbe / Herstellung von Waren','27','27.9','27.90',4),
('28.11','Herstellung von Verbrennungsmotoren und Turbinen (ohne Motoren für Fahrzeuge)','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.1','28.11',4),
('28.12','Herstellung von hydraulischen und pneumatischen Bauelementen','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.1','28.12',4),
('28.13','Herstellung von Pumpen und Kompressoren a.n.g.','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.1','28.13',4),
('28.14','Herstellung von Armaturen a.n.g.','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.1','28.14',4),
('28.15','Herstellung von Lagern, Getrieben, Zahnrädern und Antriebselementen','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.1','28.15',4),
('28.21','Herstellung von Öfen und Brennern','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.2','28.21',4),
('28.22','Herstellung von Hebe- und Fördermitteln','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.2','28.22',4),
('28.23','Herstellung von Büromaschinen und -einrichtungen (ohne Computer)','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.2','28.23',4),
('28.24','Herstellung von handgeführten motorbetriebenen Werkzeugen','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.2','28.24',4),
('28.25','Herstellung von technischen Kälteanlagen sowie Raumlufttechnik','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.2','28.25',4),
('28.29','Herstellung von sonstigen nicht wirtschaftszweigspezifischen Maschinen a.n.g.','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.2','28.29',4),
('28.30','Herstellung von land- und forstwirtschaftlichen Maschinen','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.3','28.30',4),
('28.41','Herstellung von Metallbearbeitungsmaschinen','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.4','28.41',4),
('28.49','Herstellung von sonstigen Maschinen für die Metallbearbeitung','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.4','28.49',4),
('28.91','Herstellung von Maschinen für die Metallurgie','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.9','28.91',4),
('28.92','Herstellung von Bergwerks-, Bau- und Baustoffmaschinen','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.9','28.92',4),
('28.93','Herstellung von Maschinen für die Nahrungs- und Genussmittelindustrie','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.9','28.93',4),
('28.94','Herstellung von Maschinen für Textil-, Bekleidungs- und Ledergewerbe','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.9','28.94',4),
('28.95','Herstellung von Maschinen für die Papier- und Kartonindustrie','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.9','28.95',4),
('28.96','Herstellung von Maschinen für Druckgewerbe','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.9','28.96',4),
('28.99','Herstellung von Maschinen für sonstige bestimmte Wirtschaftszweige a.n.g.','C','Verarbeitendes Gewerbe / Herstellung von Waren','28','28.9','28.99',4),
('29.10','Herstellung von Kraftwagen','C','Verarbeitendes Gewerbe / Herstellung von Waren','29','29.1','29.10',4),
('29.20','Herstellung von Karosserien, Aufbauten und Anhängern','C','Verarbeitendes Gewerbe / Herstellung von Waren','29','29.2','29.20',4),
('29.31','Herstellung von elektrischen und elektronischen Ausrüstungsgegenständen für Kraftwagen','C','Verarbeitendes Gewerbe / Herstellung von Waren','29','29.3','29.31',4),
('29.32','Herstellung von sonstigen Teilen und Zubehör für Kraftwagen','C','Verarbeitendes Gewerbe / Herstellung von Waren','29','29.3','29.32',4),
('30.11','Schiffbau (ohne Boots- und Yachtbau)','C','Verarbeitendes Gewerbe / Herstellung von Waren','30','30.1','30.11',4),
('30.12','Boots- und Yachtbau','C','Verarbeitendes Gewerbe / Herstellung von Waren','30','30.1','30.12',4),
('30.20','Schienenfahrzeugbau','C','Verarbeitendes Gewerbe / Herstellung von Waren','30','30.2','30.20',4),
('30.30','Luft- und Raumfahrzeugbau','C','Verarbeitendes Gewerbe / Herstellung von Waren','30','30.3','30.30',4),
('30.40','Herstellung von militärischen Kampffahrzeugen','C','Verarbeitendes Gewerbe / Herstellung von Waren','30','30.4','30.40',4),
('30.91','Herstellung von Krafträdern','C','Verarbeitendes Gewerbe / Herstellung von Waren','30','30.9','30.91',4),
('30.92','Herstellung von Fahrrädern und Behindertenfahrzeugen','C','Verarbeitendes Gewerbe / Herstellung von Waren','30','30.9','30.92',4),
('30.99','Herstellung von sonstigen Fahrzeugen a.n.g.','C','Verarbeitendes Gewerbe / Herstellung von Waren','30','30.9','30.99',4),
('31.01','Herstellung von Büromöbeln','C','Verarbeitendes Gewerbe / Herstellung von Waren','31','31.0','31.01',4),
('31.02','Herstellung von Küchenmöbeln','C','Verarbeitendes Gewerbe / Herstellung von Waren','31','31.0','31.02',4),
('31.03','Herstellung von Matratzen','C','Verarbeitendes Gewerbe / Herstellung von Waren','31','31.0','31.03',4),
('31.09','Herstellung von sonstigen Möbeln','C','Verarbeitendes Gewerbe / Herstellung von Waren','31','31.0','31.09',4),
('32.11','Herstellung von Münzen','C','Verarbeitendes Gewerbe / Herstellung von Waren','32','32.1','32.11',4),
('32.12','Herstellung von Schmuck und ähnlichen Erzeugnissen','C','Verarbeitendes Gewerbe / Herstellung von Waren','32','32.1','32.12',4),
('32.13','Herstellung von Phantasieschmuck','C','Verarbeitendes Gewerbe / Herstellung von Waren','32','32.1','32.13',4),
('32.20','Herstellung von Musikinstrumenten','C','Verarbeitendes Gewerbe / Herstellung von Waren','32','32.2','32.20',4),
('32.30','Herstellung von Sportgeräten','C','Verarbeitendes Gewerbe / Herstellung von Waren','32','32.3','32.30',4),
('32.40','Herstellung von Spielwaren','C','Verarbeitendes Gewerbe / Herstellung von Waren','32','32.4','32.40',4),
('32.50','Herstellung von medizinischen und zahnmedizinischen Apparaten und Materialien','C','Verarbeitendes Gewerbe / Herstellung von Waren','32','32.5','32.50',4),
('32.91','Herstellung von Besen und Bürsten','C','Verarbeitendes Gewerbe / Herstellung von Waren','32','32.9','32.91',4),
('32.99','Herstellung von sonstigen Waren a.n.g.','C','Verarbeitendes Gewerbe / Herstellung von Waren','32','32.9','32.99',4),
('33.11','Reparatur von Metallerzeugnissen','C','Verarbeitendes Gewerbe / Herstellung von Waren','33','33.1','33.11',4),
('33.12','Reparatur von Maschinen','C','Verarbeitendes Gewerbe / Herstellung von Waren','33','33.1','33.12',4),
('33.13','Reparatur von elektronischen und optischen Geräten','C','Verarbeitendes Gewerbe / Herstellung von Waren','33','33.1','33.13',4),
('33.14','Reparatur von elektrischen Ausrüstungen','C','Verarbeitendes Gewerbe / Herstellung von Waren','33','33.1','33.14',4),
('33.15','Reparatur und Instandhaltung von Schiffen und Booten','C','Verarbeitendes Gewerbe / Herstellung von Waren','33','33.1','33.15',4),
('33.16','Reparatur und Instandhaltung von Luft- und Raumfahrzeugen','C','Verarbeitendes Gewerbe / Herstellung von Waren','33','33.1','33.16',4),
('33.17','Reparatur und Instandhaltung von sonstigen Transportmitteln','C','Verarbeitendes Gewerbe / Herstellung von Waren','33','33.1','33.17',4),
('33.19','Reparatur von sonstigen Ausrüstungen','C','Verarbeitendes Gewerbe / Herstellung von Waren','33','33.1','33.19',4),
('33.20','Installation von Maschinen und Ausrüstungen','C','Verarbeitendes Gewerbe / Herstellung von Waren','33','33.2','33.20',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION D: Energieversorgung
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('35','Energieversorgung','D','Energieversorgung','35',NULL,NULL,2),
('35.11','Elektrizitätserzeugung','D','Energieversorgung','35','35.1','35.11',4),
('35.12','Elektrizitätsübertragung','D','Energieversorgung','35','35.1','35.12',4),
('35.13','Elektrizitätsverteilung','D','Energieversorgung','35','35.1','35.13',4),
('35.14','Elektrizitätshandel','D','Energieversorgung','35','35.1','35.14',4),
('35.21','Gaserzeugung','D','Energieversorgung','35','35.2','35.21',4),
('35.22','Gasverteilung durch Rohrleitungen','D','Energieversorgung','35','35.2','35.22',4),
('35.23','Gashandel durch Rohrleitungen','D','Energieversorgung','35','35.2','35.23',4),
('35.30','Wärme- und Kälteversorgung','D','Energieversorgung','35','35.3','35.30',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION E: Wasserversorgung/ Abwasser- und Abfallentsorgung
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('36','Wasserversorgung','E','Wasserversorgung/ Abwasser- und Abfallentsorgung','36',NULL,NULL,2),
('37','Abwasserentsorgung','E','Wasserversorgung/ Abwasser- und Abfallentsorgung','37',NULL,NULL,2),
('38','Sammlung, Behandlung und Beseitigung von Abfällen/ Rückgewinnung','E','Wasserversorgung/ Abwasser- und Abfallentsorgung','38',NULL,NULL,2),
('39','Beseitigung von Umweltverschmutzungen und sonstige Entsorgung','E','Wasserversorgung/ Abwasser- und Abfallentsorgung','39',NULL,NULL,2),
('36.00','Wassergewinnung, -aufbereitung und -verteilung','E','Wasserversorgung/ Abwasser- und Abfallentsorgung','36','36.0','36.00',4),
('37.00','Abwasserentsorgung','E','Wasserversorgung/ Abwasser- und Abfallentsorgung','37','37.0','37.00',4),
('38.11','Sammlung von ungefährlichen Abfällen','E','Wasserversorgung/ Abwasser- und Abfallentsorgung','38','38.1','38.11',4),
('38.12','Sammlung von gefährlichen Abfällen','E','Wasserversorgung/ Abwasser- und Abfallentsorgung','38','38.1','38.12',4),
('38.21','Behandlung und Beseitigung von ungefährlichen Abfällen','E','Wasserversorgung/ Abwasser- und Abfallentsorgung','38','38.2','38.21',4),
('38.22','Behandlung und Beseitigung von gefährlichen Abfällen','E','Wasserversorgung/ Abwasser- und Abfallentsorgung','38','38.2','38.22',4),
('38.31','Rückgewinnung von Wracks und Schrottmetallen','E','Wasserversorgung/ Abwasser- und Abfallentsorgung','38','38.3','38.31',4),
('38.32','Rückgewinnung von sortierten Altstoffen','E','Wasserversorgung/ Abwasser- und Abfallentsorgung','38','38.3','38.32',4),
('39.00','Beseitigung von Umweltverschmutzungen und sonstige Entsorgung','E','Wasserversorgung/ Abwasser- und Abfallentsorgung','39','39.0','39.00',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION F: Baugewerbe / Bau
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('41','Hochbau','F','Baugewerbe / Bau','41',NULL,NULL,2),
('42','Tiefbau','F','Baugewerbe / Bau','42',NULL,NULL,2),
('43','Vorbereitende Baustellenarbeiten, Bauinstallation und sonstiges Ausbaugewerbe','F','Baugewerbe / Bau','43',NULL,NULL,2),
('41.10','Erschliessung von Grundstücken/ Bauträger','F','Baugewerbe / Bau','41','41.1','41.10',4),
('41.20','Bau von Gebäuden','F','Baugewerbe / Bau','41','41.2','41.20',4),
('42.11','Bau von Strassen und Autobahnen','F','Baugewerbe / Bau','42','42.1','42.11',4),
('42.12','Bau von Eisenbahn- und Strassenbahnstrecken','F','Baugewerbe / Bau','42','42.1','42.12',4),
('42.13','Brücken- und Tunnelbau','F','Baugewerbe / Bau','42','42.1','42.13',4),
('42.21','Bau von Gewässern','F','Baugewerbe / Bau','42','42.2','42.21',4),
('42.22','Bau von Fernleitungen und Telekommunikationsleitungen','F','Baugewerbe / Bau','42','42.2','42.22',4),
('42.91','Wasserbau','F','Baugewerbe / Bau','42','42.9','42.91',4),
('42.99','Sonstiger Tiefbau a.n.g.','F','Baugewerbe / Bau','42','42.9','42.99',4),
('43.11','Abbrucharbeiten','F','Baugewerbe / Bau','43','43.1','43.11',4),
('43.12','Vorbereitende Baustellenarbeiten','F','Baugewerbe / Bau','43','43.1','43.12',4),
('43.13','Probebohrung und Testbohrung','F','Baugewerbe / Bau','43','43.1','43.13',4),
('43.21','Elektroinstallation','F','Baugewerbe / Bau','43','43.2','43.21',4),
('43.22','Gas-, Wasser-, Heizungs- sowie Lüftungs- und Klimainstallation','F','Baugewerbe / Bau','43','43.2','43.22',4),
('43.29','Sonstige Bauinstallation','F','Baugewerbe / Bau','43','43.2','43.29',4),
('43.31','Anbringen von Stuck, Gips und Putz','F','Baugewerbe / Bau','43','43.3','43.31',4),
('43.32','Bautischlerei und -schlosserei','F','Baugewerbe / Bau','43','43.3','43.32',4),
('43.33','Fussboden- und Fliesenlegerei','F','Baugewerbe / Bau','43','43.3','43.33',4),
('43.34','Malerei und Glaserei','F','Baugewerbe / Bau','43','43.3','43.34',4),
('43.39','Sonstiger Ausbau a.n.g.','F','Baugewerbe / Bau','43','43.3','43.39',4),
('43.91','Dachdeckerei und Zimmerei','F','Baugewerbe / Bau','43','43.9','43.91',4),
('43.99','Sonstige spezialisierte Bautätigkeiten a.n.g.','F','Baugewerbe / Bau','43','43.9','43.99',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION G: Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('45','Handel mit Kraftfahrzeugen/ Instandhaltung und Reparatur von Kraftfahrzeugen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','45',NULL,NULL,2),
('46','Grosshandel (ohne Handel mit Kraftfahrzeugen)','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46',NULL,NULL,2),
('47','Einzelhandel (ohne Handel mit Kraftfahrzeugen)','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47',NULL,NULL,2),
('45.11','Handel mit Personenkraftwagen und leichten Kraftfahrzeugen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','45','45.1','45.11',4),
('45.19','Handel mit sonstigen Kraftfahrzeugen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','45','45.1','45.19',4),
('45.20','Instandhaltung und Reparatur von Kraftfahrzeugen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','45','45.2','45.20',4),
('45.31','Grosshandel mit Kraftfahrzeugteilen und -zubehör','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','45','45.3','45.31',4),
('45.32','Einzelhandel mit Kraftfahrzeugteilen und -zubehör','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','45','45.3','45.32',4),
('45.40','Handel mit Krafträdern, Kraftradteilen und -zubehör/ Instandhaltung und Reparatur von Krafträdern','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','45','45.4','45.40',4),
('46.11','Handelsvermittlung von landwirtschaftlichen Grundstoffen und lebenden Tieren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.1','46.11',4),
('46.12','Handelsvermittlung von Brennstoffen, Erzen, Metallen und Industriechemikalien','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.1','46.12',4),
('46.13','Handelsvermittlung von Holz und Baustoffen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.1','46.13',4),
('46.14','Handelsvermittlung von Maschinen und technischen Bedarfsartikeln','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.1','46.14',4),
('46.15','Handelsvermittlung von Möbeln, Haushaltsgegenständen und Eisenwaren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.1','46.15',4),
('46.16','Handelsvermittlung von Textilien, Bekleidung, Schuhen und Lederwaren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.1','46.16',4),
('46.17','Handelsvermittlung von Nahrungsmitteln, Getränken und Tabakwaren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.1','46.17',4),
('46.18','Handelsvermittlung von sonstigen Waren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.1','46.18',4),
('46.19','Handelsvermittlung von Waren verschiedener Art','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.1','46.19',4),
('46.21','Grosshandel mit Getreide, Rohtabak, Saatgut und Futtermitteln','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.2','46.21',4),
('46.22','Grosshandel mit Blumen und Pflanzen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.2','46.22',4),
('46.23','Grosshandel mit lebenden Tieren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.2','46.23',4),
('46.24','Grosshandel mit Häuten, Fellen und Leder','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.2','46.24',4),
('46.31','Grosshandel mit Obst, Gemüse und Kartoffeln','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.3','46.31',4),
('46.32','Grosshandel mit Fleisch und Fleischwaren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.3','46.32',4),
('46.33','Grosshandel mit Milch, Milcherzeugnissen, Eiern sowie Speiseölen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.3','46.33',4),
('46.34','Grosshandel mit Getränken','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.3','46.34',4),
('46.35','Grosshandel mit Tabakwaren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.3','46.35',4),
('46.36','Grosshandel mit Zucker, Schokolade und Süsswaren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.3','46.36',4),
('46.37','Grosshandel mit Kaffee, Tee, Kakao und Gewürzen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.3','46.37',4),
('46.38','Grosshandel mit sonstigen Nahrungsmitteln','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.3','46.38',4),
('46.39','Grosshandel mit Nahrungsmitteln, Getränken und Tabakwaren ohne ausgeprägten Schwerpunkt','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.3','46.39',4),
('46.41','Grosshandel mit Textilien','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.4','46.41',4),
('46.42','Grosshandel mit Bekleidung und Schuhen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.4','46.42',4),
('46.43','Grosshandel mit elektrischen Haushaltsgeräten und Leuchten','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.4','46.43',4),
('46.44','Grosshandel mit Keramik, Glas, Tapeten und Reinigungsmitteln','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.4','46.44',4),
('46.45','Grosshandel mit pharmazeutischen und medizinischen Erzeugnissen sowie Körperpflegemitteln','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.4','46.45',4),
('46.46','Grosshandel mit pharmazeutischen Erzeugnissen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.4','46.46',4),
('46.47','Grosshandel mit Möbeln, Teppichen und Beleuchtungsgeräten','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.4','46.47',4),
('46.48','Grosshandel mit Uhren und Schmuck','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.4','46.48',4),
('46.49','Grosshandel mit sonstigen Gebrauchs- und Verbrauchsgütern','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.4','46.49',4),
('46.51','Grosshandel mit elektronischen Bauelementen und Telekommunikationsgeräten','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.5','46.51',4),
('46.52','Grosshandel mit elektronischen und optischen Ausrüstungen a.n.g.','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.5','46.52',4),
('46.61','Grosshandel mit landwirtschaftlichen Maschinen und Geräten','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.6','46.61',4),
('46.62','Grosshandel mit Werkzeugmaschinen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.6','46.62',4),
('46.63','Grosshandel mit Maschinen für den Bergbau und das Baugewerbe','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.6','46.63',4),
('46.64','Grosshandel mit Maschinen für die Textilindustrie sowie mit Nähmaschinen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.6','46.64',4),
('46.65','Grosshandel mit Büromöbeln','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.6','46.65',4),
('46.66','Grosshandel mit sonstigen Büromaschinen und -einrichtungen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.6','46.66',4),
('46.69','Grosshandel mit sonstigen Maschinen und Ausrüstungen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.6','46.69',4),
('46.71','Grosshandel mit festen Brennstoffen, Mineralölen und Chemikalien','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.7','46.71',4),
('46.72','Grosshandel mit Metallen und Metallerzen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.7','46.72',4),
('46.73','Grosshandel mit Holz, Baustoffen und Sanitärkeramik','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.7','46.73',4),
('46.74','Grosshandel mit Metallwaren und Eisenwaren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.7','46.74',4),
('46.75','Grosshandel mit chemischen Erzeugnissen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.7','46.75',4),
('46.76','Grosshandel mit sonstigen Rohstoffen und Halbwaren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.7','46.76',4),
('46.77','Grosshandel mit Altmaterialien und Reststoffen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.7','46.77',4),
('46.90','Nicht spezialisierter Grosshandel','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','46','46.9','46.90',4),
('47.11','Einzelhandel in Verkaufsräumen mit einem breiten Sortiment (Supermärkte u.ä.)','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.1','47.11',4),
('47.19','Sonstiger Einzelhandel in Verkaufsräumen mit einem breiten Sortiment','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.1','47.19',4),
('47.21','Einzelhandel mit Obst, Gemüse und Kartoffeln','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.2','47.21',4),
('47.22','Einzelhandel mit Fleisch und Fleischwaren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.2','47.22',4),
('47.23','Einzelhandel mit Fischen, Krebs- und Weichtieren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.2','47.23',4),
('47.24','Einzelhandel mit Backwaren und Süsswaren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.2','47.24',4),
('47.25','Einzelhandel mit Getränken','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.2','47.25',4),
('47.26','Einzelhandel mit Tabakwaren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.2','47.26',4),
('47.29','Sonstiger Einzelhandel mit Nahrungsmitteln a.n.g.','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.2','47.29',4),
('47.30','Einzelhandel mit Kraftstoffen (Tankstellen)','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.3','47.30',4),
('47.41','Einzelhandel mit Computern, peripheren Einheiten und Software','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.4','47.41',4),
('47.42','Einzelhandel mit Telekommunikationsgeräten','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.4','47.42',4),
('47.43','Einzelhandel mit Geräten der Unterhaltungselektronik','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.4','47.43',4),
('47.51','Einzelhandel mit Textilien','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.5','47.51',4),
('47.52','Einzelhandel mit Metallwaren, Anstrichmitteln und Baustoffen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.5','47.52',4),
('47.53','Einzelhandel mit Teppichen, Gardinen und Fussbodenbelägen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.5','47.53',4),
('47.54','Einzelhandel mit elektrischen Haushaltsgeräten','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.5','47.54',4),
('47.59','Einzelhandel mit Möbeln und Haushaltsgegenständen a.n.g.','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.5','47.59',4),
('47.61','Einzelhandel mit Büchern','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.6','47.61',4),
('47.62','Einzelhandel mit Zeitschriften und Zeitungen sowie Schreibwaren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.6','47.62',4),
('47.63','Einzelhandel mit bespielten Ton- und Bildträgern','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.6','47.63',4),
('47.64','Einzelhandel mit Sport- und Freizeitartikeln','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.6','47.64',4),
('47.65','Einzelhandel mit Spielwaren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.6','47.65',4),
('47.71','Einzelhandel mit Bekleidung','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.7','47.71',4),
('47.72','Einzelhandel mit Schuhen und Lederwaren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.7','47.72',4),
('47.73','Einzelhandel in Apotheken','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.7','47.73',4),
('47.74','Einzelhandel mit medizinischen und orthopädischen Artikeln','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.7','47.74',4),
('47.75','Einzelhandel mit kosmetischen Artikeln und Körperpflegemitteln','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.7','47.75',4),
('47.76','Einzelhandel mit Blumen, Pflanzen, Samen, Heimtieren und -futter','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.7','47.76',4),
('47.77','Einzelhandel mit Uhren und Schmuck','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.7','47.77',4),
('47.78','Sonstiger Einzelhandel mit Waren a.n.g.','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.7','47.78',4),
('47.79','Einzelhandel mit Antiquitäten und Gebrauchtwaren','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.7','47.79',4),
('47.81','Einzelhandel mit Nahrungsmitteln, Getränken und Tabakwaren an Verkaufsständen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.8','47.81',4),
('47.82','Einzelhandel mit Textilien, Bekleidung und Schuhen an Verkaufsständen','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.8','47.82',4),
('47.89','Sonstiger Einzelhandel an Verkaufsständen und auf Märkten','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.8','47.89',4),
('47.91','Einzelhandel über das Internet oder Versandhandel','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.9','47.91',4),
('47.99','Sonstiger Einzelhandel, nicht in Verkaufsräumen a.n.g.','G','Handel/ Instandhaltung und Reparatur von Kraftfahrzeugen','47','47.9','47.99',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION H: Verkehr und Lagerei
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('49','Landverkehr und Transport in Rohrfernleitungen','H','Verkehr und Lagerei','49',NULL,NULL,2),
('50','Schifffahrt','H','Verkehr und Lagerei','50',NULL,NULL,2),
('51','Luftfahrt','H','Verkehr und Lagerei','51',NULL,NULL,2),
('52','Lagerei sowie Erbringung von sonstigen Dienstleistungen für den Verkehr','H','Verkehr und Lagerei','52',NULL,NULL,2),
('53','Post-, Kurier- und Expressdienste','H','Verkehr und Lagerei','53',NULL,NULL,2),
('49.10','Eisenbahnverkehr im Personenfernverkehr','H','Verkehr und Lagerei','49','49.1','49.10',4),
('49.20','Eisenbahnverkehr im Güterverkehr','H','Verkehr und Lagerei','49','49.2','49.20',4),
('49.31','Personenbeförderung im städtischen und regionalen Öffentlichen Nahverkehr','H','Verkehr und Lagerei','49','49.3','49.31',4),
('49.32','Betrieb von Taxis und Mietwagen mit Fahrer','H','Verkehr und Lagerei','49','49.3','49.32',4),
('49.39','Sonstige Personenbeförderung im Landverkehr a.n.g.','H','Verkehr und Lagerei','49','49.3','49.39',4),
('49.41','Güterbeförderung im Strassenverkehr','H','Verkehr und Lagerei','49','49.4','49.41',4),
('49.42','Umzugstransporte','H','Verkehr und Lagerei','49','49.4','49.42',4),
('49.50','Transport in Rohrfernleitungen','H','Verkehr und Lagerei','49','49.5','49.50',4),
('50.10','Personenbeförderung in der See- und Küstenschifffahrt','H','Verkehr und Lagerei','50','50.1','50.10',4),
('50.20','Güterbeförderung in der See- und Küstenschifffahrt','H','Verkehr und Lagerei','50','50.2','50.20',4),
('50.30','Personenbeförderung in der Binnenschifffahrt','H','Verkehr und Lagerei','50','50.3','50.30',4),
('50.40','Güterbeförderung in der Binnenschifffahrt','H','Verkehr und Lagerei','50','50.4','50.40',4),
('51.10','Personenbeförderung in der Luftfahrt','H','Verkehr und Lagerei','51','51.1','51.10',4),
('51.21','Güterbeförderung in der Luftfahrt','H','Verkehr und Lagerei','51','51.2','51.21',4),
('51.22','Raumtransport','H','Verkehr und Lagerei','51','51.2','51.22',4),
('52.10','Lagerei','H','Verkehr und Lagerei','52','52.1','52.10',4),
('52.21','Erbringung von sonstigen Dienstleistungen für den Landverkehr','H','Verkehr und Lagerei','52','52.2','52.21',4),
('52.22','Erbringung von sonstigen Dienstleistungen für die Schifffahrt','H','Verkehr und Lagerei','52','52.2','52.22',4),
('52.23','Erbringung von sonstigen Dienstleistungen für die Luftfahrt','H','Verkehr und Lagerei','52','52.2','52.23',4),
('52.24','Frachtumschlag','H','Verkehr und Lagerei','52','52.2','52.24',4),
('52.29','Spedition und sonstige Dienstleistungen für den Verkehr','H','Verkehr und Lagerei','52','52.2','52.29',4),
('53.10','Öffentliche Postdienste','H','Verkehr und Lagerei','53','53.1','53.10',4),
('53.20','Sonstige Post-, Kurier- und Expressdienste','H','Verkehr und Lagerei','53','53.2','53.20',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION I: Gastgewerbe
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('55','Beherbergung','I','Gastgewerbe / Beherbergung und Gastronomie','55',NULL,NULL,2),
('56','Gastronomie','I','Gastgewerbe / Beherbergung und Gastronomie','56',NULL,NULL,2),
('55.10','Hotels, Gasthöfe und Pensionen','I','Gastgewerbe / Beherbergung und Gastronomie','55','55.1','55.10',4),
('55.20','Ferienunterkünfte und ähnliche Beherbergungsstätten','I','Gastgewerbe / Beherbergung und Gastronomie','55','55.2','55.20',4),
('55.30','Campingplätze','I','Gastgewerbe / Beherbergung und Gastronomie','55','55.3','55.30',4),
('55.90','Sonstige Beherbergung','I','Gastgewerbe / Beherbergung und Gastronomie','55','55.9','55.90',4),
('56.10','Restaurants, Gaststätten, Imbissstuben, Cafés, Eiscafés u.ä.','I','Gastgewerbe / Beherbergung und Gastronomie','56','56.1','56.10',4),
('56.21','Caterer','I','Gastgewerbe / Beherbergung und Gastronomie','56','56.2','56.21',4),
('56.29','Sonstige Verpflegungsdienstleistungen','I','Gastgewerbe / Beherbergung und Gastronomie','56','56.2','56.29',4),
('56.30','Ausschank von Getränken','I','Gastgewerbe / Beherbergung und Gastronomie','56','56.3','56.30',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION J: Information und Kommunikation
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('58','Verlagswesen','J','Information und Kommunikation','58',NULL,NULL,2),
('59','Herstellung, Verleih und Vertrieb von Filmen und Fernsehprogrammen/ Kinos/ Tonstudios','J','Information und Kommunikation','59',NULL,NULL,2),
('60','Rundfunkveranstalter','J','Information und Kommunikation','60',NULL,NULL,2),
('61','Telekommunikation','J','Information und Kommunikation','61',NULL,NULL,2),
('62','Erbringung von Dienstleistungen der Informationstechnologie','J','Information und Kommunikation','62',NULL,NULL,2),
('63','Informationsdienstleistungen','J','Information und Kommunikation','63',NULL,NULL,2),
('58.11','Verlegen von Büchern','J','Information und Kommunikation','58','58.1','58.11',4),
('58.12','Verlegen von Adressbüchern und Verzeichnissen','J','Information und Kommunikation','58','58.1','58.12',4),
('58.13','Verlegen von Zeitungen','J','Information und Kommunikation','58','58.1','58.13',4),
('58.14','Verlegen von Zeitschriften','J','Information und Kommunikation','58','58.1','58.14',4),
('58.19','Sonstiges Verlagswesen','J','Information und Kommunikation','58','58.1','58.19',4),
('58.21','Verlegen von Computerspielen','J','Information und Kommunikation','58','58.2','58.21',4),
('58.29','Verlegen von sonstiger Software','J','Information und Kommunikation','58','58.2','58.29',4),
('59.11','Herstellung von Filmen, Videofilmen und Fernsehprogrammen','J','Information und Kommunikation','59','59.1','59.11',4),
('59.12','Nachbearbeitung und sonstige Filmtechnik','J','Information und Kommunikation','59','59.1','59.12',4),
('59.13','Filmverleih und -vertrieb','J','Information und Kommunikation','59','59.1','59.13',4),
('59.14','Kinos','J','Information und Kommunikation','59','59.1','59.14',4),
('59.20','Tonstudios/ Herstellung von Hörfunkbeiträgen/ Verlegen von Musik','J','Information und Kommunikation','59','59.2','59.20',4),
('60.10','Hörfunkveranstalter','J','Information und Kommunikation','60','60.1','60.10',4),
('60.20','Fernsehveranstalter','J','Information und Kommunikation','60','60.2','60.20',4),
('61.10','Leitungsgebundene Telekommunikation','J','Information und Kommunikation','61','61.1','61.10',4),
('61.20','Drahtlose Telekommunikation','J','Information und Kommunikation','61','61.2','61.20',4),
('61.30','Satellitentelekommunikation','J','Information und Kommunikation','61','61.3','61.30',4),
('61.90','Sonstige Telekommunikation','J','Information und Kommunikation','61','61.9','61.90',4),
('62.01','Entwicklung und Produktion von Software','J','Information und Kommunikation','62','62.0','62.01',4),
('62.02','IT-Beratung','J','Information und Kommunikation','62','62.0','62.02',4),
('62.03','Betrieb von Datenverarbeitungseinrichtungen für Dritte','J','Information und Kommunikation','62','62.0','62.03',4),
('62.09','Sonstige Dienstleistungen der Informationstechnologie','J','Information und Kommunikation','62','62.0','62.09',4),
('63.11','Datenverarbeitung, Hosting und damit verbundene Tätigkeiten','J','Information und Kommunikation','63','63.1','63.11',4),
('63.12','Webportale','J','Information und Kommunikation','63','63.1','63.12',4),
('63.91','Nachrichtenagenturen','J','Information und Kommunikation','63','63.9','63.91',4),
('63.99','Sonstige Informationsdienstleistungen a.n.g.','J','Information und Kommunikation','63','63.9','63.99',4)
ON CONFLICT (code) DO NOTHING;
-- NOGA 2008 Seed Data - Part 2: Sections K-U

-- ============================================================
-- SECTION LEVEL (level=1) - Sections K-U
-- ============================================================
INSERT INTO noga_codes (code, label_de, label_fr, section, section_label_de, division, group_code, class_code, level) VALUES
('K','Erbringung von Finanz- und Versicherungsdienstleistungen','Activités financières et d''assurance','K','Erbringung von Finanz- und Versicherungsdienstleistungen',NULL,NULL,NULL,1),
('L','Grundstücks- und Wohnungswesen','Activités immobilières','L','Grundstücks- und Wohnungswesen',NULL,NULL,NULL,1),
('M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','Activités spécialisées, scientifiques et techniques','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen',NULL,NULL,NULL,1),
('N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','Activités de services administratifs et de soutien','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen',NULL,NULL,NULL,1),
('O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','Administration publique et défense/ sécurité sociale obligatoire','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung',NULL,NULL,NULL,1),
('P','Erziehung und Unterricht','Enseignement','P','Erziehung und Unterricht',NULL,NULL,NULL,1),
('Q','Gesundheits- und Sozialwesen','Santé humaine et action sociale','Q','Gesundheits- und Sozialwesen',NULL,NULL,NULL,1),
('R','Kunst, Unterhaltung und Erholung','Arts, spectacles et activités récréatives','R','Kunst, Unterhaltung und Erholung',NULL,NULL,NULL,1),
('S','Erbringung von sonstigen Dienstleistungen','Autres activités de services','S','Erbringung von sonstigen Dienstleistungen',NULL,NULL,NULL,1),
('T','Private Haushalte mit Hauspersonal/ Herstellung von Waren und Erbringung von Dienstleistungen durch private Haushalte','Activités des ménages en tant qu''employeurs','T','Private Haushalte mit Hauspersonal',NULL,NULL,NULL,1),
('U','Exterritoriale Organisationen und Körperschaften','Activités des organisations et organismes extraterritoriaux','U','Exterritoriale Organisationen und Körperschaften',NULL,NULL,NULL,1)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION K: Finanz- und Versicherungsdienstleistungen
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('64','Erbringung von Finanzdienstleistungen','K','Erbringung von Finanz- und Versicherungsdienstleistungen','64',NULL,NULL,2),
('65','Versicherungen, Rückversicherungen und Pensionskassen','K','Erbringung von Finanz- und Versicherungsdienstleistungen','65',NULL,NULL,2),
('66','Mit Finanz- und Versicherungsdienstleistungen verbundene Tätigkeiten','K','Erbringung von Finanz- und Versicherungsdienstleistungen','66',NULL,NULL,2)
ON CONFLICT (code) DO NOTHING;

INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('64.11','Zentralbankwesen','K','Erbringung von Finanz- und Versicherungsdienstleistungen','64','64.1','64.11',4),
('64.19','Sonstige Währungsintermediation','K','Erbringung von Finanz- und Versicherungsdienstleistungen','64','64.1','64.19',4),
('64.20','Beteiligungsgesellschaften','K','Erbringung von Finanz- und Versicherungsdienstleistungen','64','64.2','64.20',4),
('64.30','Treuhandgesellschaften und Kapitalanlagegesellschaften','K','Erbringung von Finanz- und Versicherungsdienstleistungen','64','64.3','64.30',4),
('64.91','Kreditgewährung','K','Erbringung von Finanz- und Versicherungsdienstleistungen','64','64.9','64.91',4),
('64.92','Sonstige Kreditgewährung','K','Erbringung von Finanz- und Versicherungsdienstleistungen','64','64.9','64.92',4),
('64.99','Sonstige Finanzdienstleistungen a.n.g.','K','Erbringung von Finanz- und Versicherungsdienstleistungen','64','64.9','64.99',4),
('65.11','Lebensversicherung','K','Erbringung von Finanz- und Versicherungsdienstleistungen','65','65.1','65.11',4),
('65.12','Schaden- und Unfallversicherung','K','Erbringung von Finanz- und Versicherungsdienstleistungen','65','65.1','65.12',4),
('65.20','Rückversicherung','K','Erbringung von Finanz- und Versicherungsdienstleistungen','65','65.2','65.20',4),
('65.30','Pensionskassen','K','Erbringung von Finanz- und Versicherungsdienstleistungen','65','65.3','65.30',4),
('66.11','Verwaltung und Betrieb von Wertpapierbörsen','K','Erbringung von Finanz- und Versicherungsdienstleistungen','66','66.1','66.11',4),
('66.12','Wertpapier- und Warenmakler','K','Erbringung von Finanz- und Versicherungsdienstleistungen','66','66.1','66.12',4),
('66.19','Sonstige mit Finanzdienstleistungen verbundene Tätigkeiten','K','Erbringung von Finanz- und Versicherungsdienstleistungen','66','66.1','66.19',4),
('66.21','Risiko- und Schadensbewertung','K','Erbringung von Finanz- und Versicherungsdienstleistungen','66','66.2','66.21',4),
('66.22','Tätigkeit von Versicherungsvertretern','K','Erbringung von Finanz- und Versicherungsdienstleistungen','66','66.2','66.22',4),
('66.29','Sonstige mit Versicherungsdienstleistungen verbundene Tätigkeiten','K','Erbringung von Finanz- und Versicherungsdienstleistungen','66','66.2','66.29',4),
('66.30','Fondsverwaltung','K','Erbringung von Finanz- und Versicherungsdienstleistungen','66','66.3','66.30',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION L: Grundstücks- und Wohnungswesen
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('68','Grundstücks- und Wohnungswesen','L','Grundstücks- und Wohnungswesen','68',NULL,NULL,2),
('68.10','Kauf und Verkauf von eigenen Grundstücken, Gebäuden und Wohnungen','L','Grundstücks- und Wohnungswesen','68','68.1','68.10',4),
('68.20','Vermietung und Verpachtung von eigenen oder geleasten Grundstücken, Gebäuden und Wohnungen','L','Grundstücks- und Wohnungswesen','68','68.2','68.20',4),
('68.31','Vermittlung von Grundstücken, Gebäuden und Wohnungen','L','Grundstücks- und Wohnungswesen','68','68.3','68.31',4),
('68.32','Verwaltung von Grundstücken, Gebäuden und Wohnungen','L','Grundstücks- und Wohnungswesen','68','68.3','68.32',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION M: Freiberufliche, wissenschaftliche und technische Dienstleistungen
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('69','Rechts- und Steuerberatung, Wirtschaftsprüfung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','69',NULL,NULL,2),
('70','Verwaltung und Führung von Unternehmen und Betrieben/ Unternehmensberatung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','70',NULL,NULL,2),
('71','Architektur- und Ingenieurbüros/ technische, physikalische und chemische Untersuchung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','71',NULL,NULL,2),
('72','Forschung und Entwicklung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','72',NULL,NULL,2),
('73','Werbung und Marktforschung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','73',NULL,NULL,2),
('74','Sonstige freiberufliche, wissenschaftliche und technische Tätigkeiten','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','74',NULL,NULL,2),
('75','Veterinärwesen','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','75',NULL,NULL,2)
ON CONFLICT (code) DO NOTHING;

INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('69.10','Rechtsberatung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','69','69.1','69.10',4),
('69.20','Wirtschaftsprüfung und Steuerberatung/ Buchführung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','69','69.2','69.20',4),
('70.10','Verwaltung und Führung von Unternehmen und Betrieben','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','70','70.1','70.10',4),
('70.21','Public-Relations-Beratung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','70','70.2','70.21',4),
('70.22','Unternehmensberatung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','70','70.2','70.22',4),
('71.11','Architektur- und Stadtplanungsbüros','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','71','71.1','71.11',4),
('71.12','Ingenieurbüros und technische Fachplanungen','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','71','71.1','71.12',4),
('71.20','Technische, physikalische und chemische Untersuchung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','71','71.2','71.20',4),
('72.11','Forschung und Entwicklung im Bereich Biotechnologie','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','72','72.1','72.11',4),
('72.19','Sonstige Forschung und Entwicklung im Bereich Natur-, Ingenieur- und Agrarwissenschaften','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','72','72.1','72.19',4),
('72.20','Forschung und Entwicklung im Bereich Rechts-, Wirtschafts- und Sozialwissenschaften','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','72','72.2','72.20',4),
('73.11','Werbeagenturen','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','73','73.1','73.11',4),
('73.12','Vermarktung und Verkauf von Werbezeiten und -flächen','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','73','73.1','73.12',4),
('73.20','Markt- und Meinungsforschung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','73','73.2','73.20',4),
('74.10','Industrielles Design und sonstiges Designwesen','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','74','74.1','74.10',4),
('74.20','Fotografie und fotografische Tätigkeiten','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','74','74.2','74.20',4),
('74.30','Übersetzen und Dolmetschen','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','74','74.3','74.30',4),
('74.90','Sonstige freiberufliche, wissenschaftliche und technische Tätigkeiten a.n.g.','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','74','74.9','74.90',4),
('75.00','Veterinärwesen','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','75','75.0','75.00',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION N: Sonstige wirtschaftliche Dienstleistungen
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('77','Vermietung von beweglichen Sachen','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77',NULL,NULL,2),
('78','Vermittlung und Überlassung von Arbeitskräften','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','78',NULL,NULL,2),
('79','Reisebüros, Reiseveranstalter und Erbringung sonstiger Reservierungsdienstleistungen','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','79',NULL,NULL,2),
('80','Wach- und Sicherheitsdienste sowie Detekteien','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','80',NULL,NULL,2),
('81','Gebäudebetreuung/ Garten- und Landschaftsbau','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','81',NULL,NULL,2),
('82','Erbringung von wirtschaftlichen Dienstleistungen für Unternehmen und Privatpersonen a.n.g.','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','82',NULL,NULL,2)
ON CONFLICT (code) DO NOTHING;

INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('77.11','Vermietung von Personenkraftwagen','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.1','77.11',4),
('77.12','Vermietung von Lkw','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.1','77.12',4),
('77.21','Vermietung von Sport- und Freizeitgeräten','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.2','77.21',4),
('77.22','Vermietung von Videokassetten und DVDs','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.2','77.22',4),
('77.29','Vermietung von sonstigen Gebrauchsgütern','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.2','77.29',4),
('77.31','Vermietung von landwirtschaftlichen Maschinen und Geräten','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.3','77.31',4),
('77.32','Vermietung von Maschinen und Geräten für das Baugewerbe','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.3','77.32',4),
('77.33','Vermietung von Büromaschinen und -einrichtungen','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.3','77.33',4),
('77.34','Vermietung von Wasserfahrzeugen','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.3','77.34',4),
('77.35','Vermietung von Luftfahrzeugen','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.3','77.35',4),
('77.39','Vermietung von sonstigen Maschinen, Geräten und Sachen a.n.g.','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.3','77.39',4),
('77.40','Leasing von nicht finanziellen immateriellen Vermögenswerten','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.4','77.40',4),
('78.10','Vermittlung von Arbeitskräften','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','78','78.1','78.10',4),
('78.20','Befristete Überlassung von Arbeitskräften','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','78','78.2','78.20',4),
('78.30','Sonstige Überlassung von Arbeitskräften','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','78','78.3','78.30',4),
('79.11','Reisebüros','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','79','79.1','79.11',4),
('79.12','Reiseveranstalter','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','79','79.1','79.12',4),
('79.90','Erbringung sonstiger Reservierungsdienstleistungen','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','79','79.9','79.90',4),
('80.10','Private Sicherheitsdienste','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','80','80.1','80.10',4),
('80.20','Sicherheitsdienste mit Überwachung','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','80','80.2','80.20',4),
('80.30','Detekteien','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','80','80.3','80.30',4),
('81.10','Hausmeisterservice und Gebäudebetreuung','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','81','81.1','81.10',4),
('81.21','Allgemeine Gebäudereinigung','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','81','81.2','81.21',4),
('81.22','Spezialisierte Reinigungsarbeiten','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','81','81.2','81.22',4),
('81.29','Sonstige Reinigungstätigkeiten','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','81','81.2','81.29',4),
('81.30','Garten- und Landschaftsbau','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','81','81.3','81.30',4),
('82.11','Allgemeine Sekretariatsdienste','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','82','82.1','82.11',4),
('82.19','Erbringung von sonstigen Büro- und Schreibdiensten','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','82','82.1','82.19',4),
('82.20','Call-Center-Aktivitäten','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','82','82.2','82.20',4),
('82.30','Organisation von Messen, Ausstellungen und Kongressen','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','82','82.3','82.30',4),
('82.91','Inkasso- und Creditbüros','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','82','82.9','82.91',4),
('82.92','Verpackungsgewerbe','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','82','82.9','82.92',4),
('82.99','Erbringung von sonstigen wirtschaftlichen Dienstleistungen a.n.g.','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','82','82.9','82.99',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION O: Öffentliche Verwaltung, Verteidigung/ Sozialversicherung
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('84','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84',NULL,NULL,2),
('84.11','Allgemeine öffentliche Verwaltung','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.1','84.11',4),
('84.12','Öffentliche Verwaltung auf den Gebieten Gesundheit, Bildung, Kultur und soziale Einrichtungen','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.1','84.12',4),
('84.13','Wirtschaftliche Angelegenheiten und Verwaltung der Bereiche Wirtschaft und Energie','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.1','84.13',4),
('84.21','Auswärtige Angelegenheiten','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.2','84.21',4),
('84.22','Verteidigung','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.2','84.22',4),
('84.23','Öffentliche Ordnung und Sicherheit','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.2','84.23',4),
('84.24','Gerichtsbarkeit und Rechtspflege','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.2','84.24',4),
('84.25','Feuerschutz und Katastrophenschutz','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.2','84.25',4),
('84.30','Sozialversicherung','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.3','84.30',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION P: Erziehung und Unterricht
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('85','Erziehung und Unterricht','P','Erziehung und Unterricht','85',NULL,NULL,2),
('85.10','Kindergärten und Vorschulen','P','Erziehung und Unterricht','85','85.1','85.10',4),
('85.20','Grundschulen','P','Erziehung und Unterricht','85','85.2','85.20',4),
('85.31','Weiterführende Schulen des allgemeinbildenden Unterrichts','P','Erziehung und Unterricht','85','85.3','85.31',4),
('85.32','Weiterführende Schulen des beruflichen Unterrichts','P','Erziehung und Unterricht','85','85.3','85.32',4),
('85.41','Berufsschulen und berufliche Gymnasien','P','Erziehung und Unterricht','85','85.4','85.41',4),
('85.42','Hochschulen','P','Erziehung und Unterricht','85','85.4','85.42',4),
('85.51','Sportunterricht und Freizeitunterricht','P','Erziehung und Unterricht','85','85.5','85.51',4),
('85.52','Kulturunterricht','P','Erziehung und Unterricht','85','85.5','85.52',4),
('85.53','Fahrunterricht','P','Erziehung und Unterricht','85','85.5','85.53',4),
('85.59','Sonstiger Unterricht a.n.g.','P','Erziehung und Unterricht','85','85.5','85.59',4),
('85.60','Erbringung von Dienstleistungen für den Unterricht','P','Erziehung und Unterricht','85','85.6','85.60',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION Q: Gesundheits- und Sozialwesen
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('86','Gesundheitswesen','Q','Gesundheits- und Sozialwesen','86',NULL,NULL,2),
('87','Heime (ohne Erholungs- und Ferienheime)','Q','Gesundheits- und Sozialwesen','87',NULL,NULL,2),
('88','Sozialwesen (ohne Heime)','Q','Gesundheits- und Sozialwesen','88',NULL,NULL,2),
('86.10','Krankenhäuser','Q','Gesundheits- und Sozialwesen','86','86.1','86.10',4),
('86.21','Praxen von Allgemeinmedizinern','Q','Gesundheits- und Sozialwesen','86','86.2','86.21',4),
('86.22','Praxen von Fachärzten','Q','Gesundheits- und Sozialwesen','86','86.2','86.22',4),
('86.23','Zahnarztpraxen','Q','Gesundheits- und Sozialwesen','86','86.2','86.23',4),
('86.90','Sonstige Aktivitäten des Gesundheitswesens','Q','Gesundheits- und Sozialwesen','86','86.9','86.90',4),
('87.10','Stationäre Pflegeeinrichtungen','Q','Gesundheits- und Sozialwesen','87','87.1','87.10',4),
('87.20','Einrichtungen zur sozialen Betreuung mit Unterbringung von psychisch Kranken und Suchtkranken','Q','Gesundheits- und Sozialwesen','87','87.2','87.20',4),
('87.30','Einrichtungen zur sozialen Betreuung mit Unterbringung von älteren Menschen und Behinderten','Q','Gesundheits- und Sozialwesen','87','87.3','87.30',4),
('87.90','Sonstige Heime (ohne Erholungs- und Ferienheime)','Q','Gesundheits- und Sozialwesen','87','87.9','87.90',4),
('88.10','Sozialwesen ohne Unterbringung für ältere Menschen und Behinderte','Q','Gesundheits- und Sozialwesen','88','88.1','88.10',4),
('88.91','Tagesbetreuung von Kindern','Q','Gesundheits- und Sozialwesen','88','88.9','88.91',4),
('88.99','Sonstiges Sozialwesen ohne Unterbringung a.n.g.','Q','Gesundheits- und Sozialwesen','88','88.9','88.99',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION R: Kunst, Unterhaltung und Erholung
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('90','Kreative, künstlerische und unterhaltende Tätigkeiten','R','Kunst, Unterhaltung und Erholung','90',NULL,NULL,2),
('91','Bibliotheken, Archive, Museen, botanische und zoologische Gärten','R','Kunst, Unterhaltung und Erholung','91',NULL,NULL,2),
('92','Spiel-, Wett- und Lotteriewesen','R','Kunst, Unterhaltung und Erholung','92',NULL,NULL,2),
('93','Erbringung von Dienstleistungen des Sports, der Unterhaltung und der Erholung','R','Kunst, Unterhaltung und Erholung','93',NULL,NULL,2),
('90.01','Aufführung von darstellenden Künsten','R','Kunst, Unterhaltung und Erholung','90','90.0','90.01',4),
('90.02','Erbringung von Dienstleistungen für die darstellenden Künste','R','Kunst, Unterhaltung und Erholung','90','90.0','90.02',4),
('90.03','Künstlerische und schriftstellerische Tätigkeiten und Darbietungen','R','Kunst, Unterhaltung und Erholung','90','90.0','90.03',4),
('90.04','Betrieb von Theatergebäuden und Konzerthallen','R','Kunst, Unterhaltung und Erholung','90','90.0','90.04',4),
('91.01','Bibliotheken und Archive','R','Kunst, Unterhaltung und Erholung','91','91.0','91.01',4),
('91.02','Betrieb von Museen','R','Kunst, Unterhaltung und Erholung','91','91.0','91.02',4),
('91.03','Betrieb von historischen Stätten und Gebäuden und ähnliche Attraktionen','R','Kunst, Unterhaltung und Erholung','91','91.0','91.03',4),
('91.04','Betrieb von botanischen und zoologischen Gärten sowie Naturparken','R','Kunst, Unterhaltung und Erholung','91','91.0','91.04',4),
('92.00','Spiel-, Wett- und Lotteriewesen','R','Kunst, Unterhaltung und Erholung','92','92.0','92.00',4),
('93.11','Betrieb von Sportanlagen','R','Kunst, Unterhaltung und Erholung','93','93.1','93.11',4),
('93.12','Aktivitäten von Sportvereinen','R','Kunst, Unterhaltung und Erholung','93','93.1','93.12',4),
('93.13','Fitnesszentren','R','Kunst, Unterhaltung und Erholung','93','93.1','93.13',4),
('93.19','Sonstige sportliche Aktivitäten','R','Kunst, Unterhaltung und Erholung','93','93.1','93.19',4),
('93.21','Vergnügungs- und Erholungsparks','R','Kunst, Unterhaltung und Erholung','93','93.2','93.21',4),
('93.29','Sonstige Unterhaltungs- und Erholungsaktivitäten','R','Kunst, Unterhaltung und Erholung','93','93.2','93.29',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION S: Erbringung von sonstigen Dienstleistungen
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('94','Interessenvertretungen sowie kirchliche und sonstige religiöse Vereinigungen','S','Erbringung von sonstigen Dienstleistungen','94',NULL,NULL,2),
('95','Reparatur von Datenverarbeitungsgeräten und Gebrauchsgütern','S','Erbringung von sonstigen Dienstleistungen','95',NULL,NULL,2),
('96','Erbringung von sonstigen überwiegend persönlichen Dienstleistungen','S','Erbringung von sonstigen Dienstleistungen','96',NULL,NULL,2),
('94.11','Wirtschaftsverbände und Arbeitgeberverbände','S','Erbringung von sonstigen Dienstleistungen','94','94.1','94.11',4),
('94.12','Berufsverbände','S','Erbringung von sonstigen Dienstleistungen','94','94.1','94.12',4),
('94.20','Gewerkschaften','S','Erbringung von sonstigen Dienstleistungen','94','94.2','94.20',4),
('94.91','Kirchliche und religiöse Vereinigungen','S','Erbringung von sonstigen Dienstleistungen','94','94.9','94.91',4),
('94.92','Politische Parteien','S','Erbringung von sonstigen Dienstleistungen','94','94.9','94.92',4),
('94.99','Sonstige Interessenvertretungen und Vereinigungen a.n.g.','S','Erbringung von sonstigen Dienstleistungen','94','94.9','94.99',4),
('95.11','Reparatur von Datenverarbeitungsgeräten und peripheren Geräten','S','Erbringung von sonstigen Dienstleistungen','95','95.1','95.11',4),
('95.12','Reparatur von Kommunikationsgeräten','S','Erbringung von sonstigen Dienstleistungen','95','95.1','95.12',4),
('95.21','Reparatur von Unterhaltungselektronik','S','Erbringung von sonstigen Dienstleistungen','95','95.2','95.21',4),
('95.22','Reparatur von Haushaltsgeräten sowie Haus- und Gartengeräten','S','Erbringung von sonstigen Dienstleistungen','95','95.2','95.22',4),
('95.23','Reparatur von Schuhen und Lederwaren','S','Erbringung von sonstigen Dienstleistungen','95','95.2','95.23',4),
('95.24','Reparatur von Möbeln und Einrichtungsgegenständen','S','Erbringung von sonstigen Dienstleistungen','95','95.2','95.24',4),
('95.25','Reparatur von Uhren und Schmuck','S','Erbringung von sonstigen Dienstleistungen','95','95.2','95.25',4),
('95.29','Reparatur von sonstigen Gebrauchsgütern','S','Erbringung von sonstigen Dienstleistungen','95','95.2','95.29',4),
('96.01','Wäscherei und chemische Reinigung','S','Erbringung von sonstigen Dienstleistungen','96','96.0','96.01',4),
('96.02','Frisör- und Kosmetikgewerbe','S','Erbringung von sonstigen Dienstleistungen','96','96.0','96.02',4),
('96.03','Sarg- und Bestattungsgewerbe','S','Erbringung von sonstigen Dienstleistungen','96','96.0','96.03',4),
('96.04','Saunas, Solarien, Bäder und ähnliche Einrichtungen','S','Erbringung von sonstigen Dienstleistungen','96','96.0','96.04',4),
('96.09','Erbringung von sonstigen persönlichen Dienstleistungen a.n.g.','S','Erbringung von sonstigen Dienstleistungen','96','96.0','96.09',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION T: Private Haushalte mit Hauspersonal
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('97','Häusliche Dienste von Privatpersonen','T','Private Haushalte mit Hauspersonal',NULL,NULL,NULL,2),
('98','Herstellung von Waren und Erbringung von Dienstleistungen durch private Haushalte für den Eigenbedarf','T','Private Haushalte mit Hauspersonal',NULL,NULL,NULL,2),
('97.00','Häusliche Dienste von Privatpersonen','T','Private Haushalte mit Hauspersonal','97','97.0','97.00',4),
('98.10','Herstellung von Waren durch private Haushalte für den Eigenbedarf ohne ausgeprägten Schwerpunkt','T','Private Haushalte mit Hauspersonal','98','98.1','98.10',4),
('98.20','Erbringung von Dienstleistungen durch private Haushalte für den Eigenbedarf ohne ausgeprägten Schwerpunkt','T','Private Haushalte mit Hauspersonal','98','98.2','98.20',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION U: Exterritoriale Organisationen und Körperschaften
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('99','Exterritoriale Organisationen und Körperschaften','U','Exterritoriale Organisationen und Körperschaften',NULL,NULL,NULL,2),
('99.00','Exterritoriale Organisationen und Körperschaften','U','Exterritoriale Organisationen und Körperschaften','99','99.0','99.00',4)
ON CONFLICT (code) DO NOTHING;
