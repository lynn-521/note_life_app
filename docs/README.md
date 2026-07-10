# 综合家庭管家（Family Butler）· 文档索引

本目录汇总 **App 端（Flutter）** 的产品与架构文档。后端相关文档见 `note_life_backend/docs/`。

## 文档清单

| 文档 | 说明 |
|------|------|
| [PRD.md](./PRD.md) | 产品需求文档《家庭管家产品设计 v0.1》—— 产品定位、用户故事、功能架构（5 Tab）、数据模型、同步与通知策略 |
| [architecture.md](./architecture.md) | App 端系统架构设计 + 任务分解（Riverpod + Drift 本地优先 + freezed + go_router，12 步落地任务） |
| [class-diagram.md](./class-diagram.md) | 21 实体类图（含 Repository 接口、通知/提醒/同步抽象、`AppDatabase`） |
| [sequence-diagram.md](./sequence-diagram.md) | 4 组核心时序图：入库预警、用药打卡、排菜反查、备忘/旅游 |

## 技术栈速览

- **Flutter** + **Riverpod**（状态管理）+ **Drift**（本地 SQLite，库存事件溯源：不存绝对值，库存 = Σ入库 − Σ出库）
- **freezed**（不可变模型）+ **go_router**（5 Tab `ShellRoute`）
- **联网**：`ApiClient` 双地址（内网 1500ms 优先 → 失败回退外网）+ `HttpSyncEngine`（整行 LWW 同步，离线进队列）

## 配套资源（研发期产出，仓库外）

- 设计系统原型：`prototype/DESIGN.md`（Soft Warm 设计令牌）、`prototype/index.html`（高保真原型）
- 后端架构：`note_life_backend/docs/architecture.md`

---

> 维护说明：PRD 与 `note_life_backend/docs/PRD.md` 内容一致，以本仓库 `docs/PRD.md` 为更新源；架构/类图/时序图改动请同步更新对应文档。
