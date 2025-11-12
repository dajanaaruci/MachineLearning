-- ============================================================================
-- TABELA TË REJA PËR ANALIZA FINANCIARE DHE KOSTOSH
-- ============================================================================

-- 1. TABELA E BUXHETIT TË PROJEKTEVE (Detaje të Hollësishme)
CREATE TABLE IF NOT EXISTS project_budget_breakdown (
    budget_id VARCHAR(36) PRIMARY KEY,
    project_id VARCHAR(36) NOT NULL,
    category VARCHAR(100) NOT NULL,
    subcategory VARCHAR(150),
    budgeted_amount DECIMAL(15,2) NOT NULL,
    actual_spent DECIMAL(15,2) DEFAULT 0,
    committed_amount DECIMAL(15,2) DEFAULT 0,
    variance_amount DECIMAL(15,2) GENERATED ALWAYS AS (budgeted_amount - actual_spent) STORED,
    variance_percentage DECIMAL(5,2) GENERATED ALWAYS AS ((budgeted_amount - actual_spent) / budgeted_amount * 100) STORED,
    notes TEXT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    INDEX idx_project_category (project_id, category)
);

-- 2. TABELA E SHPENZIMEVE TË PROJEKTEVE
CREATE TABLE IF NOT EXISTS project_expenses (
    expense_id VARCHAR(36) PRIMARY KEY,
    project_id VARCHAR(36) NOT NULL,
    expense_date DATE NOT NULL,
    category VARCHAR(100) NOT NULL,
    subcategory VARCHAR(150),
    description TEXT,
    amount DECIMAL(15,2) NOT NULL,
    currency VARCHAR(3) DEFAULT 'ALL',
    payment_method VARCHAR(50),
    invoice_number VARCHAR(100),
    vendor_name VARCHAR(255),
    approved_by VARCHAR(36),
    payment_status ENUM('pending', 'approved', 'paid', 'rejected') DEFAULT 'pending',
    payment_date DATE,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (approved_by) REFERENCES employees(employee_id),
    INDEX idx_expense_date (project_id, expense_date),
    INDEX idx_expense_category (category, subcategory)
);

