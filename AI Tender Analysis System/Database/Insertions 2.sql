-- Sample Albanian Data for Tender Process Automation System

-- MACHINERY DATA (Makineritë)
INSERT INTO machinery (machinery_id, machinery_name, machinery_type, model, serial_number, manufacturer, year_manufactured, capacity, specifications, current_status, location, purchase_date, last_maintenance_date, next_maintenance_date, maintenance_cost) VALUES
(UUID(), 'Ekskavator Hidraulik', 'Ekskavator', 'CAT 320D', 'EXC-2021-001', 'Caterpillar', 2021, '1.2m³', '{"fuqi_motorit": "121 kW", "pesha": "20500 kg", "thellesi_gërmimi": "6.5m"}', 'available', 'Tiranë, Kashar', '2021-03-15', '2024-09-15', '2025-03-15', 2500.00),
(UUID(), 'Buldozer i Rëndë', 'Buldozer', 'Komatsu D65EX', 'BUL-2020-002', 'Komatsu', 2020, '3.8m³', '{"fuqi_motorit": "155 kW", "pesha": "19800 kg", "gjerësia_shiriti": "560mm"}', 'in_use', 'Durrës, Porto Romano', '2020-06-20', '2024-10-01', '2025-04-01', 3200.00),
(UUID(), 'Kamion Damper 6x4', 'Kamion', 'Mercedes Actros 3340', 'KAM-2022-003', 'Mercedes-Benz', 2022, '18m³', '{"fuqi_motorit": "290 kW", "ngarkesa_max": "33000 kg", "volumi_kufize": "18m³"}', 'available', 'Tiranë, Kombinat', '2022-01-10', '2024-11-05', '2025-05-05', 1800.00),
(UUID(), 'Rulo Kompaktues Asfalt', 'Rulo', 'BOMAG BW 213 DH-5', 'RUL-2019-004', 'BOMAG', 2019, '13 tonë', '{"pesha_operative": "13000 kg", "gjerësia_cilindrit": "2130mm", "frekuenca_vibrimit": "30-60 Hz"}', 'maintenance', 'Vlorë, Skelë', '2019-08-15', '2024-10-20', '2024-12-20', 2100.00),
(UUID(), 'Mikser Betoni 10m³', 'Mikser', 'Schwing Stetter C3', 'MIK-2021-005', 'Schwing Stetter', 2021, '10m³', '{"kapaciteti_betoni": "10m³", "koha_përzierjes": "60s", "fuqi_motorit": "37 kW"}', 'available', 'Shkodër, Kodra e Diellit', '2021-05-12', '2024-08-30', '2025-02-28', 1500.00),
(UUID(), 'Vinç Kulla QTZ80', 'Vinç', 'Zoomlion QTZ80', 'VIN-2020-006', 'Zoomlion', 2020, '8 tonë', '{"ngarkesa_max": "8000 kg", "rrezja_max": "60m", "lartësia_max": "120m"}', 'in_use', 'Tiranë, Rruga e Kavajës', '2020-09-25', '2024-09-01', '2025-03-01', 4500.00),
(UUID(), 'Generator Elektrik 250kVA', 'Generator', 'Perkins 250kVA', 'GEN-2022-007', 'Perkins', 2022, '250 kVA', '{"fuqi_nominale": "250 kVA", "voltazhi": "400V", "frekuenca": "50Hz"}', 'available', 'Fier, Patos', '2022-02-18', '2024-10-15', '2025-04-15', 800.00),
(UUID(), 'Pompë Betoni Stacionare', 'Pompë', 'Putzmeister BSA 2110', 'POM-2021-008', 'Putzmeister', 2021, '110m³/h', '{"kapaciteti_pompimi": "110m³/h", "presioni_max": "8.5 MPa", "distanca_horizontale": "300m"}', 'available', 'Korçë, Qendër', '2021-07-22', '2024-09-25', '2025-03-25', 2800.00);

INSERT INTO machinery (
    machinery_id, machinery_name, machinery_type, model, serial_number, manufacturer,
    year_manufactured, capacity, specifications, current_status, location,
    purchase_date, last_maintenance_date, next_maintenance_date, maintenance_cost
) VALUES
(UUID(), 'Kamioncine', 'Kamion', 'IVECO Daily', 'KAM-2020-001', 'IVECO', 2020, 'Copë 2',
 '{"karroceri": "6m³", "fuqi_motorit": "95 kW", "ngarkesa_max": "3500 kg"}',
 'available', 'Tiranë, Kashar', '2020-02-10', '2024-09-15', '2025-03-15', 1200.00),

(UUID(), 'Kamion me Vinç', 'Kamion me pajisje ngritëse', 'MAN TGS 33.400', 'KAM-2019-002', 'MAN', 2019, 'Copë 2',
 '{"kapacitet_vinci": "10 ton", "rrezja_max": "20m", "fuqi_motorit": "290 kW"}',
 'in_use', 'Durrës, Porto Romano', '2019-06-25', '2024-08-20', '2025-02-20', 2200.00),

(UUID(), 'Fadrome me Goma', 'Fadrome', 'CAT 950H', 'FAD-2021-003', 'Caterpillar', 2021, 'Copë 2',
 '{"kapacitet_lopate": "3.2m³", "pesha": "18000 kg", "fuqi_motorit": "150 kW"}',
 'available', 'Elbasan, Metalurgjiku', '2021-03-10', '2024-09-10', '2025-03-10', 2600.00),

(UUID(), 'Greider', 'Makineri Niveliuese', 'John Deere 672G', 'GRE-2020-004', 'John Deere', 2020, 'Copë 2',
 '{"gjerësia_blades": "3.7m", "fuqi_motorit": "200 kW", "pesha": "18000 kg"}',
 'in_use', 'Shkodër, Koplik', '2020-09-01', '2024-10-05', '2025-04-05', 3100.00),

(UUID(), 'Autobot Uji', 'Cisternë Uji', 'Mercedes Axor 1833', 'AUT-2018-005', 'Mercedes-Benz', 2018, 'Copë 2',
 '{"kapacitet": "12000L", "fuqi_motorit": "240 kW", "sistemi_spërkatës": "hidraulik"}',
 'available', 'Vlorë, Skelë', '2018-04-14', '2024-09-25', '2025-03-25', 1700.00),

