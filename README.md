# research-field-72h

[中文说明](README.zh-CN.md)

`research-field-72h` is a Claude/Codex-compatible research skill for the "72-hour unfamiliar research field breakthrough SOP".

It is designed as a router / orchestrator: given a research-field keyword, it decides which existing research skills should be used, coordinates literature search, author/team mapping, terminology compression, code/data audit, directed reading, and final reporting.

## What This Skill Does

- Builds a fast field map for an unfamiliar research area.
- Routes AI/ML/CV/NLP/Robotics requests to conference-paper and venue workflow skills when available.
- Routes Related Work, experiments, reproducibility, topic-selection, and tables/figures tasks to matching skills when available.
- Falls back to a generic 72-hour research SOP when no precise skill exists.
- Produces structured artifacts: field map, paper matrix, terminology table, author profile, code/data audit, and final 72h report.

## Inspiration and Attribution

This skill was inspired by public educational content from [HKUDS/AI-Researcher](https://github.com/HKUDS/AI-Researcher) and related Douyin/Xiaohongshu posts about "陌生科研领域 72 小时快速破冰 SOP".

The Xiaohongshu link shared by the maintainer is: <http://xhslink.com/o/8UvoK3EXDIF>.

This repository is an independent Claude/Codex-compatible skill packaging of that workflow idea. It is not an official HKUDS/AI-Researcher release, fork, or affiliated project.

## Compatibility

This repository uses the standard skill-directory layout:

```text
skills/research-field-72h/SKILL.md
```

That layout is suitable for both:

- Claude-style skills: install the `research-field-72h` directory under your Claude skills directory.
- Codex-style skills: install the `research-field-72h` directory under your Codex skills directory.

The skill itself is self-contained and includes `README.md`, `examples/`, and `templates/`.

## Quick Install

Clone the repository:

```bash
git clone https://github.com/funkyZhaofour/research-field-72h-skill.git
cd research-field-72h-skill
```

Install for Codex:

```bash
./scripts/install.sh --target codex
```

Install for Claude:

```bash
./scripts/install.sh --target claude
```

Install for both:

```bash
./scripts/install.sh --target both
```

By default, the installer uses:

- Codex: `~/.codex/skills/research-field-72h`
- Claude: `~/.claude/skills/research-field-72h`

You can override either location:

```bash
./scripts/install.sh --target both \
  --codex-dir "$HOME/.codex/skills" \
  --claude-dir "$HOME/.claude/skills"
```

## Usage Examples

```text
帮我 72 小时了解机器人感知领域，目标是准备组会和后续实验复现。
```

```text
I want to quickly understand AI for medical image segmentation. Please build a 72-hour field map and identify runnable code.
```

```text
帮我为 diffusion policy for robot manipulation 做一个 72 小时快速破冰报告。
```

## Expected Output

The final Markdown report must include:

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

## Safety and Evidence Rules

- Do not pretend full papers were read when only metadata, abstracts, or selected sections were inspected.
- Do not fabricate paper titles, authors, repositories, datasets, citation counts, benchmark rankings, or links.
- Keep source links for papers and code repositories.
- Mark uncertain items as `需要人工确认`.
- Treat the first objective as field orientation, not automatic paper writing.

## Repository Structure

```text
.
├── README.md
├── README.zh-CN.md
├── ACKNOWLEDGEMENTS.md
├── LICENSE
├── skill-manifest.json
├── scripts/
│   ├── install.sh
│   └── validate.sh
└── skills/
    └── research-field-72h/
        ├── SKILL.md
        ├── README.md
        ├── examples/
        │   └── example-ai-for-medical-image-segmentation.md
        └── templates/
            ├── author_profile.csv
            ├── code_data_audit.md
            ├── field_map.md
            ├── final_72h_report.md
            ├── paper_matrix.csv
            └── terminology_table.csv
```

## Validation

Run:

```bash
./scripts/validate.sh
```

The validation script checks that required files exist, the skill frontmatter is present, and CSV template row widths are consistent.

## License

MIT
