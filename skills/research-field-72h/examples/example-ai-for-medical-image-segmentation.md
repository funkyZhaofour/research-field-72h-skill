# Example: AI for Medical Image Segmentation 72h Breakthrough

## User Request

```text
帮我 72 小时了解 AI for medical image segmentation。
目标：准备组会，并判断后续是否能做实验复现。
```

## Routing

- Field: AI for medical image segmentation
- Domain: AI / CV / medical imaging
- Intent: field orientation + group meeting + reproduction triage
- Matched skill candidates:
  - `conf-papers` for CVPR, ICCV, ECCV, MICCAI, NeurIPS, ICLR, AAAI, ICML
  - `*-related-work` / `*-literature-positioning` for survey and Related Work framing
  - `*-experiments` / `*-reproducibility` / `*-artifact-evaluation` for code, datasets, and benchmark triage
  - `*-topic-selection` if the user wants to judge research value
  - `*-tables-figures` for field map and paper matrix
- Fallback: generic 72h SOP for any missing venue-specific medical imaging skill
- Source policy: metadata + abstracts + selected sections unless full text is provided

## Phase Plan

### 0-12h: Macro Mapping

Search queries:

- `"medical image segmentation" survey deep learning 2024`
- `"foundation model" "medical image segmentation" survey`
- `"MICCAI" "medical image segmentation" challenge`
- `"nnU-Net" "medical image segmentation"`
- `"MedSAM" "medical image segmentation"`

Expected output:

- `templates/field_map.md`
- 5-8 core questions, such as:
  - How does the field handle scarce labels?
  - Which models generalize across modalities and organs?
  - What is the role of foundation models and promptable segmentation?
  - How are datasets split across institutions and scanners?
  - Which metrics are clinically meaningful beyond Dice?

### 12-24h: Identify Teams

Sources:

- Google Scholar
- Semantic Scholar
- OpenAlex
- MICCAI proceedings
- Papers with Code
- Challenge leaderboards
- Lab and project pages

Expected output:

- `templates/author_profile.csv`
- Teams marked with representative papers, datasets, and source links.

### 24-36h: Terminology Compression

Candidate terms:

- Dice coefficient
- Hausdorff distance
- U-Net
- nnU-Net
- SAM / promptable segmentation
- domain shift
- multi-modal segmentation
- weak supervision
- semi-supervised segmentation
- cross-institution generalization

Expected output:

- `templates/terminology_table.csv`

### 36-48h: Code and Data Audit

Check:

- Papers with Code task pages
- Official GitHub repositories
- Project pages
- Dataset portals
- Challenge rules and data access requirements

First target:

- Run demo or inference on sample data only.
- Do not train from scratch.
- Do not tune hyperparameters.

Expected output:

- `templates/code_data_audit.md`

### 48-60h: Directed Reading

Select:

- Classic: 1 field-defining paper
- Core: 2 widely used or method-central papers
- Cutting-edge: 2 recent papers from strong venues or active benchmark threads

Record:

- Problem, method, dataset, metric, evidence level, limitations, source URL, and read level.

Expected output:

- `templates/paper_matrix.csv`

### 60-72h: Final Report

Expected output:

- `templates/final_72h_report.md`

## Safety Notes

- Do not claim clinical usefulness unless the source directly supports it.
- Distinguish medical image segmentation from general natural image segmentation.
- Distinguish official code from third-party reimplementations.
- Mark restricted datasets and unclear licenses as `需要人工确认`.
- Do not report benchmark rankings without checking date, task setting, dataset split, and metric.