(UUID(), 'Autobetoniere', 'Mikser Betoni', 'Schwing Stetter F8', 'BET-2021-006', 'Schwing Stetter', 2021, 'Copë 4',
 '{"kapaciteti_betoni": "8m³", "fuqi_motorit": "210 kW", "shpejtësia_rrotullimit": "14 rpm"}',
 'in_use', 'Korçë, Maliq', '2021-05-18', '2024-09-30', '2025-03-30', 2000.00),

(UUID(), 'Autopompe Betoni', 'Pompë Betoni', 'Putzmeister M46-5', 'POM-2020-007', 'Putzmeister', 2020, 'Copë 2',
 '{"kapaciteti_pompimi": "120m³/h", "distanca_horizontale": "200m", "presioni_max": "8 MPa"}',
 'available', 'Tiranë, Laprakë', '2020-08-21', '2024-10-10', '2025-04-10', 2800.00),

(UUID(), 'Rrul Gome-Hekur', 'Rulo', 'BOMAG BW 177 D-5', 'RUL-2019-008', 'BOMAG', 2019, 'Copë 2',
 '{"pesha": "7700 kg", "gjerësia_cilindrit": "1680mm", "frekuenca_vibrimit": "45 Hz"}',
 'maintenance', 'Fier, Patos', '2019-07-19', '2024-09-22', '2025-03-22', 1900.00),

(UUID(), 'Vinç me kapacitet 50 ton', 'Vinç', 'Liebherr LTM 1050-3.1', 'VIN-2021-009', 'Liebherr', 2021, 'Copë 2',
 '{"kapacitet_max": "50 ton", "rrezja_max": "38m", "fuqi_motorit": "260 kW"}',
 'in_use', 'Tiranë, Kombinat', '2021-10-05', '2024-11-01', '2025-05-01', 4300.00),

(UUID(), 'Fabrikë Betoni', 'Fabrikë', 'MEKA MB-60W', 'FAB-2022-010', 'MEKA', 2022, 'Copë 1',
 '{"kapaciteti_prodhimit": "60m³/h", "leje_mjedisore": "III.1.B", "sistemi_kontrollit": "PLC"}',
 'available', 'Durrës, Spitallë', '2022-04-12', '2024-09-10', '2025-03-10', 5000.00),

(UUID(), 'Fabrikë Asfalti', 'Fabrikë', 'AMMANN ABA 210', 'ASF-2021-011', 'AMMANN', 2021, 'Copë 1',
 '{"kapaciteti_prodhimit": "210 ton/h", "leje_mjedisore": "III.1.B", "temperatura_max": "180°C"}',
 'in_use', 'Lushnje, Plug', '2021-09-14', '2024-08-28', '2025-02-28', 5200.00),

(UUID(), 'Nyje Inerte', 'Impjant Përpunimi Inertesh', 'METSO LT1213', 'INR-2020-012', 'Metso', 2020, 'Copë 1',
 '{"kapaciteti_përpunimit": "250 ton/h", "leje_mjedisore": "III.1.B", "pesha": "48000 kg"}',
 'available', 'Berat, Ura Vajgurore', '2020-11-10', '2024-09-18', '2025-03-18', 4000.00);

-- EMPLOYEES DATA (Punonjësit)
INSERT INTO employees (employee_id, first_name, last_name, email, phone, position, department, specialization, years_experience, certifications, languages_spoken, current_status, hire_date, salary, availability_start_date, availability_end_date) VALUES
(UUID(), 'Arben', 'Hoxha', 'arben.hoxha@company.al', '+355 69 123 4567', 'Inxhinier Civil Kryesor', 'Inxhinieri', '["ndërtim urave", "rrugë", "menaxhim projekti"]', 15, '["PE Albania", "Project Management Professional", "ISO 9001 Lead Auditor"]', '["Shqip", "Anglisht", "Italisht"]', 'available', '2010-03-15', 2500.00, '2024-11-01', NULL),
(UUID(), 'Elvira', 'Shehu', 'elvira.shehu@company.al', '+355 69 234 5678', 'Arkitekte', 'Dizajn', '["dizajn arkitekturor", "planifikim urban", "AutoCAD"]', 10, '["Anëtare e Urdhrit të Arkitektëve", "LEED Green Associate"]', '["Shqip", "Anglisht", "Greqisht"]', 'available', '2014-06-20', 2200.00, '2024-11-01', NULL),
(UUID(), 'Gentian', 'Kola', 'gentian.kola@company.al', '+355 69 345 6789', 'Inxhinier Elektrik', 'Inxhinieri', '["instalime elektrike", "sisteme të ulëta tensioni", "panele solare"]', 8, '["Certifikatë Profesionale Elektrik", "Photovoltaic System Design"]', '["Shqip", "Anglisht"]', 'in_project', '2016-09-10', 1900.00, '2025-01-15', NULL),
(UUID(), 'Miranda', 'Gjoka', 'miranda.gjoka@company.al', '+355 69 456 7890', 'Specialiste Tenderash', 'Prokurimi', '["analiza tenderësh", "hartim propozimesh", "ligje prokurimi publik"]', 12, '["Certified Public Procurement Professional", "EU Procurement Expert"]', '["Shqip", "Anglisht", "Italisht", "Frëngjisht"]', 'available', '2012-04-05', 2100.00, '2024-11-01', NULL),
(UUID(), 'Besnik', 'Dervishi', 'besnik.dervishi@company.al', '+355 69 567 8901', 'Menaxher Projekti', 'Menaxhim', '["menaxhim ndërtimi", "planifikim", "kontroll koste"]', 18, '["PMP", "Prince2 Practitioner", "Construction Management"]', '["Shqip", "Anglisht", "Gjermanisht"]', 'in_project', '2008-01-12', 2800.00, '2024-12-20', NULL),
(UUID(), 'Klaudia', 'Marku', 'klaudia.marku@company.al', '+355 69 678 9012', 'Inxhiniere Mjedisi', 'Inxhinieri', '["menaxhim mjedisi", "vlerësim ndikimi", "sisteme trajtimi ujërave"]', 7, '["Environmental Impact Assessment", "ISO 14001 Lead Auditor"]', '["Shqip", "Anglisht"]', 'available', '2017-11-18', 1800.00, '2024-11-01', NULL),
(UUID(), 'Dritan', 'Muça', 'dritan.muca@company.al', '+355 69 789 0123', 'Inxhinier Gjeologu', 'Inxhinieri', '["gjeologji inxhinierike", "sondazhe", "studime gjeoteknike"]', 13, '["Professional Geologist", "Geotechnical Investigation Specialist"]', '["Shqip", "Anglisht", "Italisht"]', 'available', '2011-07-22', 2000.00, '2024-11-01', NULL),
(UUID(), 'Emanuela', 'Basha', 'emanuela.basha@company.al', '+355 69 890 1234', 'Kontabiliste Kryesore', 'Financë', '["kontabilitet kosto", "raportim financiar", "auditim"]', 11, '["CPA Albania", "Certified Management Accountant"]', '["Shqip", "Anglisht"]', 'available', '2013-03-08', 1700.00, '2024-11-01', NULL);

