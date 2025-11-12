-- Database Schema for Tender Process Automation System (MySQL Compatible)

-- Enable UUIDs using MySQL's UUID() function instead of PostgreSQL's uuid_generate_v4()
-- Create the Tender Database
CREATE DATABASE IF NOT EXISTS tender_database;

-- Use the created database
USE tender_database;

-- MACHINERY TABLE
CREATE TABLE IF NOT EXISTS machinery (
    machinery_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    machinery_name VARCHAR(255) NOT NULL,
    machinery_type VARCHAR(100) NOT NULL,
    model VARCHAR(100),
    serial_number VARCHAR(100) UNIQUE,
    manufacturer VARCHAR(100),
    year_manufactured INT,
    capacity VARCHAR(100),
    specifications JSON,
    current_status VARCHAR(50) DEFAULT 'available',
    location VARCHAR(255),
    purchase_date DATE,
    last_maintenance_date DATE,
    next_maintenance_date DATE,
    maintenance_cost DECIMAL(12, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- EMPLOYEES TABLE
CREATE TABLE IF NOT EXISTS employees (
    employee_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    position VARCHAR(100) NOT NULL,
    department VARCHAR(100),
    specialization JSON,
    years_experience INT,
    certifications JSON,
    languages_spoken JSON,
    current_status VARCHAR(50) DEFAULT 'available',
    hire_date DATE NOT NULL,
    salary DECIMAL(12, 2),
    availability_start_date DATE,
    availability_end_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- PROJECTS TABLE
CREATE TABLE IF NOT EXISTS projects (
    project_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    project_name VARCHAR(255) NOT NULL,
    project_type VARCHAR(100) NOT NULL,
    client_name VARCHAR(255),
    start_date DATE,
    end_date DATE,
    estimated_end_date DATE,
    budget DECIMAL(15, 2),
    actual_cost DECIMAL(15, 2),
    status VARCHAR(50) DEFAULT 'planning',
    description TEXT,
    location VARCHAR(255),
    project_manager_id CHAR(36),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (project_manager_id) REFERENCES employees(employee_id)
);

-- TENDER DOCUMENTS TABLE
CREATE TABLE IF NOT EXISTS tender_documents (
    tender_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    tender_number VARCHAR(100) UNIQUE NOT NULL,
    tender_title VARCHAR(500) NOT NULL,
    issuing_authority VARCHAR(255) NOT NULL,
    publication_date DATE NOT NULL,
    submission_deadline DATE NOT NULL,
    language VARCHAR(50) DEFAULT 'albanian',
    document_path VARCHAR(500),
    raw_text TEXT,
    processed_text TEXT,
    status VARCHAR(50) DEFAULT 'new',
    estimated_value DECIMAL(15, 2),
    currency VARCHAR(10) DEFAULT 'EUR',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    processed_at TIMESTAMP NULL
);

-- TENDER REQUIREMENTS TABLE
CREATE TABLE IF NOT EXISTS tender_requirements (
    requirement_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    tender_id CHAR(36) NOT NULL,
    requirement_type VARCHAR(100) NOT NULL,
    requirement_category VARCHAR(100),
    requirement_text TEXT NOT NULL,
    extracted_text TEXT,
    parsed_requirements JSON,
    priority VARCHAR(20) DEFAULT 'medium',
    is_mandatory BOOLEAN DEFAULT TRUE,
    compliance_status VARCHAR(50) DEFAULT 'pending',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (tender_id) REFERENCES tender_documents(tender_id) ON DELETE CASCADE
);

-- PROJECT-MACHINERY ASSIGNMENT TABLE
CREATE TABLE IF NOT EXISTS project_machinery (
    assignment_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    project_id CHAR(36) NOT NULL,
    machinery_id CHAR(36) NOT NULL,
    assignment_start_date DATE NOT NULL,
    assignment_end_date DATE,
    usage_hours DECIMAL(10, 2),
    cost DECIMAL(12, 2),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_project_machinery (project_id, machinery_id, assignment_start_date),
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE,
    FOREIGN KEY (machinery_id) REFERENCES machinery(machinery_id) ON DELETE CASCADE
);

-- PROJECT-EMPLOYEE ASSIGNMENT TABLE
CREATE TABLE IF NOT EXISTS project_employees (
    assignment_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    project_id CHAR(36) NOT NULL,
    employee_id CHAR(36) NOT NULL,
    role VARCHAR(100) NOT NULL,
    assignment_start_date DATE NOT NULL,
    assignment_end_date DATE,
    allocation_percentage DECIMAL(5, 2) DEFAULT 100.00,
    hourly_rate DECIMAL(10, 2),
    total_hours DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_project_employee (project_id, employee_id, assignment_start_date),
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE
);

-- REQUIREMENT COMPLIANCE TABLE
CREATE TABLE IF NOT EXISTS requirement_compliance (
    compliance_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    requirement_id CHAR(36) NOT NULL,
    resource_type VARCHAR(50) NOT NULL,
    resource_id CHAR(36) NOT NULL,
    compliance_score DECIMAL(5, 2),
    compliance_notes TEXT,
    verified_by CHAR(36),
    verified_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (requirement_id) REFERENCES tender_requirements(requirement_id) ON DELETE CASCADE,
    FOREIGN KEY (verified_by) REFERENCES employees(employee_id)
);

-- VECTOR STORE METADATA TABLE
CREATE TABLE IF NOT EXISTS document_vectors (
    vector_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    tender_id CHAR(36),
    chunk_text TEXT NOT NULL,
    chunk_index INT NOT NULL,
    embedding_model VARCHAR(100),
    metadata JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tender_id) REFERENCES tender_documents(tender_id) ON DELETE CASCADE
);

-- INDEXES
CREATE INDEX idx_machinery_status ON machinery(current_status);
CREATE INDEX idx_employees_status ON employees(current_status);
CREATE INDEX idx_tender_status ON tender_documents(status);
CREATE INDEX idx_requirements_tender ON tender_requirements(tender_id);

-- TRIGGERS (MySQL)
DELIMITER $$

CREATE TRIGGER trg_machinery_update
BEFORE UPDATE ON machinery
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER trg_employees_update
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER trg_projects_update
BEFORE UPDATE ON projects
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER trg_tender_documents_update
BEFORE UPDATE ON tender_documents
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER trg_tender_requirements_update
BEFORE UPDATE ON tender_requirements
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER trg_project_machinery_update
BEFORE UPDATE ON project_machinery
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER trg_project_employees_update
BEFORE UPDATE ON project_employees
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

CREATE TRIGGER trg_requirement_compliance_update
BEFORE UPDATE ON requirement_compliance
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END$$

DELIMITER ;



-- Total projects started, completed, and active per month with cost insights
SELECT 
    DATE_FORMAT(start_date, '%Y-%m') AS month,
    COUNT(CASE WHEN status = 'active' THEN 1 END) AS active_projects,
    COUNT(CASE WHEN status = 'completed' THEN 1 END) AS completed_projects,
    COUNT(CASE WHEN status = 'planning' THEN 1 END) AS new_projects,
    SUM(budget) AS total_budget,
    SUM(actual_cost) AS total_cost,
    ROUND((SUM(actual_cost) / SUM(budget)) * 100, 2) AS budget_utilization_percent
FROM projects
GROUP BY DATE_FORMAT(start_date, '%Y-%m')
ORDER BY month DESC;
--------------

-- Find tenders or projects with deadlines within the next month
SELECT 
    'Tender' AS type,
    tender_title AS title,
    submission_deadline AS due_date,
    status
FROM tender_documents
WHERE submission_deadline BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY)

UNION ALL

SELECT 
    'Project' AS type,
    project_name AS title,
    estimated_end_date AS due_date,
    status
FROM projects
WHERE estimated_end_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY)

