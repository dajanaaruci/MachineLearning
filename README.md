# AI Tender Analysis System 🏗️

An advanced artificial intelligence-driven system for automated construction tender document processing, requirement extraction, and procurement decision support. Specifically engineered for Albanian-language construction procurement with multilingual capabilities.

**Research Paper:** Diploma Thesis - MSc Data Science and Business Analytics  
**University of New York Tirana** | Faculty of Engineering and Architecture  
**Author:** Dajana Aruçi | **Supervisor:** Prof. Ledion Liço  

---

## 📋 Overview

The AI Tender Analysis System automates construction procurement workflows by processing tender documents through semantic search, natural language processing, and intelligent requirement extraction. The system reduces procurement personnel time allocation by 40-50% compared to traditional manual evaluation methodologies while improving accuracy and decision quality.

### Key Capabilities

- **Multilingual Document Processing** - Native support for Albanian with 50+ language support via multilingual embeddings
- **Intelligent Requirement Extraction** - Hybrid pattern-based and semantic extraction achieving 90.8% F1-score for machinery requirements
- **Tender Criteria Matching** - 27-criterion evaluation framework based on OGC procurement standards with 79% average accuracy
- **Comprehensive Database Architecture** - 12-table relational schema tracking complete project lifecycle from tender opportunity through financial closure
- **Real-time Analysis** - Process 200K+ character documents in 20-24 seconds
- **Actionable Recommendations** - YES/MAYBE/NO recommendations with detailed scoring breakdowns

---

## 🎯 Research Objectives

### Primary Objectives

1. **Multilingual Tender Analysis Framework**
   - Minimum 80% accuracy in requirement identification validated against expert judgment
   - Support for 100-300 page documents within 30-second processing timeframe
   - Iterative processing with model improvement capabilities

2. **AI Integration with Domain Knowledge**
   - Semantic search with normalized similarity scoring (0-1 scale)
   - Hybrid extraction combining pattern-based and semantic methods
   - Quantitative confidence metrics for each extracted requirement

3. **Comprehensive Database Architecture**
   - Complete procurement lifecycle tracking
   - Cost variance analysis at granular activity levels
   - Hierarchical resource modeling for machinery, personnel, and materials
   - Predictive bidding intelligence capabilities

---
### Performance Metrics

- **Processing Time:** 20-24 seconds per document (200K characters)
- **Memory Usage:** 300-400 MB per document
- **Scalability:** Linear relationship - 0.1 seconds per 1,000 characters
- **Model Size:** 55 MB (efficient deployment)

### Test Tenders

1. **Bridge Construction Project** (REF-45782/2024) - €8.5M | 117 pages
2. **Wastewater Treatment Facility** (APP-23456/2024) - €3.2M | 75 pages
3. **Road Reconstruction Project** (INF-78901/2024) - €6.8M | 98 pages

---

## 🏗️ System Architecture

```
Input PDF Document
        ↓
[Stage 1] Document Input & Text Extraction
        ↓
[Stage 2] Text Preprocessing & Normalization
        ↓
[Stage 3] Intelligent Text Chunking (594 chunks from 211K characters)
        ↓
[Stage 4] Semantic Embedding Generation (384-dimensional vectors)
        ↓
┌──────────────────────────────────────────────┐
│         PARALLEL EXTRACTION ENGINES          │
├──────────────────────────────────────────────┤
│ [Stage 5] Machinery Extraction               │
│ [Stage 6] Staff Extraction                   │
│ [Stage 7] Certification Extraction           │
│ [Stage 8] Tender Criteria Matching (27 items)│
└──────────────────────────────────────────────┘
        ↓
[Stage 9] Assessment Aggregation & Scoring
        ↓
[Stage 10] Multi-Format Report Generation
        ↓
Output: JSON | Plain Text | Excel | HTML Dashboard
```

---

## 🛠️ Technology Stack

### Core Dependencies

```
Python 3.8+
PyMuPDF (fitz) - PDF processing
Sentence-Transformers - Semantic embeddings
NumPy - Numerical computation
Pandas - Data manipulation
MySQL Connector - Database operations
Flask - API framework (optional)
```

### AI/ML Components

- **Embedding Model:** `paraphrase-multilingual-MiniLM-L12-v2`
- **Vector Dimension:** 384-dimensional semantic space
- **Similarity Metric:** Normalized cosine similarity (0-1 scale)
- **Language Support:** 50+ languages including Albanian

