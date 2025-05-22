# ChartJS for Swift

Chart.js 的 SwiftUI 封装，让您可以在 iOS ~~和 macOS~~ 应用程序中轻松创建美观、响应式的图表。

![ChartJS@3x](https://github.com/user-attachments/assets/9051153e-7d07-4b4f-8da7-fa9ac1793349)

## 功能特点

- 支持 Chart.js 提供的各种图表类型（条形图、折线图、饼图、环形图等）
- 完全可定制的 Chart.js 配置选项
- 适用于 iOS 和 macOS（tvOS 和 watchOS 提供回退消息）
- 与 `Charts` 视图的 SwiftUI 集成
- 响应式设计，可适应不同屏幕尺寸

## 系统要求

- iOS 13.0+ / ~~macOS 10.15+~~（即将推出）
- Swift 5.9+
- Xcode 16.0+

## 安装

### Swift Package Manager

通过在 `Package.swift` 文件中添加以下内容来将此包添加到您的项目：

```swift
dependencies: [
    .package(url: "https://github.com/1998code/ChartJS-for-Swift", from: "1.0.0")
]
```

或者直接从 Xcode 添加：
1. 文件 > Swift Packages > 添加包依赖
2. 输入仓库 URL：`https://github.com/1998code/ChartJS-for-Swift`

## 用法

### 基本示例

```swift
import SwiftUI
import ChartJS

struct ContentView: View {
    let dataJson = """
    {
        "labels": ["一月", "二月", "三月", "四月", "五月", "六月"],
        "datasets": [{
            "label": "2025年销售额",
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
                    "text": "月度销售"
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
            
            Text("月度销售图表")
                .font(.caption)
        }
    }
}
```

### 多种图表类型

您可以通过更改配置中的 `type` 属性来创建不同类型的图表：

```swift
// 折线图
let lineConfigJson = """
{
    "type": "line",
    "options": {
        "responsive": true,
        "plugins": {
            "title": {
                "display": true,
                "text": "折线图"
            }
        }
    }
}
"""

// 饼图
let pieConfigJson = """
{
    "type": "pie",
    "options": {
        "responsive": true,
        "plugins": {
            "title": {
                "display": true,
                "text": "饼图"
            }
        }
    }
}
"""
```

### 响应式布局

为了获得最佳的响应式体验，请使用 GeometryReader：

```swift
GeometryReader { geometry in
    Charts(dataJson: dataJson, configJson: configJson)
        .frame(height: geometry.size.width > geometry.size.height ?
               geometry.size.height : // 横向
               geometry.size.height * 0.3) // 纵向
        .padding()
}
```

### 自定义 JavaScript

如果需要添加自定义 JavaScript 初始化，请使用 `scriptSetup` 参数：

```swift
let scriptSetup = """
<script>
    // 在图表初始化之前运行的自定义 JavaScript
    function customFunction() {
        console.log('自定义设置完成');
    }
    customFunction();
</script>
"""

Charts(dataJson: dataJson, configJson: configJson, scriptSetup: scriptSetup)
```

## 平台支持

- **iOS**：完全支持
- **macOS**：即将推出
- **tvOS**：（不支持 WebKit）
- **watchOS**：（不支持 WebKit）

## 故障排除

如果遇到任何问题：

1. 确保您的 JSON 是有效的
2. 检查您的数据结构是否符合 Chart.js 的预期
3. 对于复杂图表，请先在 Chart.js 网站上测试您的配置

## 许可证

本项目基于 MIT 许可证可用。有关更多信息，请参阅 LICENSE 文件。

## 致谢

- [Chart.js](https://www.chartjs.org/) - 简单而灵活的 JavaScript 图表库

---

## 翻译

本文档还提供以下语言版本：

[English](../README.md) | [繁中](README.zh-TW.md) / [简中](README.zh-CN.md) / [粵語](README.zh-HK.md) | [日本語](README.ja.md) | [Español](README.es.md)

欢迎通过 pull request 添加新的语言翻译或修正任何错误。