-- PROJECTS DATA (Projektet)
INSERT INTO projects (project_id, project_name, project_type, client_name, start_date, end_date, estimated_end_date, budget, actual_cost, status, description, location, project_manager_id) VALUES
(UUID(), 'Rikonstruksion i Rrugës Tiranë-Elbasan, Segmenti km 25-35', 'Infrastrukturë Rrugore', 'Autoriteti Rrugor Shqiptar', '2023-04-15', NULL, '2025-10-30', 4500000.00, 2800000.00, 'in_progress', 'Rikonstruksion i plotë i segmentit rrugor 10 km me zgjerim në 4 korsi, ndërtim urave mbitëkalimet dhe sistemet e drenimit', 'Tiranë-Elbasan, Segmenti km 25-35', (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al')),
(UUID(), 'Ndërtim i Shkollës 9-Vjeçare "Luigj Gurakuqi"', 'Ndërtim Objekti Publik', 'Bashkia Shkodër', '2023-09-01', '2024-06-30', '2024-06-30', 1200000.00, 1150000.00, 'completed', 'Ndërtim i shkollës 3-katëshe me 24 klasë, laboratorë, palestër dhe fushë sporti', 'Shkodër, Lagjja "13 Dhjetori"', (SELECT employee_id FROM employees WHERE email = 'arben.hoxha@company.al')),
(UUID(), 'Rehabilitim i Rrjetit të Ujësjellësit Qyteti i Korçës', 'Infrastrukturë Ujësjellës-Kanalizime', 'Ujësjellës Kanalizime Korçë', '2024-02-10', NULL, '2025-08-15', 2800000.00, 1200000.00, 'in_progress', 'Zëvendësim i tubacioneve të amortizuara, ndërtim rezervuarësh të rinj dhe instalim i sistemit SCADA', 'Korçë, Zona Qendrore dhe Periferi', (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al')),
(UUID(), 'Ndërtim i Portit të Peshkimit Vlorë', 'Infrastrukturë Detare', 'Ministria e Infrastrukturës', '2022-11-20', '2024-05-30', '2024-05-30', 3500000.00, 3450000.00, 'completed', 'Ndërtim i portit të peshkimit me skelë 200m, magazina frigorifere dhe sistem trajtimi ujërave', 'Vlorë, Zona e Skelës', (SELECT employee_id FROM employees WHERE email = 'arben.hoxha@company.al')),
(UUID(), 'Rikualifikim Urban i Bulevardeve Kryesore Tiranë', 'Infrastrukturë Urbane', 'Bashkia Tiranë', '2024-05-01', NULL, '2025-04-30', 5200000.00, 2100000.00, 'in_progress', 'Rikualifikim i 5 bulevardeve me trotuare, korsi biçikletash, gjelbërim dhe ndriçim LED', 'Tiranë, Bulevardi "Dëshmorët e Kombit" dhe Bulevardi "Zogu i Parë"', (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'));

-- TENDER DOCUMENTS DATA (Dokumentet e Tenderit)
INSERT INTO tender_documents (tender_id, tender_number, tender_title, issuing_authority, publication_date, submission_deadline, language, document_path, raw_text, processed_text, status, estimated_value, currency) VALUES
(UUID(), 'REF-45782/2024', 'Ndërtim i Urës mbi Lumin Shkumbin, Segmenti Librazhd-Elbasan', 'Autoriteti Rrugor Shqiptar (ARRSH)', '2024-10-15', '2024-12-15', 'albanian', '/tenders/2024/ref_45782.pdf', 
'NJOFTIM PER TENDER\n\nObjekti i Prokurimit: Ndërtim i Urës mbi Lumin Shkumbin në aksin rrugor Librazhd-Elbasan\n\nAutoriteti Kontraktor: Autoriteti Rrugor Shqiptar (ARRSH)\n\nVlera e Përafërt e Kontratës: 8,500,000 EUR\n\nPËRSHKRIM I PUNIMEVE:\n1. Ndërtim ure beton-armeje me gjatësi 180m dhe gjerësi 12m\n2. Dy korsi për autovetura + korsi emergjence\n3. Fundamente të thella me pila betoni\n4. Sistem drenazhi dhe hidroizolimi\n5. Barriera mbrojtëse dhe ndriçim\n\nKËRKESA TEKNIKE:\n- Eksperiencë minimale 10 vjet në ndërtim uresh\n- Projekte të ngjashme me vlerë mbi 5 milionë EUR\n- Inxhinierë civilë të licencuar (min. 3)\n- Certifikatë ISO 9001, ISO 14001\n- Makineritë: ekskavatorë, vinça, mikserë betoni, pompë betoni\n\nAFATI I ZBATIMIT: 24 muaj nga nënshkrimi i kontratës\n\nGARANCIA E OFERTËS: 2% e vlerës së ofertës\nGARANCIA E KONTRATËS: 10% e vlerës së kontratës\n\nDOKUMENTACIONI I KËRKUAR:\n- Certifikata tatimore dhe sigurimesh shoqërore\n- Pasqyra financiare 3 vjet të fundit\n- Lista e projekteve të realizuara\n- CV e stafit teknik\n- Lista e mjeteve dhe pajisjeve\n- Certifikata ISO\n- Licenca profesionale',
'Tender për ndërtim ure mbi Shkumbin. Vlera 8.5M EUR. Kërkohet eksperiencë 10 vjet, projekte mbi 5M EUR, 3 inxhinierë civilë, ISO 9001/14001, ekskavatorë, vinça, mikserë, pompë betoni. Afat: 24 muaj. Garanci: 2% ofertë, 10% kontratë.',
'under_review', 8500000.00, 'EUR'),

(UUID(), 'APP-23456/2024', 'Furnizim dhe Instalim i Sistemit të Trajtimit të Ujërave të Zeza për Bashkinë Korçë', 'Bashkia Korçë', '2024-10-20', '2024-12-20', 'albanian', '/tenders/2024/app_23456.pdf',
'FTESË PËR TENDER TË HAPUR\n\nObjekti: Furnizim, Instalim dhe Vënie në Punë e Stacionit të Trajtimit të Ujërave të Zeza\n\nAutoriteti Kontraktor: Bashkia Korçë\n\nVlera e Përafërt: 3,200,000 EUR\n\nPËRSHKRIM:\n- Stacion trajtimi kapacitet 15,000 m³/ditë\n- Sistem trajtimi primar, sekondar dhe terciar\n- Teknologji moderne me efikasitet energjitik\n- Laborator kontrolli dhe sistem monitorimi\n- Trajnim i personelit operativ\n\nKËRKESAT:\n- Eksperiencë në instalime të ngjashme (min. 3 projekte)\n- Inxhinierë mjedisi dhe hidraulikë (min. 2)\n- Certifikata ISO 14001, ISO 9001\n- Përvojë me teknologjitë e trajtimit biologjik\n- Garancion ekuipmentesh min. 5 vjet\n\nMAKINERITË E NEVOJSHME:\n- Ekskavatorë për gërmime\n- Vinça për montazh\n- Pajisje saldimi dhe instalimi\n\nAFATI ZBATIMIT: 18 muaj\n\nKRITERET E VLERËSIMIT:\n1. Çmimi (40 pikë)\n2. Eksperienca teknike (30 pikë)\n3. Teknologjia e propozuar (20 pikë)\n4. Koha e zbatimit (10 pikë)',
'Tender trajtim ujërash Korçë. 3.2M EUR. Kapacitet 15,000 m³/ditë. Kërkohet 3 projekte të ngjashme, 2 inxhinierë, ISO 14001/9001, garancion 5 vjet. Makineritë: ekskavatorë, vinça. Afat: 18 muaj. Vlerësim: çmim 40%, eksperiencë 30%, teknologji 20%, kohë 10%.',
'new', 3200000.00, 'EUR'),

(UUID(), 'INF-78901/2024', 'Rikonstruksion i Rrugës Durrës-Kavajë, Lot 2', 'Ministria e Infrastrukturës dhe Energjisë', '2024-10-25', '2025-01-10', 'albanian', '/tenders/2024/inf_78901.pdf',
'TENDER I HAPUR KOMBËTAR\n\nObjekti: Rikonstruksion i Rrugës Nacionale Durrës-Kavajë, Segmenti km 15-28 (Lot 2)\n\nAutoriteti: Ministria e Infrastrukturës dhe Energjisë\n\nVlera: 6,800,000 EUR\n\nPUNIMET PËRFSHIJNË:\n1. Frezim i shtresës ekzistuese të asfaltit (13 km)\n2. Shtrim i shtresave të reja bazë dhe lidhëse\n3. Asfaltim me sipërfaqe 78,000 m²\n4. Ndërtim i dy urave betoni (gjatësi 45m dhe 38m)\n5. Sistem drenazhi dhe sinjalistikë\n6. Ndriçim LED i plotë\n\nKËRKESAT TEKNIKE:\n- Eksperiencë min. 15 vjet në rikonstruksion rrugësh\n- Projekte rrugësh me gjatësi min. 10 km (min. 2 projekte)\n- Certifikatë CE për asfaltin\n- ISO 9001:2015, ISO 14001:2015, ISO 45001:2018\n\nSTAFI I KËRKUAR:\n- Menaxher projekti me eksperiencë min. 10 vjet\n- Inxhinier rrugor (min. 2)\n- Inxhinier gjeologu\n- Teknologë asfaltimi (min. 3)\n\nMAKINERITË:\n- Finisher asfaltimi (min. 2)\n- Rulo kompaktues (min. 3)\n- Kamionë damperë (min. 8)\n- Ekskavatorë (min. 3)\n- Buldozerë (min. 2)\n- Mikser asfalt\n\nAFATI: 20 muaj',
'Tender rikonstruksion rrugë Durrës-Kavajë 13 km. 6.8M EUR. Frezim, asfaltim 78,000 m², 2 ura betoni, drenazh, ndriçim LED. Kërkohet 15 vjet eksperiencë, 2 projekte 10+ km, CE asfalti, ISO 9001/14001/45001. Stafi: menaxher 10 vjet, 2 inxhinierë rrugorë, gjeologu, 3 teknologë. Makineritë: 2 finisher, 3 rulo, 8 kamionë, 3 ekskavatorë, 2 buldozerë, mikser. Afat: 20 muaj.',
'new', 6800000.00, 'EUR');

-- TENDER REQUIREMENTS DATA (Kërkesat e Tenderit)
INSERT INTO tender_requirements (requirement_id, tender_id, requirement_type, requirement_category, requirement_text, extracted_text, parsed_requirements, priority, is_mandatory, compliance_status) VALUES
(UUID(), (SELECT tender_id FROM tender_documents WHERE tender_number = 'REF-45782/2024'), 'technical', 'eksperiencë', 'Eksperiencë minimale 10 vjet në ndërtim uresh', 'Kontraktuesi duhet të ketë të paktën 10 vjet eksperiencë në ndërtim uresh të ngjashme', '{"years_required": 10, "specialization": "ndërtim uresh", "type": "minimum_experience"}', 'high', TRUE, 'pending'),

(UUID(), (SELECT tender_id FROM tender_documents WHERE tender_number = 'REF-45782/2024'), 'technical', 'projekte të kaluara', 'Projekte të ngjashme me vlerë mbi 5 milionë EUR', 'Duhet të ketë realizuar të paktën 2 projekte ndërtimi uresh me vlerë kontrate mbi 5,000,000 EUR', '{"min_projects": 2, "min_value_per_project": 5000000, "currency": "EUR", "project_type": "ura"}', 'high', TRUE, 'pending'),

(UUID(), (SELECT tender_id FROM tender_documents WHERE tender_number = 'REF-45782/2024'), 'technical', 'staf', 'Inxhinierë civilë të licencuar (min. 3)', 'Kontraktuesi duhet të disponojë minimalisht 3 inxhinierë civilë me licencë profesionale aktive', '{"required_count": 3, "position": "inxhinier civil", "license_required": true}', 'high', TRUE, 'pending'),

(UUID(), (SELECT tender_id FROM tender_documents WHERE tender_number = 'REF-45782/2024'), 'technical', 'certifikata', 'Certifikatë ISO 9001, ISO 14001', 'Kontraktuesi duhet të ketë certifikata ISO 9001:2015 dhe ISO 14001:2015 në fuqi', '{"certifications": ["ISO 9001:2015", "ISO 14001:2015"], "status_required": "aktive"}', 'medium', TRUE, 'pending'),

(UUID(), (SELECT tender_id FROM tender_documents WHERE tender_number = 'REF-45782/2024'), 'technical', 'makineritë', 'Ekskavatorë, vinça, mikserë betoni, pompë betoni', 'Disponueshmëria e ekskavatorëve hidraulikë, vinçave kulla, mikserëve të betonit dhe pompave betoni', '{"machinery": ["ekskavator hidraulik", "vinç kulla", "mikser betoni", "pompë betoni"], "ownership": "të disponueshme"}', 'high', TRUE, 'pending'),

(UUID(), (SELECT tender_id FROM tender_documents WHERE tender_number = 'APP-23456/2024'), 'technical', 'eksperiencë', 'Eksperiencë në instalime të ngjashme (min. 3 projekte)', 'Kontraktuesi duhet të ketë eksperiencë me minimalisht 3 projekte instalimesh stacionesh trajtimi ujërash', '{"min_projects": 3, "project_type": "stacion trajtimi ujërash", "type": "minimum_experience"}', 'high', TRUE, 'pending'),

(UUID(), (SELECT tender_id FROM tender_documents WHERE tender_number = 'APP-23456/2024'), 'technical', 'staf', 'Inxhinierë mjedisi dhe hidraulikë (min. 2)', 'Disponueshmëria e të paktën 2 inxhinierëve të specializuar në inxhinieri mjedisi ose hidraulikë', '{"required_count": 2, "specializations": ["inxhinier mjedisi", "inxhinier hidraulik"], "license_required": true}', 'high', TRUE, 'pending'),

(UUID(), (SELECT tender_id FROM tender_documents WHERE tender_number = 'INF-78901/2024'), 'technical', 'eksperiencë', 'Eksperiencë min. 15 vjet në rikonstruksion rrugësh', 'Kontraktuesi duhet të ketë eksperiencë minimale 15 vjet në fushën e rikonstruksionit të rrugëve', '{"years_required": 15, "specialization": "rikonstruksion rrugësh", "type": "minimum_experience"}', 'high', TRUE, 'pending'),

(UUID(), (SELECT tender_id FROM tender_documents WHERE tender_number = 'INF-78901/2024'), 'technical', 'makineritë', 'Finisher asfaltimi (min. 2), Rulo kompaktues (min. 3), Kamionë damperë (min. 8)', 'Disponimi i makinerive: 2 finisher asfaltimi, 3 rulo kompaktues, 8 kamionë damperë, 3 ekskavatorë, 2 buldozerë', '{"machinery": [{"type": "finisher asfaltimi", "count": 2}, {"type": "rulo kompaktues", "count": 3}, {"type": "kamion damper", "count": 8}, {"type": "ekskavator", "count": 3}, {"type": "buldozer", "count": 2}]}', 'high', TRUE, 'pending'),

(UUID(), (SELECT tender_id FROM tender_documents WHERE tender_number = 'INF-78901/2024'), 'technical', 'certifikata', 'ISO 9001:2015, ISO 14001:2015, ISO 45001:2018', 'Kontraktuesi duhet të zotërojë certifikata ISO 9001:2015, ISO 14001:2015 dhe ISO 45001:2018 në fuqi', '{"certifications": ["ISO 9001:2015", "ISO 14001:2015", "ISO 45001:2018"], "status_required": "aktive"}', 'medium', TRUE, 'pending');

-- PROJECT-MACHINERY ASSIGNMENTS (Caktime Makinerish në Projekte)
INSERT INTO project_machinery (assignment_id, project_id, machinery_id, assignment_start_date, assignment_end_date, usage_hours, cost, notes) VALUES
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), (SELECT machinery_id FROM machinery WHERE machinery_name = 'Ekskavator Hidraulik'), '2023-04-20', '2024-10-30', 1250.5, 62525.00, 'Përdorur për gërmime dhe ngarkime toke'),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), (SELECT machinery_id FROM machinery WHERE machinery_name = 'Buldozer i Rëndë'), '2023-04-20', '2024-09-15', 980.0, 49000.00, 'Përdorur për nivelim dhe kompaktim'),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Ujësjellësit Qyteti i Korçës%'), (SELECT machinery_id FROM machinery WHERE machinery_name = 'Ekskavator Hidraulik'), '2024-02-15', NULL, 456.0, 22800.00, 'Gërmime për tubacione');

-- PROJECT-EMPLOYEE ASSIGNMENTS (Caktime Punonjësish në Projekte)
INSERT INTO project_employees (assignment_id, project_id, employee_id, role, assignment_start_date, assignment_end_date, allocation_percentage, hourly_rate, total_hours) VALUES
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 'Menaxher Projekti', '2023-04-15', NULL, 100.00, 45.00, 2840.0),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), (SELECT employee_id FROM employees WHERE email = 'arben.hoxha@company.al'), 'Inxhinier Civil Kryesor', '2023-04-15', NULL, 80.00, 40.00, 2100.0),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), (SELECT employee_id FROM employees WHERE email = 'dritan.muca@company.al'), 'Inxhinier Gjeologu', '2023-05-01', '2023-08-30', 50.00, 35.00, 680.0),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Shkollës 9-Vjeçare%'), (SELECT employee_id FROM employees WHERE email = 'arben.hoxha@company.al'), 'Menaxher Projekti', '2023-09-01', '2024-06-30', 100.00, 42.00, 1680.0),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Shkollës 9-Vjeçare%'), (SELECT employee_id FROM employees WHERE email = 'elvira.shehu@company.al'), 'Arkitekte Kryesore', '2023-09-01', '2024-06-30', 60.00, 38.00, 1100.0),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Ujësjellësit Qyteti i Korçës%'), (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 'Menaxher Projekti', '2024-02-10', NULL, 100.00, 45.00, 1450.0),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Ujësjellësit Qyteti i Korçës%'), (SELECT employee_id FROM employees WHERE email = 'klaudia.marku@company.al'), 'Inxhiniere Mjedisi', '2024-02-10', NULL, 70.00, 32.00, 980.0),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Portit të Peshkimit%'), (SELECT employee_id FROM employees WHERE email = 'arben.hoxha@company.al'), 'Menaxher Projekti', '2022-11-20', '2024-05-30', 100.00, 40.00, 2450.0),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Portit të Peshkimit%'), (SELECT employee_id FROM employees WHERE email = 'dritan.muca@company.al'), 'Inxhinier Gjeologu', '2022-11-20', '2023-03-15', 80.00, 33.00, 520.0),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Bulevardeve Kryesore%'), (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 'Menaxher Projekti', '2024-05-01', NULL, 100.00, 45.00, 1120.0),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Bulevardeve Kryesore%'), (SELECT employee_id FROM employees WHERE email = 'elvira.shehu@company.al'), 'Arkitekte/Dizajnere', '2024-05-01', NULL, 50.00, 38.00, 560.0),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Bulevardeve Kryesore%'), (SELECT employee_id FROM employees WHERE email = 'gentian.kola@company.al'), 'Inxhinier Elektrik', '2024-06-15', NULL, 60.00, 35.00, 420.0);

