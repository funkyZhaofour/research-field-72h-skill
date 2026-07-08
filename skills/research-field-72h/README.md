# research-field-72h

`research-field-72h` 是一个 router / orchestrator skill，用来执行“陌生科研领域 72 小时快速破冰 SOP”。

它不会替代已有科研 skills，而是根据用户输入的领域关键词和目标，选择合适的已有 skill 组合，例如：

- `conf-papers`：搜索 CVPR、ICCV、ECCV、ICLR、AAAI、NeurIPS、ICML 等顶会论文。
- `*-related-work` / `*-literature-positioning` / `*-literature-review`：做文献定位和 Related Work 准备。
- `*-workflow`：理解某个领域或 venue 的研究流程与审稿偏好。
- `*-experiments` / `*-reproducibility` / `*-artifact-evaluation`：检查代码、数据、benchmark 和实验可复现性。
- `*-topic-selection`：判断研究方向是否值得投入。
- `*-tables-figures`：整理图表、矩阵、领域地图和可视化。

如果没有精确匹配的 skill，它会执行通用 72 小时 SOP。

## 灵感来源与致谢

这个 skill 的 workflow 灵感来源于 [HKUDS/AI-Researcher](https://github.com/HKUDS/AI-Researcher) 项目相关的公开科普内容，以及抖音/小红书上关于“陌生科研领域 72 小时快速破冰 SOP”的帖子。

维护者提供的小红书分享链接：<http://xhslink.com/o/8UvoK3EXDIF>。

本仓库是对该 workflow 思路的 Claude/Codex skill 化封装，不是 HKUDS/AI-Researcher 的官方发布、fork 或关联项目。

## 典型用法

```text
帮我 72 小时了解 AI for medical image segmentation，目标是准备组会和后续复现实验。
```

```text
我想快速进入 diffusion policy for robotics manipulation 这个方向，帮我建立领域地图、核心论文和可复现代码清单。
```

```text
帮我为 federated learning in healthcare 写 Related Work 前做 72 小时破冰。
```

## 产物

默认会生成或填充这些文件：

```text
research-field-72h/
├── SKILL.md
├── README.md
├── examples/
│   └── example-ai-for-medical-image-segmentation.md
└── templates/
    ├── field_map.md
    ├── paper_matrix.csv
    ├── terminology_table.csv
    ├── author_profile.csv
    ├── code_data_audit.md
    └── final_72h_report.md
```

## 输出原则

- 不假装已经读完全文。
- 不编造论文、作者、数据集、代码链接或 benchmark 结果。
- 每篇论文和代码仓库都保留来源链接。
- 不确定时标注 `需要人工确认`。
- 第一目标是帮助新人建立领域地图，而不是自动写论文。

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
