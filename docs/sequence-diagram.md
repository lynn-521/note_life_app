```mermaid
%% ============ 4.1 入库 -> 库存聚合 -> 临期/低库存预警 ============
sequenceDiagram
    actor U as 用户
    participant VP as InboundFormView
    participant NP as inboundFormNotifier
    participant IR as InventoryRepository
    participant DB as AppDatabase/DAO
    participant RE as LocalReminderEngine
    participant RD as ReminderDispatcher
    participant CH as LoggingNotificationChannel
    participant RL as ReminderLog

    U->>VP: 填表(商品/分类/数量/有效期)
    VP->>NP: submit(InboundInput)
    NP->>IR: recordInbound(input)
    IR->>DB: insert InboundOrder + StockBatch
    DB-->>IR: ok
    IR-->>NP: success
    NP->>RE: scanAndFireRules()
    RE->>DB: 聚合查询(临期/低库存: Σ入库−Σ出库)
    DB-->>RE: 命中规则集
    loop 每个命中且未限频的 ReminderRule
        RE->>RD: dispatch(rule)
        RD->>CH: send(targets, title, body, payload)
        CH-->>RD: SendResult(success)
        RD->>RL: insert(log)
    end
    NP-->>VP: state = success
    VP-->>U: Toast「入库单已生成」+ 刷新列表

%% ============ 4.2 用药到点 -> 提醒 -> 打卡 ============
sequenceDiagram
    participant Sched as LocalReminderEngine
    participant FLN as flutter_local_notifications
    participant U as 家庭成员
    participant HP as HealthPage(今日待服)
    participant CP as medicationCheckInNotifier
    participant MR as MedicationRepository
    participant DB as DAO

    Note over Sched: App 启动 scheduleDoseReminders(memberId)
    Sched->>DB: 读 active Medication + DoseSchedule
    Sched->>FLN: zonedSchedule(时间点, "该服药: 药名 剂量")
    FLN-->>U: 系统通知(本地)
    U->>HP: 打开健康 Tab -> 待服项
    U->>HP: 点「已服」
    HP->>CP: checkIn(doseLogId, done)
    CP->>MR: checkIn(...)
    MR->>DB: upsert DoseLog(done, takenAt=now)
    DB-->>MR: ok
    MR-->>CP: success
    CP-->>HP: 刷新进度环 + confetti
    HP-->>U: 进度环更新 + 撒花

%% ============ 4.3 菜谱排菜 -> 食材反查 ============
sequenceDiagram
    actor U as 用户
    participant DP as DiningPage
    participant RP as RecipeRepository
    participant DB as DAO
    participant IR as InventoryRepository

    U->>DP: 选早/午/晚 + 加菜
    DP->>RP: addDailyMeal(date, mealType, recipeId)
    RP->>DB: insert DailyMeal
    DP->>RP: getRecipe(recipeId)
    RP->>DB: 读 Recipe.ingredients(Product ref)
    DB-->>DP: 食材清单
    DP->>IR: currentStockForIngredients(productIds)
    IR->>DB: 聚合各商品库存
    DB-->>IR: 库存映射
    IR-->>DP: 缺口(缺 冰糖)
    DP-->>U: 渲染「缺 冰糖」徽标 + 可选「生成补货项」

%% ============ 4.4 备忘录 / 旅游计划书 ============
sequenceDiagram
    actor U as 用户
    participant LP as LifePage
    participant MR as MemoRepository/TravelRepository
    participant DB as DAO
    participant RE as LocalReminderEngine

    U->>LP: 新建备忘录(标题/内容/到期?)
    LP->>MR: saveMemo(Memo)
    MR->>DB: insert Memo(软删字段)
    opt 设有 dueAt
        LP->>RE: scheduleMemoReminder(memo)
        RE->>FLN: zonedSchedule(dueAt, "备忘到期: ...")
    end
    LP-->>U: 列表刷新

    U->>LP: 新建旅游计划书(标题/起止/成员)
    LP->>MR: saveTravelPlan(plan)
    MR->>DB: insert TravelPlan + TravelDay + TravelItem
    LP-->>U: 行程/行李/预算卡片
```