### Database

- **Engine:** MySQL 5.7+
- **Schema:** 12 core tables with 9 relational tables
- **Storage:** Hybrid relational-JSON architecture
- **Integrity:** Foreign keys, unique constraints, check constraints

---

## 📦 Installation

### Prerequisites

- Python 3.8 or higher
- MySQL 5.7 or higher
- 4GB RAM minimum (8GB recommended)
- 500MB disk space for models and dependencies

## 📚 Key Features Explained

### 1. Machinery Extraction
Extracts construction equipment requirements through pattern matching and quantity extraction.

**Algorithm:**
- Keyword matching against 200+ equipment types
- Pattern recognition for quantity expressions (e.g., "8 copë", "Sasia: 5")
- **Performance:** 90.8% F1-score

**Example:**
```
Input: "Kamion Damper: 8 copë"
Output: {"type": "truck", "quantity": 8, "specification": "dump truck"}
```

### 2. Staff Extraction
Identifies required personnel positions and quantities.

**Algorithm:**
- Pattern matching for standardized position format: "N (nje) Position"
- Position normalization to standard categories
- **Performance:** 83.3% F1-score

**Example:**
```
Input: "1 (nje) Inxhinier Ndertimi (Civil Engineer)"
Output: {"position": "Civil Engineer", "quantity": 1}
```

### 3. Tender Criteria Matching
Evaluates 27 procurement criteria across 7 categories using semantic search.

**Categories:**
1. Administrative Compliance (5 criteria)
2. Technical Capacity (5 criteria)
3. Financial Viability (4 criteria)
4. Quality and Safety Systems (4 criteria)
5. Offer Evaluation Methods (3 criteria)
6. Social and Legal Responsibility (3 criteria)
7. Special Requirements (3 criteria)

**Performance:** 79% average accuracy

### 4. Scoring Framework

```
Overall Score = 
  0.25 × Machinery Match +
  0.25 × Staff Match +
  0.20 × Certifications Match +
  0.30 × Criteria Match

Recommendation Logic:
  Score ≥ 75% + Deadline > 7 days → YES
  60% ≤ Score < 75% + No red flags → MAYBE
  Otherwise → NO
```

---

## 🗄️ Database Schema Overview

### Core Tables

- **tender_documents** - Tender metadata and document content
- **tender_requirements** - Extracted requirements from tenders
- **projects** - Construction project records
- **machinery** - Equipment fleet inventory
- **employees** - Personnel records with certifications
- **vendors** - External suppliers and contractors
- **project_machinery** - Machinery allocation to projects
- **project_employees** - Staff allocation to projects
- **project_expenses** - Detailed expenditure tracking
- **project_budget_breakdown** - Budget disaggregation by category
- **machinery_costs** - Equipment lifecycle costs
- **compliance_audit** - Regulatory compliance tracking

**Schema Features:**
- Referential integrity through foreign keys
- Unique constraints preventing duplicates
- Check constraints ensuring valid values
- Audit triggers for change tracking
- Cost variance analysis capabilities
- JSON fields for flexible attributes

---

## 🔍 Extraction Methodology

### Hybrid Extraction Approach

```
Requirement Type         → Methodology           → Confidence
─────────────────────────────────────────────────────────────
Machinery              → Pattern-Based         → High Precision
Staff Positions        → Pattern-Based         → High Precision
Certifications         → Semantic + Pattern    → Moderate
Tender Criteria        → Semantic Search       → Reasonable
Experience/Capability  → Semantic Search       → Context-Aware
```


## 🌐 Live Demo

**Interactive UI:** https://tender-parse-insight.lovable.app

Explore the system's capabilities through the web interface:
- Upload tender documents
- View real-time extraction results
- Compare AI recommendations with expert judgment
- Export analysis reports


## 🎓 Research Contributions

This research addresses significant gaps in construction procurement automation:

1. **Technical Feasibility** - Demonstrates multilingual AI-driven tender analysis is operationally viable
2. **Non-English Markets** - First comprehensive system engineered for Albanian construction procurement
3. **Hybrid Extraction** - Establishes pattern-based + semantic hybrid approaches outperform either method alone
4. **Organizational Value** - Validates 40-50% time savings in procurement workflows
5. **Database Integration** - Creates comprehensive schema connecting tender requirements to organizational resources and financial forecasting

