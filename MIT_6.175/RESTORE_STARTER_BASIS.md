# MIT 6.175 Starter 还原说明（依据清单）

## 目标
将当前仓库中的 `lab` / `project` 从“完成版/作答版”还原到“starter code（可继续做题）”状态。

## 依据来源
本次修改基于以下可追溯依据：

1. `./html` 中每个实验/项目的 deliverables 与 exercise 描述  
   - 用于确定哪些文件属于“学生作答文件”，应回到 TODO/骨架状态。
2. 本仓库 `git` 历史中的“initial checkin”提交  
   - 用于直接恢复已有 starter 版本文件，优先级最高。
3. 若仓库历史无对应 starter 文件（尤其 `project`），按 `html` 要求手工恢复为最小 TODO/stub 骨架。

---

## 具体还原策略

### A. 直接按历史提交恢复（有明确 starter 提交）

#### Lab5
- `lab5/src/TwoCycle.bsv` <- `e4292c6` (`lab5 TwoCycle initial checkin`)
- `lab5/src/FourCycle.bsv` <- `a043b6a` (`lab5 FourCycle initial checkin`)
- `lab5/src/TwoStage.bsv` <- `d57b8f4` (`lab5 TwoStage initial checkin`)
- `lab5/src/TwoStageBTB.bsv` <- `419f00b` (`lab5 TwoStageBTB initial checkin`)

#### Lab6
- `lab6/src/SixStage.bsv` <- `31feaa4` (`lab6 initial checkin`)
- `lab6/src/SixStageBHT.bsv` <- `31feaa4` (`lab6 initial checkin`)
- `lab6/src/includes/Bht.bsv` <- `4b148a0` (`lab6 bht init`)

#### Lab7
- `lab7/src/WithoutCache.bsv` <- `be4285a` (`lab7 initial checkin`)
- `lab7/src/WithCache.bsv` <- `be4285a` (`lab7 initial checkin`)

#### Lab8
- `lab8/src/ExcepProc.bsv` <- `83200bf` (`peek lab8`)

---

### B. 按 `html` 作业要求手工骨架化（历史中无同名 starter 可直接取）

依据 `html` 的 deliverables / exercise，以下文件被还原为 TODO/stub 结构：

#### Lab1
- `lab1/Multiplexer.bsv`
- `lab1/Adders.bsv`

#### Lab2
- `lab2/Fifo.bsv`
- `lab2/Fft.bsv`

#### Lab3
- `lab3/Multipliers.bsv`
- `lab3/TestBench.bsv`

#### Lab4
- `lab4/MyFifo.bsv`

#### Project
- `project/src/includes/MessageFifo.bsv`
- `project/src/includes/MessageRouter.bsv`
- `project/src/includes/DCache.bsv`
- `project/src/includes/PPP.bsv`
- `project/src/includes/Bht.bsv`
- `project/src/SixStage.bsv`

> 这些文件在当前仓库历史中没有“官方 starter 原件”可直接定位（或已被后续多次改写且无单独 starter commit），因此按实验文档中的任务边界恢复为可继续作答的最小骨架。

---

## discussion 文件处理依据

`html` 中各 lab 均要求提交 `discussion.txt`（lab8 也有 discussion question），因此补齐/重建了以下模板文件：

- `lab1/discussion.txt`
- `lab2/discussion.txt`
- `lab3/discussion.txt`
- `lab4/discussion.txt`
- `lab5/discussion.txt`
- `lab6/discussion.txt`
- `lab7/discussion.txt`
- `lab8/discussion.txt`

模板仅保留题号占位，不包含具体答案。

---

## 还原结果判定标准

本次“starter 状态”按以下标准判定：

1. 实验要求学生实现的文件恢复为 TODO/空实现/最小编译骨架。
2. 非学生作答的基础设施文件尽量不改。
3. 能明确对应历史 starter 的文件，优先严格回退到对应 commit 内容。

---

## 注意事项

1. 当前状态是“可继续做题”的 starter，不是“可通过全部测试”的完成态。
2. `html/` 与 `make.sh` 属于未跟踪文件（本次未作为还原目标）。
3. 若你后续希望“100%对齐某学期官方初始包”，可再指定一个唯一上游基线（例如课程官方压缩包或仓库 tag），我可以再做一次逐文件校准。
