# 综合家庭管家（Family Butler）

本地优先的家庭管理 Flutter 应用，覆盖 **仓库 / 健康 / 餐桌 / 生活 / 我的** 五大模块。

## 技术栈

- Flutter 3.22+
- 状态管理：Riverpod 2.x
- 本地数据库：Drift（SQLite，类型安全 + 代码生成）
- 路由：go_router（5 个底部 Tab 的 `StatefulShellRoute`）
- 原生化 UI：自定义设计系统（Soft Warm），无第三方 UI 组件库

## 模块一览

| Tab | 模块 | 能力 |
| --- | --- | --- |
| 📦 仓库 | `storage` | 商品库存、临期 / 补货提醒、入库 |
| 💊 健康 | `health` | 家庭成员用药打卡、进度环 |
| 🍽️ 餐桌 | `dining` | 菜谱库浏览、今日菜单排菜、食材缺口反查 |
| 📝 生活 | `life` | 备忘录 CRUD、旅游计划书（行程 / 行李 / 预算） |
| 👤 我的 | `mine` | 家庭成员、提醒开关、微信绑定（占位）、同步状态（占位） |

## 本地运行

> 需已安装 Flutter SDK（>= 3.22）并配置好设备或模拟器。

```bash
# 1. 安装依赖
flutter pub get

# 2. 生成 freezed / drift / json_serializable 代码
dart run build_runner build --delete-conflicting-outputs

# 3. 运行
flutter run
```

## 范围说明（MVP）

- ✅ 5 个底部 Tab 全部可用，数据本地持久化（Drift / SQLite）。
- ✅ 餐桌：菜谱库只读浏览 + 排菜（写入今日菜单）+ 食材缺口反查提示。
- ✅ 生活：备忘录与旅游计划书完整 CRUD（行程 / 行李 / 预算）。
- ⏳ 菜谱编辑（增删改）留待 P1。
- ⏳ 微信绑定为占位（显示「待绑定」），未接入真实微信。
- ⏳ 后端同步为本地桩（显示「本地优先 · 未连接服务器」），真实联网同步后续改造。

## 架构文档

详见 `../docs/`：

- `system_design.md` — 系统设计与模块拆分（T05~T12）
- `家庭管家产品设计.md` — 产品需求与字段定义
- `../prototype/DESIGN.md` — Soft Warm 设计系统与反模式
- `../prototype/index.html` — 逐屏原型