ORDER BY due_date ASC;


----
-- Employees currently involved in active projects with total allocated hours
SELECT 
    e.first_name,
    e.last_name,
    p.project_name,
    pe.role,
    pe.assignment_start_date,
    pe.assignment_end_date,
    pe.total_hours,
    pe.allocation_percentage,
    ROUND((pe.allocation_percentage / 100) * pe.total_hours, 2) AS effective_hours
FROM project_employees pe
JOIN employees e ON pe.employee_id = e.employee_id
JOIN projects p ON pe.project_id = p.project_id
WHERE p.status = 'active'
ORDER BY e.last_name, p.project_name;


-- Track machinery usage hours and costs per project each month
SELECT 
    m.machinery_name,
    p.project_name,
    DATE_FORMAT(pm.assignment_start_date, '%Y-%m') AS month,
    SUM(pm.usage_hours) AS total_usage_hours,
    SUM(pm.cost) AS total_usage_cost,
    ROUND(SUM(pm.cost) / NULLIF(SUM(pm.usage_hours), 0), 2) AS cost_per_hour
FROM project_machinery pm
JOIN machinery m ON pm.machinery_id = m.machinery_id
JOIN projects p ON pm.project_id = p.project_id
GROUP BY m.machinery_name, p.project_name, DATE_FORMAT(pm.assignment_start_date, '%Y-%m')
ORDER BY month DESC, total_usage_cost DESC;



-- Compliance summary for tenders per month
SELECT 
    DATE_FORMAT(tr.created_at, '%Y-%m') AS month,
    COUNT(DISTINCT tr.tender_id) AS tenders_analyzed,
    COUNT(*) AS total_requirements,
    COUNT(CASE WHEN rc.compliance_score >= 80 THEN 1 END) AS high_compliance,
    ROUND(AVG(rc.compliance_score), 2) AS avg_compliance_score
FROM tender_requirements tr
LEFT JOIN requirement_compliance rc ON tr.requirement_id = rc.requirement_id
GROUP BY DATE_FORMAT(tr.created_at, '%Y-%m')
ORDER BY month DESC;


-- Detect projects that have exceeded their estimated end date
SELECT 
    project_name,
    start_date,
    estimated_end_date,
    end_date,
    DATEDIFF(CURDATE(), estimated_end_date) AS days_late,
    status
FROM projects
WHERE (end_date IS NULL AND estimated_end_date < CURDATE())
   OR (end_date > estimated_end_date)
ORDER BY days_late DESC;

INSERT INTO tender_documents (tender_title, submission_deadline, tender_value, status)
VALUES 
('Airport Runway Extension', '2025-12-20', 2500000.00, 'submitted'),
('Highway Bridge Construction', '2025-11-30', 1800000.00, 'approved'),
('Hospital Renovation Project', '2025-12-15', 950000.00, 'draft'),
('School Building Expansion', '2026-01-10', 1200000.00, 'submitted');