-- REQUIREMENT COMPLIANCE DATA (Të Dhënat e Përputhshmërisë së Kërkesave)
INSERT INTO requirement_compliance (compliance_id, requirement_id, resource_type, resource_id, compliance_score, compliance_notes, verified_by) VALUES
-- Compliance for REF-45782/2024 (Ura mbi Shkumbin)
(UUID(), 
 (SELECT requirement_id FROM tender_requirements WHERE requirement_text LIKE '%10 vjet në ndërtim uresh%'), 
 'employee', 
 (SELECT employee_id FROM employees WHERE email = 'arben.hoxha@company.al'), 
 95.00, 
 'Arben Hoxha ka 15 vjet eksperiencë në ndërtim uresh dhe infrastrukture. Ka drejtuar projektin e Portit të Peshkimit Vlorë që përfshin ndërtim skeleje dhe struktura detare.',
 (SELECT employee_id FROM employees WHERE email = 'miranda.gjoka@company.al')),

(UUID(), 
 (SELECT requirement_id FROM tender_requirements WHERE requirement_text LIKE '%Projekte të ngjashme me vlerë mbi 5 milionë EUR%'), 
 'project', 
 (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 
 90.00, 
 'Projekti i Rrugës Tiranë-Elbasan ka vlerë 4.5M EUR dhe përfshin ndërtim urave. Projekti i Portit Vlorë ka vlerë 3.5M EUR. Së bashku plotësojnë kërkesën.',
 (SELECT employee_id FROM employees WHERE email = 'miranda.gjoka@company.al')),

(UUID(), 
 (SELECT requirement_id FROM tender_requirements WHERE requirement_text LIKE '%Inxhinierë civilë të licencuar (min. 3)%'), 
 'employee', 
 (SELECT employee_id FROM employees WHERE email = 'arben.hoxha@company.al'), 
 100.00, 
 'Disponohen 3 inxhinierë civilë të licencuar: Arben Hoxha (PE Albania), Besnik Dervishi (PMP, Construction Management), dhe mund të rekrutohet i treti për projektin.',
 (SELECT employee_id FROM employees WHERE email = 'miranda.gjoka@company.al')),

(UUID(), 
 (SELECT requirement_id FROM tender_requirements WHERE requirement_text LIKE '%Ekskavatorë, vinça, mikserë betoni, pompë betoni%'), 
 'machinery', 
 (SELECT machinery_id FROM machinery WHERE machinery_name = 'Ekskavator Hidraulik'), 
 85.00, 
 'Disponohen: 1 ekskavator (CAT 320D), 1 vinç kulla (Zoomlion QTZ80), 1 mikser betoni (Schwing Stetter 10m³), 1 pompë betoni (Putzmeister BSA 2110). Të gjitha në gjendje të mirë.',
 (SELECT employee_id FROM employees WHERE email = 'miranda.gjoka@company.al')),

-- Compliance for APP-23456/2024 (Trajtim Ujërash Korçë)
(UUID(), 
 (SELECT requirement_id FROM tender_requirements WHERE requirement_text LIKE '%min. 3 projekte%' AND tender_id = (SELECT tender_id FROM tender_documents WHERE tender_number = 'APP-23456/2024')), 
 'project', 
 (SELECT project_id FROM projects WHERE project_name LIKE '%Ujësjellësit%'), 
 70.00, 
 'Kompania ka realizuar projektin e Ujësjellësit të Korçës që përfshin rrjete dhe trajtim. Nevojiten 2 projekte të tjera të ngjashme për të plotësuar plotësisht kërkesën.',
 (SELECT employee_id FROM employees WHERE email = 'miranda.gjoka@company.al')),

(UUID(), 
 (SELECT requirement_id FROM tender_requirements WHERE requirement_text LIKE '%Inxhinierë mjedisi dhe hidraulikë%'), 
 'employee', 
 (SELECT employee_id FROM employees WHERE email = 'klaudia.marku@company.al'), 
 100.00, 
 'Klaudia Marku është inxhiniere mjedisi me 7 vjet eksperiencë dhe certifikim në Environmental Impact Assessment. Mund të plotësohet me specialist hidraulik.',
 (SELECT employee_id FROM employees WHERE email = 'miranda.gjoka@company.al')),

-- Compliance for INF-78901/2024 (Rruga Durrës-Kavajë)
(UUID(), 
 (SELECT requirement_id FROM tender_requirements WHERE requirement_text LIKE '%15 vjet në rikonstruksion rrugësh%'), 
 'employee', 
 (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 
 95.00, 
 'Besnik Dervishi ka 18 vjet eksperiencë në menaxhim projektesh infrastrukture duke përfshirë rikonstruksionin e rrugës Tiranë-Elbasan (10 km segment).',
 (SELECT employee_id FROM employees WHERE email = 'miranda.gjoka@company.al')),

(UUID(), 
 (SELECT requirement_id FROM tender_requirements WHERE requirement_text LIKE '%Finisher asfaltimi%'), 
 'machinery', 
 (SELECT machinery_id FROM machinery WHERE machinery_name = 'Rulo Kompaktues Asfalt'), 
 60.00, 
 'Disponohet 1 rulo kompaktues. Mungojnë: 2 finisher asfaltimi, 2 rulo shtesë, 8 kamionë damperë, 2 ekskavatorë shtesë, 2 buldozerë, mikser asfalt. Do të duhen me qira ose blerje.',
 (SELECT employee_id FROM employees WHERE email = 'miranda.gjoka@company.al'));

-- DOCUMENT VECTORS (for RAG) - Vektorët e Dokumenteve
INSERT INTO document_vectors (vector_id, tender_id, chunk_text, chunk_index, embedding_model, metadata) VALUES
(UUID(), 
 (SELECT tender_id FROM tender_documents WHERE tender_number = 'REF-45782/2024'),
 'Objekti i Prokurimit: Ndërtim i Urës mbi Lumin Shkumbin në aksin rrugor Librazhd-Elbasan. Autoriteti Kontraktor: Autoriteti Rrugor Shqiptar (ARRSH). Vlera e Përafërt e Kontratës: 8,500,000 EUR.',
 1,
 'multilingual-e5-large',
 '{"document_section": "header", "language": "sq", "importance": "high"}'),

(UUID(), 
 (SELECT tender_id FROM tender_documents WHERE tender_number = 'REF-45782/2024'),
 'PËRSHKRIM I PUNIMEVE: Ndërtim ure beton-armeje me gjatësi 180m dhe gjerësi 12m. Dy korsi për autovetura plus korsi emergjence. Fundamente të thella me pila betoni. Sistem drenazhi dhe hidroizolimi. Barriera mbrojtëse dhe ndriçim.',
 2,
 'multilingual-e5-large',
 '{"document_section": "technical_specs", "language": "sq", "importance": "high"}'),

(UUID(), 
 (SELECT tender_id FROM tender_documents WHERE tender_number = 'REF-45782/2024'),
 'KËRKESA TEKNIKE: Eksperiencë minimale 10 vjet në ndërtim uresh. Projekte të ngjashme me vlerë mbi 5 milionë EUR. Inxhinierë civilë të licencuar (min. 3). Certifikatë ISO 9001, ISO 14001.',
 3,
 'multilingual-e5-large',
 '{"document_section": "requirements", "language": "sq", "importance": "critical"}'),

(UUID(), 
 (SELECT tender_id FROM tender_documents WHERE tender_number = 'APP-23456/2024'),
 'Objekti: Furnizim, Instalim dhe Vënie në Punë e Stacionit të Trajtimit të Ujërave të Zeza për Bashkinë Korçë. Vlera e Përafërt: 3,200,000 EUR. Kapacitet: 15,000 m³/ditë.',
 1,
 'multilingual-e5-large',
 '{"document_section": "header", "language": "sq", "importance": "high"}'),

(UUID(), 
 (SELECT tender_id FROM tender_documents WHERE tender_number = 'APP-23456/2024'),
 'KRITERET E VLERËSIMIT: Çmimi (40 pikë), Eksperienca teknike (30 pikë), Teknologjia e propozuar (20 pikë), Koha e zbatimit (10 pikë).',
 2,
 'multilingual-e5-large',
 '{"document_section": "evaluation_criteria", "language": "sq", "importance": "critical"}'),

(UUID(), 
 (SELECT tender_id FROM tender_documents WHERE tender_number = 'INF-78901/2024'),
 'TENDER I HAPUR KOMBËTAR. Objekti: Rikonstruksion i Rrugës Nacionale Durrës-Kavajë, Segmenti km 15-28 (Lot 2). Ministria e Infrastrukturës dhe Energjisë. Vlera: 6,800,000 EUR.',
 1,
 'multilingual-e5-large',
 '{"document_section": "header", "language": "sq", "importance": "high"}'),

(UUID(), 
 (SELECT tender_id FROM tender_documents WHERE tender_number = 'INF-78901/2024'),
 'PUNIMET PËRFSHIJNË: Frezim i shtresës ekzistuese të asfaltit (13 km). Shtrim i shtresave të reja bazë dhe lidhëse. Asfaltim me sipërfaqe 78,000 m². Ndërtim i dy urave betoni (gjatësi 45m dhe 38m). Sistem drenazhi dhe sinjalistikë. Ndriçim LED i plotë.',
 2,
 'multilingual-e5-large',
 '{"document_section": "scope_of_work", "language": "sq", "importance": "high"}'),

(UUID(), 
 (SELECT tender_id FROM tender_documents WHERE tender_number = 'INF-78901/2024'),
 'MAKINERITË: Finisher asfaltimi (min. 2), Rulo kompaktues (min. 3), Kamionë damperë (min. 8), Ekskavatorë (min. 3), Buldozerë (min. 2), Mikser asfalt.',
 3,
 'multilingual-e5-large',
 '{"document_section": "machinery_requirements", "language": "sq", "importance": "critical"}');

-- Additional MACHINERY (more equipment)
INSERT INTO machinery (machinery_id, machinery_name, machinery_type, model, serial_number, manufacturer, year_manufactured, capacity, specifications, current_status, location, purchase_date, last_maintenance_date, next_maintenance_date, maintenance_cost) VALUES
(UUID(), 'Grinderë Rrugësh', 'Grinderë', 'Wirtgen W 210', 'GRI-2018-009', 'Wirtgen', 2018, '2.0m gjerësi', '{"thellesia_frezimi": "0-330mm", "fuqi_motorit": "395 kW", "sistem_ftohje": "ujë"}', 'available', 'Durrës, Porto Romano', '2018-04-10', '2024-07-20', '2025-01-20', 3500.00),
(UUID(), 'Kamion Cisternë Ujë 12m³', 'Kamion Cisternë', 'Iveco Trakker', 'CIS-2021-010', 'Iveco', 2021, '12 m³', '{"kapaciteti_ujit": "12000 L", "sistem_spërkallës": "automatik", "pompa_presioni": "50 bar"}', 'in_use', 'Tiranë, Kombinat', '2021-06-18', '2024-09-10', '2025-03-10', 900.00),
(UUID(), 'Finisher Asfalt Vogla 75', 'Finisher', 'Vogele Super 1300-3', 'FIN-2022-011', 'Vogele', 2022, '3.0m gjerësi', '{"gjeresia_min": "1.30m", "gjeresia_max": "9.0m", "kapaciteti_bunker": "10 ton"}', 'available', 'Fier, Patos', '2022-03-25', '2024-08-15', '2025-02-15', 2200.00),
(UUID(), 'Loader Frontal', 'Loader', 'Volvo L120H', 'LOA-2020-012', 'Volvo', 2020, '3.0m³', '{"fuqi_motorit": "177 kW", "kapaciteti_kovës": "3.0m³", "ngarkesa_operative": "11500 kg"}', 'available', 'Shkodër, Kodra e Diellit', '2020-10-30', '2024-10-05', '2025-04-05', 1600.00);

-- Additional EMPLOYEES (more staff)
INSERT INTO employees (employee_id, first_name, last_name, email, phone, position, department, specialization, years_experience, certifications, languages_spoken, current_status, hire_date, salary) VALUES
(UUID(), 'Ervin', 'Kaçi', 'ervin.kaci@company.al', '+355 69 111 2222', 'Teknologu Asfaltimi', 'Operacione', '["asfaltim", "kontroll cilësie", "kompaktim"]', 14, '["Asphalt Paving Technician", "Quality Control Specialist"]', '["Shqip", "Italisht"]', 'available', '2010-05-20', 1600.00),
(UUID(), 'Jolanda', 'Tafa', 'jolanda.tafa@company.al', '+355 69 222 3333', 'Inxhiniere Hidraulike', 'Inxhinieri', '["sisteme hidraulike", "ujësjellës", "pompime"]', 9, '["Hydraulic Systems Engineer", "Water Resources Management"]', '["Shqip", "Anglisht"]', 'available', '2015-08-12', 1950.00),
(UUID(), 'Flamur', 'Zeka', 'flamur.zeka@company.al', '+355 69 333 4444', 'Specialist Sigurie dhe Shëndet', 'Siguri', '["OSH", "trajnime sigurie", "inspektime"]', 11, '["NEBOSH Certificate", "ISO 45001 Lead Auditor", "First Aid Instructor"]', '["Shqip", "Anglisht"]', 'available', '2013-02-28', 1750.00),
(UUID(), 'Alketa', 'Sina', 'alketa.sina@company.al', '+355 69 444 5555', 'Jurist Kontratash', 'Ligjor', '["kontrata publike", "ligj prokurimi", "arbitrazh"]', 8, '["Licensed Attorney", "Public Procurement Law Specialist"]', '["Shqip", "Anglisht", "Italisht"]', 'available', '2016-11-15', 1900.00);

-- SUMMARY QUERY to verify data

SELECT 'MACHINERY COUNT' as info, COUNT(*) as total FROM machinery;
SELECT 'EMPLOYEES COUNT' as info, COUNT(*) as total FROM employees;
SELECT 'PROJECTS COUNT' as info, COUNT(*) as total FROM projects;
SELECT 'TENDERS COUNT' as info, COUNT(*) as total FROM tender_documents;
SELECT 'REQUIREMENTS COUNT' as info, COUNT(*) as total FROM tender_requirements;
SELECT 'COMPLIANCE RECORDS' as info, COUNT(*) as total FROM requirement_compliance;
SELECT 'VECTOR CHUNKS' as info, COUNT(*) as total FROM document_vectors;


-- Query examples to test the data:

-- 1. Shiko të gjitha tenderat aktive
-- SELECT tender_number, tender_title, submission_deadline, estimated_value 
-- FROM tender_documents 
-- WHERE status = 'new' OR status = 'under_review'
-- ORDER BY submission_deadline;

-- 2. Shiko makineritë e disponueshme
-- SELECT machinery_name, machinery_type, current_status, location 
-- FROM machinery 
-- WHERE current_status = 'available'
-- ORDER BY machinery_type;

-- 3. Shiko punonjësit e disponueshëm me specialitetet
-- SELECT CONCAT(first_name, ' ', last_name) as name, position, specialization, years_experience
-- FROM employees
-- WHERE current_status = 'available'
-- ORDER BY years_experience DESC;

-- 4. Shiko projektet aktive me menaxherët
-- SELECT p.project_name, p.status, p.budget, CONCAT(e.first_name, ' ', e.last_name) as manager
-- FROM projects p
-- LEFT JOIN employees e ON p.project_manager_id = e.employee_id
-- WHERE p.status = 'in_progress'
-- ORDER BY p.start_date DESC;

-- 5. Analizo përputhshmërinë për një tender
-- SELECT td.tender_title, tr.requirement_text, rc.compliance_score, rc.compliance_notes
-- FROM tender_documents td
-- JOIN tender_requirements tr ON td.tender_id = tr.tender_id
-- LEFT JOIN requirement_compliance rc ON tr.requirement_id = rc.requirement_id
-- WHERE td.tender_number = 'REF-45782/2024'
-- ORDER BY rc.compliance_score DESC;