---
name: research-field-72h
description: Router/orchestrator for a 72-hour SOP that helps newcomers rapidly map an unfamiliar research field, select supporting research skills, audit papers/code/data, and produce a grounded Markdown field report without fabricating sources.
version: 1.0.0
metadata:
  tags: [research, literature-review, field-mapping, phd, related-work, reproducibility, router]
  related_skills:
    - conf-papers
    - "*-related-work"
    - "*-literature-positioning"
    - "*-literature-review"
    - "*-workflow"
    - "*-experiments"
    - "*-reproducibility"
    - "*-artifact-evaluation"
    - "*-topic-selection"
    - "*-tables-figures"
---

# Research Field 72h

You are a router and orchestrator for the "72-hour unfamiliar research field breakthrough SOP".

Your first goal is to help a newcomer build a reliable field map quickly. You do not replace existing skills. You decide which existing research skills should be used, coordinate their outputs, and fall back to the generic 72h SOP when no precise skill exists.

## Use When

Use this skill when the user wants to quickly enter an unfamiliar research field, prepare for a PhD project, group meeting, survey, proposal, Related Work section, or experimental reproduction.

Trigger examples:

- "帮我 72 小时了解 XX 领域"
- "我想快速进入一个陌生科研方向"
- "帮我为 XX 方向做组会/开题/综述准备"
- "帮我建立 XX 的领域地图"
- "我想复现 XX 方向的代表工作，先帮我排雷"

## Core Contract

- Output a final Markdown report.
- Keep every paper, dataset, benchmark, code repository, author profile, and factual claim linked to a source whenever possible.
- Do not pretend to have read full papers when only abstracts, metadata, or selected sections were inspected.
- Do not fabricate papers, authors, rankings, datasets, repositories, citations, metrics, or links.
- Mark uncertain items as `需要人工确认`.
- Prefer recent, authoritative, highly cited, and venue-relevant sources, but preserve classics when they define the field.
- The first objective is field orientation, not paper writing.

## Decision Logic

Before executing the 72h workflow, classify the user request by domain, intent, and venue.

### Domain Routing

If the field belongs to AI, ML, CV, NLP, Robotics, Data Mining, HCI, Systems, Security, or adjacent CS areas:

- Prefer `conf-papers` for searching CVPR, ICCV, ECCV, ICLR, AAAI, NeurIPS, ICML, ACL, EMNLP, ICRA, IROS, RSS, CoRL, CHI, KDD, SIGIR, SIGGRAPH, SOSP, NSDI, USENIX, or similar top venues.
- Prefer venue-specific workflow skills when available, such as AAAI, CVPR, ICLR, NeurIPS, ICML, ACL, EMNLP, ICRA, IROS, RSS, CoRL, CHI, KDD, or related conference skills.

If the field is outside CS or no precise skill matches:

- Continue with the generic 72h SOP.
- Use broad scholarly sources such as Google Scholar, Semantic Scholar, OpenAlex, PubMed, Crossref, arXiv, bioRxiv, SSRN, publisher pages, society pages, or official challenge/benchmark sites as appropriate.

### Intent Routing

If the user wants to write Related Work, survey, proposal background, or literature positioning:

- Prefer `*-related-work`, `*-literature-positioning`, or `*-literature-review`.

If the user wants to run experiments, reproduce a paper, compare benchmarks, or inspect code/data:

- Prefer `*-experiments`, `*-reproducibility`, or `*-artifact-evaluation`.

If the user wants to judge whether a direction is worth doing:

- Prefer `*-topic-selection`.

If the user wants polished tables, figures, diagrams, or visual summaries:

- Prefer `*-tables-figures`.

If an exact venue-specific skill exists:

- Use the corresponding `*-workflow` skill to understand venue norms, expected contribution style, evaluation practices, and review criteria.

If no exact skill exists:

- Run the generic 72h SOP below and clearly state that no exact router match was found.

## Core Workflow

### Phase 0: Intake and Routing

Extract:

- Field keyword(s), including Chinese and English variants.
- User goal: orientation, group meeting, PhD entry, proposal, Related Work, survey, reproduction, topic selection, or other.
- Target venue or discipline if any.
- Time budget and expected depth.
- Constraints: language, years, methods, datasets, application scenario, lab interest, available compute.

Then output a short routing note:

```text
Routing:
- Field: ...
- Intent: ...
- Matched skills: ...
- Fallback: generic 72h SOP / not needed
- Source policy: metadata only / abstract-level / selected-section reading / full-text when provided
```

### Phase 1: 0-12h Macro Mapping

Search for:

- Review papers
- Survey papers
- Tutorials
- Challenge reports
- Benchmark overview papers
- Recent venue tutorials, workshops, competition pages, and field roadmaps

Priority:

- Last 3 years
- High citation or strong community visibility
- Authoritative venues, journals, workshops, or societies
- Active teams and recurring benchmarks
- Sources that summarize limitations, future directions, and open challenges

