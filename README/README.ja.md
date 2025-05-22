# ChartJS for Swift

Chart.js のための SwiftUI ラッパーで、iOS ~~および macOS~~ アプリケーションで美しいレスポンシブチャートを簡単に作成できます。

![ChartJS@3x](https://github.com/user-attachments/assets/9051153e-7d07-4b4f-8da7-fa9ac1793349)

## 特徴

- Chart.js がサポートする様々なチャートタイプ（棒グラフ、折れ線グラフ、円グラフ、ドーナツグラフなど）を作成可能
- Chart.js の設定オプションで完全にカスタマイズ可能
- iOS と macOS で動作（tvOS と watchOS はフォールバックメッセージを表示）
- `Charts` ビューによる SwiftUI 統合
- 様々な画面サイズに適応するレスポンシブデザイン

## 要件

- iOS 13.0+ / ~~macOS 10.15+~~（近日公開）
- Swift 5.9+
- Xcode 16.0+

## インストール

### Swift Package Manager

`Package.swift` ファイルに以下を追加して、このパッケージをプロジェクトに追加します：

```swift
dependencies: [
    .package(url: "https://github.com/1998code/ChartJS-for-Swift", from: "1.0.0")
]
```

または Xcode から直接追加することもできます：
1. ファイル > Swift Packages > パッケージ依存関係を追加
2. リポジトリ URL を入力：`https://github.com/1998code/ChartJS-for-Swift`

## 使用方法

### 基本的な例

```swift
import SwiftUI
import ChartJS

struct ContentView: View {
    let dataJson = """
    {
        "labels": ["1月", "2月", "3月", "4月", "5月", "6月"],
        "datasets": [{
            "label": "2025年の売上",
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
                    "text": "月次売上"
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
            
            Text("月次売上チャート")
                .font(.caption)
        }
    }
}
```

### 複数のチャートタイプ

設定の `type` プロパティを変更することで、異なるチャートタイプを作成できます：

```swift
// 折れ線グラフ
let lineConfigJson = """
{
    "type": "line",
    "options": {
        "responsive": true,
        "plugins": {
            "title": {
                "display": true,
                "text": "折れ線グラフ"
            }
        }
    }
}
"""

// 円グラフ
let pieConfigJson = """
{
    "type": "pie",
    "options": {
        "responsive": true,
        "plugins": {
            "title": {
                "display": true,
                "text": "円グラフ"
            }
        }
    }
}
"""
```

### レスポンシブレイアウト

最適なレスポンシブ体験を得るには、GeometryReaderを使用します：

```swift
GeometryReader { geometry in
    Charts(dataJson: dataJson, configJson: configJson)
        .frame(height: geometry.size.width > geometry.size.height ?
               geometry.size.height : // 横向き
               geometry.size.height * 0.3) // 縦向き
        .padding()
}
```

### カスタムJavaScript

カスタムJavaScript初期化を追加する必要がある場合は、`scriptSetup`パラメータを使用します：

```swift
let scriptSetup = """
<script>
    // チャート初期化前に実行するカスタムJavaScript
    function customFunction() {
        console.log('カスタムセットアップ完了');
    }
    customFunction();
</script>
"""

Charts(dataJson: dataJson, configJson: configJson, scriptSetup: scriptSetup)
```

## プラットフォームサポート

- **iOS**：完全対応
- **macOS**：近日公開
- **tvOS**：（WebKit非対応）
- **watchOS**：（WebKit非対応）

## トラブルシューティング

問題が発生した場合：

1. JSONが有効であることを確認する
2. データ構造がChart.jsの期待するものと一致していることを確認する
3. 複雑なチャートの場合は、先にChart.jsのウェブサイトで設定をテストする

## ライセンス

このプロジェクトはMITライセンスの下で利用可能です。詳細はLICENSEファイルをご覧ください。

## 謝辞

- [Chart.js](https://www.chartjs.org/) - シンプルで柔軟なJavaScriptチャートライブラリ

---

## 翻訳

このドキュメントは以下の言語でもご利用いただけます：

[English](../README.md) | [繁中](README.zh-TW.md) / [简中](README.zh-CN.md) / [粵語](README.zh-HK.md) | [日本語](README.ja.md) | [Español](README.es.md)

新しい言語の追加や誤字・間違いの修正は、プルリクエストでお気軽にご貢献ください。