-- 3. TABELA E KOSTOVE TË MAKINERIVE (Detaje Operative)
CREATE TABLE IF NOT EXISTS machinery_costs (
    cost_id VARCHAR(36) PRIMARY KEY,
    machinery_id VARCHAR(36) NOT NULL,
    project_id VARCHAR(36),
    cost_type ENUM('fuel', 'maintenance', 'repair', 'transport', 'operator', 'depreciation', 'rental', 'insurance', 'other') NOT NULL,
    cost_date DATE NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    currency VARCHAR(3) DEFAULT 'ALL',
    quantity DECIMAL(10,2),
    unit VARCHAR(50),
    description TEXT,
    invoice_number VARCHAR(100),
    vendor_name VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (machinery_id) REFERENCES machinery(machinery_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    INDEX idx_machinery_cost_date (machinery_id, cost_date),
    INDEX idx_project_machinery_cost (project_id, machinery_id)
);

-- 4. TABELA E FURNITORËVE DHE NËNKONTRAKTORËVE
CREATE TABLE IF NOT EXISTS vendors_subcontractors (
    vendor_id VARCHAR(36) PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    tax_id VARCHAR(50) UNIQUE,
    vendor_type ENUM('supplier', 'subcontractor', 'service_provider', 'equipment_rental') NOT NULL,
    contact_person VARCHAR(150),
    email VARCHAR(150),
    phone VARCHAR(20),
    address TEXT,
    city VARCHAR(100),
    country VARCHAR(100) DEFAULT 'Albania',
    specialization JSON,
    rating DECIMAL(3,2),
    payment_terms VARCHAR(100),
    bank_account VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. TABELA E KONTRATAVE ME FURNITORË
CREATE TABLE IF NOT EXISTS vendor_contracts (
    contract_id VARCHAR(36) PRIMARY KEY,
    vendor_id VARCHAR(36) NOT NULL,
    project_id VARCHAR(36),
    contract_number VARCHAR(100) UNIQUE,
    contract_type VARCHAR(100),
    description TEXT,
    start_date DATE NOT NULL,
    end_date DATE,
    contract_value DECIMAL(15,2) NOT NULL,
    currency VARCHAR(3) DEFAULT 'ALL',
    payment_schedule JSON,
    terms_conditions TEXT,
    status ENUM('draft', 'active', 'completed', 'terminated', 'expired') DEFAULT 'draft',
    signed_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (vendor_id) REFERENCES vendors_subcontractors(vendor_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    INDEX idx_vendor_project (vendor_id, project_id)
);

-- 6. TABELA E PAGESAVE DHE FATURAVE
CREATE TABLE IF NOT EXISTS invoices_payments (
    invoice_id VARCHAR(36) PRIMARY KEY,
    project_id VARCHAR(36),
    vendor_id VARCHAR(36),
    contract_id VARCHAR(36),
    invoice_number VARCHAR(100) UNIQUE NOT NULL,
    invoice_date DATE NOT NULL,
    due_date DATE,
    invoice_type ENUM('supplier', 'subcontractor', 'payroll', 'machinery', 'other') NOT NULL,
    description TEXT,
    subtotal DECIMAL(15,2) NOT NULL,
    tax_amount DECIMAL(15,2) DEFAULT 0,
    total_amount DECIMAL(15,2) NOT NULL,
    currency VARCHAR(3) DEFAULT 'ALL',
    payment_status ENUM('unpaid', 'partially_paid', 'paid', 'overdue', 'cancelled') DEFAULT 'unpaid',
    amount_paid DECIMAL(15,2) DEFAULT 0,
    payment_date DATE,
    payment_method VARCHAR(50),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (vendor_id) REFERENCES vendors_subcontractors(vendor_id),
    FOREIGN KEY (contract_id) REFERENCES vendor_contracts(contract_id),
    INDEX idx_invoice_status (payment_status, due_date)
);

-- 7. TABELA E MATERIALEVE DHE INVENTARIT
CREATE TABLE IF NOT EXISTS materials_inventory (
    material_id VARCHAR(36) PRIMARY KEY,
    material_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    unit_of_measure VARCHAR(50),
    unit_cost DECIMAL(12,2),
    quantity_in_stock DECIMAL(12,2) DEFAULT 0,
    minimum_stock_level DECIMAL(12,2),
    warehouse_location VARCHAR(255),
    supplier_id VARCHAR(36),
    last_purchase_date DATE,
    last_purchase_price DECIMAL(12,2),
    specifications JSON,
    status ENUM('active', 'discontinued', 'out_of_stock') DEFAULT 'active',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (supplier_id) REFERENCES vendors_subcontractors(vendor_id)
);

-- 8. TABELA E PËRDORIMIT TË MATERIALEVE NË PROJEKTE
CREATE TABLE IF NOT EXISTS project_material_usage (
    usage_id VARCHAR(36) PRIMARY KEY,
    project_id VARCHAR(36) NOT NULL,
    material_id VARCHAR(36) NOT NULL,
    usage_date DATE NOT NULL,
    quantity_used DECIMAL(12,2) NOT NULL,
    unit_cost DECIMAL(12,2),
    total_cost DECIMAL(12,2) GENERATED ALWAYS AS (quantity_used * unit_cost) STORED,
    requested_by VARCHAR(36),
    approved_by VARCHAR(36),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (material_id) REFERENCES materials_inventory(material_id),
    FOREIGN KEY (requested_by) REFERENCES employees(employee_id),
    INDEX idx_project_material (project_id, material_id)
);

-- 9. TABELA E ANALIZËS KOSTOVE SIPAS AKTIVITETIT (Activity-Based Costing)
CREATE TABLE IF NOT EXISTS project_activities_costs (
    activity_id VARCHAR(36) PRIMARY KEY,
    project_id VARCHAR(36) NOT NULL,
    activity_name VARCHAR(255) NOT NULL,
    activity_code VARCHAR(50),
    wbs_code VARCHAR(50),
    start_date DATE,
    end_date DATE,
    planned_duration INT,
    actual_duration INT,
    budgeted_cost DECIMAL(15,2),
    actual_cost DECIMAL(15,2) DEFAULT 0,
    earned_value DECIMAL(15,2),
    percent_complete DECIMAL(5,2) DEFAULT 0,
    status ENUM('not_started', 'in_progress', 'completed', 'on_hold') DEFAULT 'not_started',
    responsible_person VARCHAR(36),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (responsible_person) REFERENCES employees(employee_id)
);

-- 10. TABELA E OFERTAVE PËR TENDERA
CREATE TABLE IF NOT EXISTS tender_bids (
    bid_id VARCHAR(36) PRIMARY KEY,
    tender_id VARCHAR(36) NOT NULL,
    bid_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_bid_amount DECIMAL(15,2) NOT NULL,
    currency VARCHAR(3) DEFAULT 'EUR',
    technical_score DECIMAL(5,2),
    financial_score DECIMAL(5,2),
    total_score DECIMAL(5,2),
    bid_breakdown JSON,
    risk_assessment TEXT,
    profit_margin DECIMAL(5,2),
    contingency_percentage DECIMAL(5,2),
    bid_bond_amount DECIMAL(15,2),
    performance_bond_percentage DECIMAL(5,2),
    submission_status ENUM('draft', 'submitted', 'won', 'lost', 'cancelled') DEFAULT 'draft',
    prepared_by VARCHAR(36),
    approved_by VARCHAR(36),
    notes TEXT,
    FOREIGN KEY (tender_id) REFERENCES tender_documents(tender_id),
    FOREIGN KEY (prepared_by) REFERENCES employees(employee_id),
    INDEX idx_tender_status (tender_id, submission_status)
);

-- 11. TABELA E ANALIZËS SË RISKUT FINANCIAR
CREATE TABLE IF NOT EXISTS financial_risk_analysis (
    risk_id VARCHAR(36) PRIMARY KEY,
    project_id VARCHAR(36),
    tender_id VARCHAR(36),
    risk_category VARCHAR(100),
    risk_description TEXT,
    probability ENUM('very_low', 'low', 'medium', 'high', 'very_high'),
    impact ENUM('negligible', 'minor', 'moderate', 'major', 'critical'),
    risk_score INT,
    mitigation_strategy TEXT,
    contingency_amount DECIMAL(15,2),
    owner VARCHAR(36),
    status ENUM('identified', 'assessed', 'mitigated', 'closed') DEFAULT 'identified',
    identified_date DATE,
    review_date DATE,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (tender_id) REFERENCES tender_documents(tender_id),
    FOREIGN KEY (owner) REFERENCES employees(employee_id)
);

-- 12. TABELA E CASH FLOW (Fluksi i Parasë)
CREATE TABLE IF NOT EXISTS cash_flow (
    cashflow_id VARCHAR(36) PRIMARY KEY,
    project_id VARCHAR(36),
    period_start DATE NOT NULL,
    period_end DATE NOT NULL,
    opening_balance DECIMAL(15,2),
    total_inflows DECIMAL(15,2) DEFAULT 0,
    total_outflows DECIMAL(15,2) DEFAULT 0,
    closing_balance DECIMAL(15,2) GENERATED ALWAYS AS (opening_balance + total_inflows - total_outflows) STORED,
    inflow_details JSON,
    outflow_details JSON,
    forecast_vs_actual VARCHAR(20),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    INDEX idx_project_period (project_id, period_start)
);

-- ============================================================================
-- TË DHËNA SAMPLE PËR TABELAT E REJA
-- ============================================================================

-- VENDORS & SUBCONTRACTORS
INSERT INTO vendors_subcontractors VALUES
(UUID(), 'Beton Konstruksion Shpk', 'L12345678A', 'supplier', 'Alban Zeneli', 'info@betonkonstruksion.al', '+355 68 200 1111', 'Rruga Industriale, Kashar', 'Tiranë', 'Albania', '["beton", "çimento", "agregat"]', 4.5, 'Net 30', 'AL35202111090000000001234567', TRUE, 'Furnitor kryesor i betonit', NOW()),
(UUID(), 'Hekurudha Inert SHPK', 'K98765432B', 'supplier', 'Gent Hoxha', 'sales@hekurudhainert.al', '+355 69 300 2222', 'Zona Industriale, Fushë-Krujë', 'Krujë', 'Albania', '["agregat", "rërë", "zhavorr"]', 4.2, 'Net 45', 'AL35202111090000000002345678', TRUE, 'Furnitor materialesh inerte', NOW()),
(UUID(), 'Alfa Mekanik Service', 'M45678901C', 'service_provider', 'Besart Muka', 'service@alfamekanik.al', '+355 67 400 3333', 'Rruga e Kavajës, Km 8', 'Tiranë', 'Albania', '["mirëmbajtje", "riparim makinerish", "servis"]', 4.7, 'Immediate', 'AL35202111090000000003456789', TRUE, 'Mirëmbajtje dhe riparim makinerish', NOW()),
(UUID(), 'Nënkontraktori Urave "Konstrukt"', 'N78901234D', 'subcontractor', 'Edmond Duka', 'info@konstrukt-bridge.al', '+355 69 500 4444', 'Lagjja Partizani, Korçë', 'Korçë', 'Albania', '["ndërtim uresh", "struktura betoni"]', 4.4, 'Progress Payment', 'AL35202111090000000004567890', TRUE, 'Specialist për ndërtim uresh', NOW()),
(UUID(), 'Rent Makineri Albania', 'R23456789E', 'equipment_rental', 'Sokol Lika', 'rental@rentmakineri.al', '+355 68 600 5555', 'Autostrada Tiranë-Durrës, Km 12', 'Durrës', 'Albania', '["qira makinerish", "vinça", "ekskavatorë"]', 4.1, 'Weekly/Monthly', 'AL35202111090000000005678901', TRUE, 'Qira makinerish ndërtimi', NOW());

-- PROJECT BUDGET BREAKDOWN (për projektin Tiranë-Elbasan)
INSERT INTO project_budget_breakdown VALUES
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Labor', 'Technical Staff', 850000.00, 520000.00, 0, NULL, NULL, 'Inxhinierë, menaxherë, teknikë', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Labor', 'Construction Workers', 620000.00, 380000.00, 0, NULL, NULL, 'Punëtorë ndërtimi', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Materials', 'Concrete & Cement', 780000.00, 465000.00, 120000.00, NULL, NULL, 'Beton, çimento, shtesa', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Materials', 'Asphalt & Bitumen', 920000.00, 580000.00, 150000.00, NULL, NULL, 'Asfalt, bitum', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Materials', 'Steel & Reinforcement', 540000.00, 325000.00, 80000.00, NULL, NULL, 'Hekur, armaturë', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Equipment', 'Machinery Usage', 450000.00, 285000.00, 0, NULL, NULL, 'Ekskavatorë, buldozerë, etc', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Equipment', 'Equipment Rental', 180000.00, 95000.00, 35000.00, NULL, NULL, 'Qira makinerish shtesë', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Subcontractors', 'Bridge Construction', 380000.00, 210000.00, 170000.00, NULL, NULL, 'Ndërtim urave', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Subcontractors', 'Electrical Works', 145000.00, 72000.00, 50000.00, NULL, NULL, 'Instalime elektrike', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Overhead', 'Administration', 280000.00, 165000.00, 0, NULL, NULL, 'Administrim, ligjor', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Overhead', 'Insurance & Permits', 125000.00, 78000.00, 0, NULL, NULL, 'Sigurime, leje', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Contingency', 'Risk Reserve', 230000.00, 25000.00, 0, NULL, NULL, 'Rezervë për rreziqe', NOW());

-- MACHINERY COSTS (shembuj për 2024)
INSERT INTO machinery_costs VALUES
(UUID(), (SELECT machinery_id FROM machinery WHERE machinery_name = 'Ekskavator Hidraulik'), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'fuel', '2024-10-15', 3500.00, 'ALL', 850.0, 'litra', 'Naftë për ekskavator', 'INV-2024-1001', 'Petrol Albania', NOW()),
(UUID(), (SELECT machinery_id FROM machinery WHERE machinery_name = 'Ekskavator Hidraulik'), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'maintenance', '2024-09-15', 2500.00, 'ALL', 1, 'service', 'Mirëmbajtje periodike', 'INV-2024-0915', 'Alfa Mekanik Service', NOW()),
(UUID(), (SELECT machinery_id FROM machinery WHERE machinery_name = 'Buldozer i Rëndë'), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'fuel', '2024-10-20', 4200.00, 'ALL', 980.0, 'litra', 'Naftë për buldozer', 'INV-2024-1020', 'Petrol Albania', NOW()),
(UUID(), (SELECT machinery_id FROM machinery WHERE machinery_name = 'Buldozer i Rëndë'), NULL, 'repair', '2024-10-01', 8500.00, 'ALL', 1, 'service', 'Riparim hidraulik', 'INV-2024-1001', 'Alfa Mekanik Service', NOW()),
(UUID(), (SELECT machinery_id FROM machinery WHERE machinery_name = 'Kamion Damper 6x4'), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'fuel', '2024-10-25', 2800.00, 'ALL', 650.0, 'litra', 'Naftë për kamion', 'INV-2024-1025', 'Petrol Albania', NOW()),
(UUID(), (SELECT machinery_id FROM machinery WHERE machinery_name = 'Rulo Kompaktues Asfalt'), NULL, 'maintenance', '2024-10-20', 2100.00, 'ALL', 1, 'service', 'Mirëmbajtje sistemi vibrues', 'INV-2024-1020', 'Alfa Mekanik Service', NOW()),
(UUID(), (SELECT machinery_id FROM machinery WHERE machinery_name = 'Mikser Betoni 10m³'), (SELECT project_id FROM projects WHERE project_name LIKE '%Ujësjellësit%'), 'fuel', '2024-10-18', 1500.00, 'ALL', 380.0, 'litra', 'Naftë për mikser', 'INV-2024-1018', 'Petrol Albania', NOW()),
(UUID(), (SELECT machinery_id FROM machinery WHERE machinery_name = 'Vinç Kulla QTZ80'), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'operator', '2024-10-01', 85000.00, 'ALL', 160, 'orë', 'Operator vinci Tetor', 'SAL-2024-10', 'Internal Payroll', NOW()),
(UUID(), (SELECT machinery_id FROM machinery WHERE machinery_name = 'Generator Elektrik 250kVA'), (SELECT project_id FROM projects WHERE project_name LIKE '%Ujësjellësit%'), 'fuel', '2024-10-22', 800.00, 'ALL', 420.0, 'litra', 'Naftë për gjenerator', 'INV-2024-1022', 'Petrol Albania', NOW());

-- MATERIALS INVENTORY
INSERT INTO materials_inventory VALUES
(UUID(), 'Beton C25/30', 'Beton', 'm³', 12500.00, 85.5, 20.0, 'Magazina Kashar', (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Beton Konstruksion Shpk'), '2024-10-20', 12500.00, '{"rezistenca": "25 MPa", "expozim": "XC3"}', 'active', NULL, NOW()),
(UUID(), 'Çimento CEM II 42.5', 'Lidhës', 'ton', 9500.00, 45.2, 10.0, 'Magazina Kashar', (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Beton Konstruksion Shpk'), '2024-10-15', 9500.00, '{"tipi": "CEM II/A-L 42.5 N"}', 'active', NULL, NOW()),
(UUID(), 'Agregat 0-31.5mm', 'Inerte', 'ton', 1850.00, 320.8, 50.0, 'Kantier Kashar', (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Hekurudha Inert SHPK'), '2024-10-18', 1850.00, '{"përbërja": "zhavorr natyror"}', 'active', NULL, NOW()),
(UUID(), 'Rërë Lumi 0-4mm', 'Inerte', 'ton', 1200.00, 180.5, 30.0, 'Kantier Kashar', (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Hekurudha Inert SHPK'), '2024-10-19', 1200.00, '{"pastërtia": "e larë"}', 'active', NULL, NOW()),
(UUID(), 'Hekur Betoni Ø12mm', 'Hekur', 'ton', 68000.00, 12.8, 3.0, 'Magazina Kombinat', (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Beton Konstruksion Shpk'), '2024-10-10', 68000.00, '{"çeliku": "S500s"}', 'active', NULL, NOW()),
(UUID(), 'Hekur Betoni Ø16mm', 'Hekur', 'ton', 68000.00, 8.5, 2.0, 'Magazina Kombinat', (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Beton Konstruksion Shpk'), '2024-10-10', 68000.00, '{"çeliku": "S500s"}', 'active', NULL, NOW()),
(UUID(), 'Bitum 50/70', 'Asfalt', 'ton', 52000.00, 28.0, 10.0, 'Kantier Vlorë', (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Hekurudha Inert SHPK'), '2024-10-12', 52000.00, '{"penetrimi": "50-70 dmm"}', 'active', NULL, NOW()),
(UUID(), 'Tubacion PEHD Ø315mm', 'Tubacione', 'metër', 2800.00, 450.0, 100.0, 'Magazina Korçë', (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Beton Konstruksion Shpk'), '2024-09-25', 2800.00, '{"presioni": "PN16"}', 'active', NULL, NOW());

-- PROJECT MATERIAL USAGE
INSERT INTO project_material_usage VALUES
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), (SELECT material_id FROM materials_inventory WHERE material_name = 'Beton C25/30'), '2024-10-15', 125.5, 12500.00, NULL, (SELECT employee_id FROM employees WHERE email = 'arben.hoxha@company.al'), (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 'Për fundamente ure', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), (SELECT material_id FROM materials_inventory WHERE material_name = 'Hekur Betoni Ø12mm'), '2024-10-16', 8.2, 68000.00, NULL, (SELECT employee_id FROM employees WHERE email = 'arben.hoxha@company.al'), (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 'Armaturë ure', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), (SELECT material_id FROM materials_inventory WHERE material_name = 'Agregat 0-31.5mm'), '2024-10-17', 280.0, 1850.00, NULL, (SELECT employee_id FROM employees WHERE email = 'arben.hoxha@company.al'), (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 'Shtresë bazë rruge', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Ujësjellësit%'), (SELECT material_id FROM materials_inventory WHERE material_name = 'Tubacion PEHD Ø315mm'), '2024-10-05', 850.0, 2800.00, NULL, (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 'Rrjet kryesor ujësjellësi', NOW());

-- PROJECT EXPENSES
INSERT INTO project_expenses VALUES
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), '2024-10-15', 'Materials', 'Concrete', 'Furnizim betoni për fundamente', 1568750.00, 'ALL', 'Bank Transfer', 'INV-BET-2024-1015', 'Beton Konstruksion Shpk', (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 'paid', '2024-10-25', 'Paguar në afat', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), '2024-10-18', 'Materials', 'Aggregates', 'Agregat për shtresë bazë', 518000.00, 'ALL', 'Bank Transfer', 'INV-AGR-2024-1018', 'Hekurudha Inert SHPK', (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 'paid', '2024-10-30', NULL, NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), '2024-10-20', 'Equipment', 'Fuel', 'Naftë për makineri', 185000.00, 'ALL', 'Cash', 'INV-FUEL-2024-1020', 'Petrol Albania', (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 'paid', '2024-10-22', NULL, NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), '2024-09-30', 'Labor', 'Payroll', 'Pagat Shtator 2024', 425000.00, 'ALL', 'Bank Transfer', 'PAY-2024-09', 'Internal Payroll', (SELECT employee_id FROM employees WHERE email = 'emanuela.basha@company.al'), 'paid', '2024-10-05', 'Pagat e stafit', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Ujësjellësit%'), '2024-10-05', 'Materials', 'Pipes', 'Tubacione PEHD', 2380000.00, 'ALL', 'Bank Transfer', 'INV-TUB-2024-1005', 'Beton Konstruksion Shpk', (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 'paid', '2024-10-20', NULL, NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Ujësjellësit%'), '2024-10-12', 'Equipment', 'Rental', 'Qira ekskavatori', 380000.00, 'ALL', 'Bank Transfer', 'INV-RENT-2024-1012', 'Rent Makineri Albania', (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 'approved', NULL, 'Për 2 javë', NOW());

-- VENDOR CONTRACTS
INSERT INTO vendor_contracts VALUES
(UUID(), (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Beton Konstruksion Shpk'), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'CONT-BET-2023-001', 'Furnizim Betoni', 'Furnizim betoni të klasave të ndryshme për projektin', '2023-04-15', '2025-10-30', 3500000.00, 'ALL', '{"type": "milestone", "terms": "30% përpara, 70% sipas sasinë e furnizuar"}', 'Sipas specifikimeve teknike të projektit', 'active', '2023-04-20', NOW()),
(UUID(), (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Nënkontraktori Urave "Konstrukt"'), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'CONT-URE-2023-002', 'Ndërtim Urave', 'Ndërtim i 3 urave betoni në segmentin rrugor', '2023-06-01', '2024-12-31', 1200000.00, 'ALL', '{"type": "progress", "milestones": ["fundamente", "kolona", "mbikalimet"]}', 'Sipas projektit arkitekturor dhe strukturor', 'active', '2023-06-05', NOW()),
(UUID(), (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Rent Makineri Albania'), (SELECT project_id FROM projects WHERE project_name LIKE '%Ujësjellësit%'), 'CONT-RENT-2024-003', 'Qira Makinerish', 'Qira ekskavatori dhe vinçi për projektin', '2024-02-10', '2025-08-15', 850000.00, 'ALL', '{"type": "monthly", "rate": "55,000 ALL/muaj"}', 'Mbajtja dhe karburanti nga kontraktorti', 'active', '2024-02-12', NOW()),
(UUID(), (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Alfa Mekanik Service'), NULL, 'CONT-SERV-2024-004', 'Mirëmbajtje Makinerish', 'Kontratë vjetore për mirëmbajtje të gjithë parkut të makinerive', '2024-01-01', '2024-12-31', 480000.00, 'ALL', '{"type": "fixed_annual", "services": "mirëmbajtje preventive dhe riparime"}', 'Përfshihen pjesët e vogla, karburanti nga klienti', 'active', '2024-01-05', NOW());

-- INVOICES & PAYMENTS
INSERT INTO invoices_payments VALUES
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Beton Konstruksion Shpk'), (SELECT contract_id FROM vendor_contracts WHERE contract_number = 'CONT-BET-2023-001'), 'FAT-BET-2024-101', '2024-10-15', '2024-11-14', 'supplier', 'Furnizim betoni C25/30 - 125.5 m³', 1568750.00, 313750.00, 1882500.00, 'ALL', 'paid', 1882500.00, '2024-10-25', 'Bank Transfer', 'Paguar brenda afatit', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Hekurudha Inert SHPK'), NULL, 'FAT-AGR-2024-102', '2024-10-18', '2024-11-17', 'supplier', 'Agregat 0-31.5mm - 280 ton', 518000.00, 103600.00, 621600.00, 'ALL', 'paid', 621600.00, '2024-10-30', 'Bank Transfer', NULL, NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Nënkontraktori Urave "Konstrukt"'), (SELECT contract_id FROM vendor_contracts WHERE contract_number = 'CONT-URE-2023-002'), 'FAT-URE-2024-103', '2024-09-30', '2024-10-30', 'subcontractor', 'Progres Shtator - Ura 1 (fundamente)', 350000.00, 70000.00, 420000.00, 'ALL', 'paid', 420000.00, '2024-10-28', 'Bank Transfer', 'Milestonë e plotësuar', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Ujësjellësit%'), (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Rent Makineri Albania'), (SELECT contract_id FROM vendor_contracts WHERE contract_number = 'CONT-RENT-2024-003'), 'FAT-RENT-2024-104', '2024-10-01', '2024-10-31', 'supplier', 'Qira ekskavatori - Tetor 2024', 55000.00, 11000.00, 66000.00, 'ALL', 'unpaid', 0, NULL, NULL, 'Afati i pagesës në fund të muajit', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), NULL, NULL, 'FAT-FUEL-2024-105', '2024-10-20', '2024-10-25', 'other', 'Karburant Tetor - Të gjitha makinat', 185000.00, 37000.00, 222000.00, 'ALL', 'paid', 222000.00, '2024-10-22', 'Cash', 'Paguar cash', NOW()),
(UUID(), NULL, (SELECT vendor_id FROM vendors_subcontractors WHERE company_name = 'Alfa Mekanik Service'), (SELECT contract_id FROM vendor_contracts WHERE contract_number = 'CONT-SERV-2024-004'), 'FAT-SERV-2024-106', '2024-10-31', '2024-11-30', 'machinery', 'Mirëmbajtje dhe riparime Tetor', 125000.00, 25000.00, 150000.00, 'ALL', 'approved', 0, NULL, NULL, 'Për aprovm pagese', NOW());

-- PROJECT ACTIVITIES COSTS (Work Breakdown Structure)
INSERT INTO project_activities_costs VALUES
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Gërmime dhe Nivelim', 'ACT-001', 'WBS-1.1', '2023-04-20', '2023-08-15', 117, 118, 380000.00, 385000.00, 385000.00, 100.00, 'completed', (SELECT employee_id FROM employees WHERE email = 'arben.hoxha@company.al'), 'Përfunduar me sukses', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Ndërtim Urave - Ura 1', 'ACT-002', 'WBS-1.2.1', '2023-06-15', '2024-02-28', 258, 260, 520000.00, 485000.00, 520000.00, 100.00, 'completed', (SELECT employee_id FROM employees WHERE email = 'arben.hoxha@company.al'), 'Ura 1 e përfunduar', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Ndërtim Urave - Ura 2', 'ACT-003', 'WBS-1.2.2', '2023-09-01', '2024-06-30', 303, 285, 480000.00, 420000.00, 456000.00, 95.00, 'in_progress', (SELECT employee_id FROM employees WHERE email = 'arben.hoxha@company.al'), 'Në përfundim', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Ndërtim Urave - Ura 3', 'ACT-004', 'WBS-1.2.3', '2024-03-01', '2024-12-15', 289, 220, 450000.00, 285000.00, 315000.00, 70.00, 'in_progress', (SELECT employee_id FROM employees WHERE email = 'arben.hoxha@company.al'), 'Në proces', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Shtresë Bazë Rrugore', 'ACT-005', 'WBS-1.3', '2024-01-15', '2024-08-30', 228, 215, 920000.00, 780000.00, 828000.00, 90.00, 'in_progress', (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 'Afër përfundimit', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Asfaltim', 'ACT-006', 'WBS-1.4', '2024-07-01', '2025-04-30', 304, 125, 1150000.00, 520000.00, 575000.00, 50.00, 'in_progress', (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 'Në vazhdim', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Sistem Drenazhi', 'ACT-007', 'WBS-1.5', '2024-05-01', '2025-02-28', 303, 185, 385000.00, 195000.00, 231000.00, 60.00, 'in_progress', (SELECT employee_id FROM employees WHERE email = 'klaudia.marku@company.al'), 'Në zhvillim', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), 'Sinjalistikë dhe Ndriçim', 'ACT-008', 'WBS-1.6', '2025-02-01', '2025-07-31', 181, 0, 315000.00, 0, 0, 0, 'not_started', (SELECT employee_id FROM employees WHERE email = 'gentian.kola@company.al'), 'Planifikuar të fillojë', NOW());

-- TENDER BIDS (Ofertat për Tendera)
INSERT INTO tender_bids VALUES
(UUID(), (SELECT tender_id FROM tender_documents WHERE tender_number = 'REF-45782/2024'), NOW(), 8250000.00, 'EUR', 85.00, 92.00, 88.50, '{"labor": 1250000, "materials": 3850000, "equipment": 920000, "subcontractors": 1480000, "overhead": 450000, "profit": 300000}', 'Risk të moderuar: valutë, kushte moti, disponueshmëri materialesh', 3.64, 10.00, 165000.00, 10.00, 'draft', (SELECT employee_id FROM employees WHERE email = 'miranda.gjoka@company.al'), NULL, 'Draft në përgatitje - kërkohen aprovime', NOW()),
(UUID(), (SELECT tender_id FROM tender_documents WHERE tender_number = 'APP-23456/2024'), NOW(), 3150000.00, 'EUR', 78.00, 88.00, 83.00, '{"equipment": 1850000, "installation": 680000, "training": 120000, "warranty": 180000, "overhead": 220000, "profit": 100000}', 'Risk të ulët: teknologji e provuar, furnitorë të besueshëm', 3.17, 8.00, 63000.00, 10.00, 'draft', (SELECT employee_id FROM employees WHERE email = 'miranda.gjoka@company.al'), NULL, 'Në analizë teknike', NOW());

-- FINANCIAL RISK ANALYSIS
INSERT INTO financial_risk_analysis VALUES
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), NULL, 'Currency Exchange', 'Rënia e lekut ndaj euros mund të rrisë koston e importeve', 'medium', 'moderate', 6, 'Blerje përpara e materialeve me ekspoizm valutë, klauzola rregullimi çmimi', 125000.00, (SELECT employee_id FROM employees WHERE email = 'emanuela.basha@company.al'), 'assessed', '2023-04-15', '2024-11-01'),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), NULL, 'Weather Delays', 'Kushtet e këqija të motit mund të vonostojnë punë', 'high', 'moderate', 8, 'Buffer kohor 15 ditë, punime të përshpejtuara pas motit', 85000.00, (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 'mitigated', '2023-05-10', '2024-12-01'),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), NULL, 'Material Price Increase', 'Rritje e çmimit të betonit dhe çeliku', 'medium', 'major', 9, 'Kontrata me çmim të fiksuar, furnizim përpara për sasi kritike', 180000.00, (SELECT employee_id FROM employees WHERE email = 'emanuela.basha@company.al'), 'mitigated', '2023-04-20', '2024-11-15'),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Ujësjellësit%'), NULL, 'Subcontractor Delay', 'Vonesë nga nënkontraktorë mund të ndikojë afatet', 'medium', 'moderate', 6, 'Kontrata me penalitete, plan alternativ për nënkontraktorë', 95000.00, (SELECT employee_id FROM employees WHERE email = 'besnik.dervishi@company.al'), 'identified', '2024-02-15', '2024-12-01'),
(UUID(), NULL, (SELECT tender_id FROM tender_documents WHERE tender_number = 'REF-45782/2024'), 'Underbidding Risk', 'Çmim tepër i ulët mund të shkaktojë humbje', 'low', 'critical', 8, 'Analiza e detajuar e kostove, margjinë minimale 3.5%', 0, (SELECT employee_id FROM employees WHERE email = 'miranda.gjoka@company.al'), 'assessed', '2024-10-20', '2024-11-15'),
(UUID(), NULL, (SELECT tender_id FROM tender_documents WHERE tender_number = 'INF-78901/2024'), 'Equipment Shortage', 'Mungesa e makinerive të nevojshme', 'high', 'major', 12, 'Kontrata qiraje përpara, partneritet me kompani qirash', 350000.00, (SELECT employee_id FROM employees WHERE email = 'miranda.gjoka@company.al'), 'identified', '2024-10-25', '2024-12-01');

-- CASH FLOW
INSERT INTO cash_flow (cashflow_id, project_id, period_start, period_end, opening_balance, total_inflows, total_outflows, inflow_details, outflow_details, forecast_vs_actual, notes, created_at) VALUES
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), '2024-10-01', '2024-10-31', 185000.00, 420000.00, 1285000.00, '{"client_payment": 350000, "advance_payment": 70000}', '{"materials": 680000, "labor": 385000, "equipment": 145000, "overhead": 75000}', 'actual', 'Fluksi negativ për shkak të pagesave të mëdha furnitorësh', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Tiranë-Elbasan%'), '2024-11-01', '2024-11-30', -680000.00, 850000.00, 950000.00, '{"client_milestone": 750000, "retention_release": 100000}', '{"materials": 520000, "labor": 320000, "equipment": 110000}', 'forecast', 'Fluksi pozitiv i pritur nga pagesa e milestonëve', NOW()),
(UUID(), (SELECT project_id FROM projects WHERE project_name LIKE '%Ujësjellësit%'), '2024-10-01', '2024-10-31', 95000.00, 280000.00, 685000.00, '{"client_payment": 280000}', '{"materials": 420000, "equipment": 185000, "labor": 80000}', 'actual', 'Investim i lartë fillestar', NOW());