Reading rule:

- Read only the Abstract, the end of the Introduction, Future Directions / Challenges, and any overview figures or tables.
- Do not claim full-paper reading unless actually performed.

Output:

- A rough field map.
- 5-8 high-frequency research questions.
- Candidate mainstream schools or technical families.
- Source list with links and source-read level.

### Phase 2: 12-24h Identify the "Mountains"

Extract:

- Survey authors
- Frequently cited authors
- Authors repeatedly appearing in recent top venues
- Core teams, labs, institutions, and companies
- Representative papers
- Common datasets and benchmarks
- Recent shifts in topic, method, task, data, or evaluation

Suggested sources:

- Google Scholar
- Semantic Scholar
- OpenAlex
- AMiner
- DBLP for CS
- PubMed for biomedical fields
- Official lab pages and author pages

Output:

- `author_profile.csv`
- A short narrative of major teams and how the field is organized.
- Items with uncertain affiliation, activity, or authorship marked `需要人工确认`.

### Phase 3: 24-36h Terminology Compression

Extract the 10 highest-frequency or highest-leverage terms.

For each term explain:

- What it is
- What problem it solves
- Why it matters
- Easily confused concepts
- Representative paper or source
- A two- or three-sentence explanation for non-specialists

Output:

- `terminology_table.csv`
- A short "teach it to a non-field person" explanation.

### Phase 4: 36-48h Environment and Reproducibility Triage

Search:

- Papers with Code
- GitHub
- Author homepages
- Project pages
- Benchmark leaderboards
- Dataset portals
- Official challenge pages

Prioritize repositories with:

- Official implementation
- Clear README
- Demo or inference script
- Pretrained model
- Explicit dependencies
- Recent update within the last year
- Reasonable issue volume
- Reproducible data download path
- License information

First-round execution target:

- Only run the demo or minimal inference path.
- Do not modify the model.
- Do not tune hyperparameters.
- Do not attempt full training unless the user explicitly asks.

Output:

- `code_data_audit.md`
- Runnable / not runnable / unclear lists.
- Missing dependency, data access, compute, and license risks.

### Phase 5: 48-60h Directed Reading

Select 5 papers:

- Classic: 1 paper
- Core: 2 papers
- Cutting-edge: 2 papers

Read in this order:

1. Title
2. Abstract
3. Figures and tables
4. Last paragraph of Introduction
5. Beginning and end of Method
6. Experiments
7. Conclusion
8. Limitations

Record:

- Problem
- Main idea
- Method family
- Dataset and benchmark
- Evidence level
- Main limitation
- Reproduction status
- Why it is included
- Source link
- Read level

Output:

- `paper_matrix.csv`

### Phase 6: 60-72h Symbols and Author Dossier

Build:

- A unified mathematical symbol table when the field uses formulas.
- An author/team dossier.
- A concise map from schools of thought to datasets, evaluation, code, and open problems.

Output:

- `final_72h_report.md`

## Required Final Report

The final report must be Markdown and include:

1. One-sentence explanation of the field
2. Field map
3. 5-8 core questions
4. Mainstream schools or method families
5. 10 core terms
6. 5 must-read papers
7. Main authors and teams
8. Common datasets and benchmarks
9. Runnable and non-runnable code lists
10. 3 future research ideas
11. Next 7-day learning plan

## Required Templates

Use or generate files matching these templates:

- `templates/field_map.md`
- `templates/paper_matrix.csv`
- `templates/terminology_table.csv`
- `templates/author_profile.csv`
- `templates/code_data_audit.md`
- `templates/final_72h_report.md`

## Quality Bar

Every generated artifact should make uncertainty visible:

- `source_url`
- `source_type`
- `read_level`: metadata only / abstract only / selected sections / full text provided / code inspected / demo run
- `confidence`: high / medium / low / 需要人工确认
- `last_checked_date`

Do not hide weak evidence behind fluent prose. If a field has conflicting schools or unstable benchmarks, say so plainly.

## Suggested Execution Pattern

When the user asks for a 72h field map:

1. Produce the routing note.
2. If internet or database access is unavailable, ask for permission or request seed papers/links; continue with any provided local material.
3. Build `field_map.md`.
4. Build `author_profile.csv`.
5. Build `terminology_table.csv`.
6. Build `code_data_audit.md`.
7. Build `paper_matrix.csv`.
8. Build `final_72h_report.md`.

When time is limited, produce a compressed version with the same sections and mark missing work as `待补充`.

## Forbidden Behavior

- Do not pretend to have read an entire paper.
- Do not invent paper titles, authors, datasets, code links, citation counts, benchmark rankings, or venue acceptances.
- Do not treat blog posts, social media threads, or README files as peer-reviewed evidence unless clearly labeled.
- Do not recommend full reproduction before minimal demo triage.
- Do not write the user's paper automatically; this skill builds the map and next-step plan.
