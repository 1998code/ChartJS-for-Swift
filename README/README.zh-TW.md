# ChartJS for Swift

Chart.js 的 SwiftUI 封裝，讓您可以在 iOS ~~和 macOS~~ 應用程式中輕鬆建立美觀、響應式的圖表。

![ChartJS@3x](https://github.com/user-attachments/assets/9051153e-7d07-4b4f-8da7-fa9ac1793349)

## 功能特點

- 支援 Chart.js 提供的各種圖表類型（條形圖、折線圖、圓餅圖、環形圖等）
- 完全可定制的 Chart.js 配置選項
- 適用於 iOS 和 macOS（tvOS 和 watchOS 提供回退訊息）
- 與 `Charts` 視圖的 SwiftUI 整合
- 響應式設計，可適應不同屏幕尺寸

## 系統要求

- iOS 13.0+ / ~~macOS 10.15+~~（即將推出）
- Swift 5.9+
- Xcode 16.0+

## 安裝

### Swift Package Manager

通過在 `Package.swift` 文件中添加以下內容來將此套件添加到您的專案：

```swift
dependencies: [
    .package(url: "https://github.com/1998code/ChartJS-for-Swift", from: "1.0.0")
]
```

或者直接從 Xcode 添加：
1. 文件 > Swift Packages > 添加套件依賴
2. 輸入儲存庫 URL：`https://github.com/1998code/ChartJS-for-Swift`

## 使用方法

### 基本示例

```swift
import SwiftUI
import ChartJS

struct ContentView: View {
    let dataJson = """
    {
        "labels": ["一月", "二月", "三月", "四月", "五月", "六月"],
        "datasets": [{
            "label": "2025年銷售額",
            "data": [12, 19, 3, 5, 2, 3],
            "backgroundColor": "rgba(75, 192, 192, 0.2)",
            "borderColor": "rgba(75, 192, 192, 1)",
            "borderWidth": 1
        }]
    }
    """
    
    let configJson = """
    {
        "type": "bar",
        "options": {
            "responsive": true,
            "plugins": {
                "title": {
                    "display": true,
                    "text": "月度銷售"
                }
            },
            "scales": {
                "y": {
                    "beginAtZero": true
                }
            }
        }
    }
    """
    
    var body: some View {
        VStack {
            Charts(dataJson: dataJson, configJson: configJson)
                .frame(height: 300)
                .padding()
            
            Text("月度銷售圖表")
                .font(.caption)
        }
    }
}
```

### 多種圖表類型

您可以通過更改配置中的 `type` 屬性來創建不同類型的圖表：

```swift
// 折線圖
let lineConfigJson = """
{
    "type": "line",
    "options": {
        "responsive": true,
        "plugins": {
            "title": {
                "display": true,
                "text": "折線圖"
            }
        }
    }
}
"""

// 圓餅圖
let pieConfigJson = """
{
    "type": "pie",
    "options": {
        "responsive": true,
        "plugins": {
            "title": {
                "display": true,
                "text": "圓餅圖"
            }
        }
    }
}
"""
```

### 響應式布局

為了獲得最佳的響應式體驗，請使用 GeometryReader：

```swift
GeometryReader { geometry in
    Charts(dataJson: dataJson, configJson: configJson)
        .frame(height: geometry.size.width > geometry.size.height ?
               geometry.size.height : // 橫向
               geometry.size.height * 0.3) // 縱向
        .padding()
}
```

### 自定義 JavaScript

如果需要添加自定義 JavaScript 初始化，請使用 `scriptSetup` 參數：

```swift
let scriptSetup = """
<script>
    // 在圖表初始化之前運行的自定義 JavaScript
    function customFunction() {
        console.log('自定義設置完成');
    }
    customFunction();
</script>
"""

Charts(dataJson: dataJson, configJson: configJson, scriptSetup: scriptSetup)
```

## 平台支持

- **iOS**：完全支持
- **macOS**：即將推出
- **tvOS**：（不支持 WebKit）
- **watchOS**：（不支持 WebKit）

## 故障排除

如果遇到任何問題：

1. 確保您的 JSON 是有效的
2. 檢查您的數據結構是否符合 Chart.js 的預期
3. 對於複雜圖表，請先在 Chart.js 網站上測試您的配置

## 許可證

本項目基於 MIT 許可證可用。有關更多信息，請參閱 LICENSE 文件。

## 致謝

- [Chart.js](https://www.chartjs.org/) - 簡單而靈活的 JavaScript 圖表庫

---

## 翻譯

本文檔還提供以下語言版本：

[English](../README.md) | [繁中](README.zh-TW.md) / [简中](README.zh-CN.md) / [粵語](README.zh-HK.md) | [日本語](README.ja.md) | [Español](README.es.md)

歡迎通過 pull request 添加新的語言翻譯或修正任何錯誤。