# research-field-72h

`research-field-72h` 是一个兼容 Claude / Codex 的科研 skill，用来执行“陌生科研领域 72 小时快速破冰 SOP”。

它不是一个自动写论文工具，而是一个 router / orchestrator：用户给出一个陌生研究领域关键词后，它会判断应该调用哪些已有科研 skills，并组织完成领域地图、文献矩阵、术语表、作者团队档案、代码数据排雷和最终 72 小时报告。

## 这个 Skill 能做什么

- 帮新人快速进入一个陌生科研领域。
- 根据领域自动判断是否应优先使用 `conf-papers`、会议 workflow、Related Work、实验复现、topic selection、tables/figures 等已有 skills。
- 如果没有精确匹配的 skill，就执行通用 72 小时 SOP。
- 输出结构化材料，包括：
  - 领域地图
  - 论文矩阵
  - 核心术语表
  - 作者/团队档案
  - 代码和数据可复现性排雷
  - 最终 72 小时 Markdown 报告

## 灵感来源与致谢

这个 skill 的 workflow 灵感来源于 [HKUDS/AI-Researcher](https://github.com/HKUDS/AI-Researcher) 项目相关的公开科普内容，以及抖音/小红书上关于“陌生科研领域 72 小时快速破冰 SOP”的帖子。

维护者提供的小红书分享链接：<http://xhslink.com/o/8UvoK3EXDIF>。

本仓库是对该 workflow 思路的 Claude/Codex skill 化封装，不是 HKUDS/AI-Researcher 的官方发布、fork 或关联项目。

## 兼容性

本仓库使用标准 skill 目录结构：

```text
skills/research-field-72h/SKILL.md
```

这个结构适合：

- Claude：把 `research-field-72h` 目录安装到 Claude skills 目录。
- Codex：把 `research-field-72h` 目录安装到 Codex skills 目录。

## 快速安装

克隆仓库：

```bash
git clone https://github.com/funkyZhaofour/research-field-72h-skill.git
cd research-field-72h-skill
```

安装到 Codex：

```bash
./scripts/install.sh --target codex
```

安装到 Claude：

```bash
./scripts/install.sh --target claude
```

同时安装到 Claude 和 Codex：

```bash
./scripts/install.sh --target both
```

默认安装路径：

- Codex：`~/.codex/skills/research-field-72h`
- Claude：`~/.claude/skills/research-field-72h`

如果你的 skill 目录不在默认位置，可以手动指定：

```bash
./scripts/install.sh --target both \
  --codex-dir "$HOME/.codex/skills" \
  --claude-dir "$HOME/.claude/skills"
```

## 使用示例

```text
帮我 72 小时了解机器人感知领域，目标是准备组会和后续实验复现。
```

```text
帮我快速进入 AI for medical image segmentation，输出领域地图、5 篇必读论文和可运行代码清单。
```

```text
帮我为 diffusion policy for robot manipulation 做一个 72 小时快速破冰报告。
```

## 72 小时流程

### 0-12 小时：宏观制图

- 搜 review / survey / tutorial / challenge。
- 优先近 3 年、高引用、权威 venue、活跃团队。
- 只读 Abstract、Introduction 末尾、Future Directions / Challenges。
- 输出 5-8 个高频问题。

### 12-24 小时：识别山头

- 提取综述作者、高频引用作者、核心团队。
- 查询 Google Scholar / Semantic Scholar / OpenAlex / AMiner 等来源。
- 输出作者、团队、机构、方向、代表论文、常用数据集、近年变化。

### 24-36 小时：术语降维

- 提取 10 个最高频术语。
- 每个术语解释：是什么、解决什么问题、为什么重要、容易混淆概念、代表论文。
- 要求能用两三句话讲给非本领域的人。

### 36-48 小时：环境排雷

- 搜 Papers with Code、GitHub、作者主页、benchmark。
- 优先官方代码、README 清楚、有 demo、有 pretrained model、依赖明确、近一年更新、issue 不爆炸。
- 第一轮目标只跑通 demo，不改模型不调参。

### 48-60 小时：定向阅读

选择 5 篇论文：

- Classic 1 篇
- Core 2 篇
- Cutting-edge 2 篇

阅读顺序：

1. 标题
2. 摘要
3. 图表
4. Introduction 最后一段
5. Method 开头和结尾
6. Experiments
7. Conclusion
8. Limitations

### 60-72 小时：符号和作者档案

- 建立统一数学符号表。
- 建立作者/团队档案。
- 输出最终 72 小时报告。

## 最终报告包含

1. 领域一句话解释
2. 领域地图
3. 5-8 个核心问题
4. 主流流派
5. 10 个核心术语
6. 5 篇必读论文
7. 主要作者/团队
8. 常用数据集和 benchmark
9. 可运行代码/不可运行代码列表
10. 未来 3 个可做 idea
11. 下一步 7 天学习计划

## 文件结构

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

## 重要原则

- 不要假装已经读完全文。
- 不要编造论文、作者、数据集、代码链接或 benchmark 结果。
- 每篇论文和代码仓库都要保留来源链接。
- 不确定时标注 `需要人工确认`。
- 第一目标是帮助新人快速建立领域地图，而不是自动写论文。

## 校验

运行：

```bash
./scripts/validate.sh
```

如果看到：

```text
Validation passed.
```

说明 skill 包结构完整。

## License

MIT
