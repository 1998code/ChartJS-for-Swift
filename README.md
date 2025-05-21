# ChartJS for Swift

A SwiftUI wrapper for Chart.js that allows you to easily create beautiful, responsive charts in your iOS and macOS applications.



## Features

- Create various chart types supported by Chart.js (bar, line, pie, doughnut, etc.)
- Fully customizable with Chart.js configuration options
- Works on iOS and macOS (fallback message for tvOS and watchOS)
- SwiftUI integration with `Charts` view
- Responsive design that adapts to different screen sizes

## Requirements

- iOS 13.0+ / macOS 10.15+
- Swift 5.3+
- Xcode 12.0+

## Installation

### Swift Package Manager

Add this package to your project by adding the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/1998code/ChartJS-for-Swift", from: "1.0.0")
]
```

Or add it directly from Xcode:
1. File > Swift Packages > Add Package Dependency
2. Enter the repository URL: `https://github.com/1998code/ChartJS-for-Swift`

## Usage

### Basic Example

```swift
import SwiftUI
import ChartJS

struct ContentView: View {
    let dataJson = """
    {
        "labels": ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
        "datasets": [{
            "label": "Sales 2025",
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
                    "text": "Monthly Sales"
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
            
            Text("Monthly Sales Chart")
                .font(.caption)
        }
    }
}
```

### Multiple Chart Types

You can create different chart types by changing the `type` property in the configuration:

```swift
// Line chart
let lineConfigJson = """
{
    "type": "line",
    "options": {
        "responsive": true,
        "plugins": {
            "title": {
                "display": true,
                "text": "Line Chart"
            }
        }
    }
}
"""

// Pie chart
let pieConfigJson = """
{
    "type": "pie",
    "options": {
        "responsive": true,
        "plugins": {
            "title": {
                "display": true,
                "text": "Pie Chart"
            }
        }
    }
}
"""
```

### Responsive Layout

For the best responsive experience, use GeometryReader:

```swift
GeometryReader { geometry in
    Charts(dataJson: dataJson, configJson: configJson)
        .frame(height: geometry.size.width > geometry.size.height ?
               geometry.size.height : // landscape
               geometry.size.height * 0.3) // portrait
        .padding()
}
```

### Custom JavaScript

If you need to add custom JavaScript initialization, use the `scriptSetup` parameter:

```swift
let scriptSetup = """
<script>
    // Custom JavaScript to run before chart initialization
    function customFunction() {
        console.log('Custom setup complete');
    }
    customFunction();
</script>
"""

Charts(dataJson: dataJson, configJson: configJson, scriptSetup: scriptSetup)
```

## Platform Support

- **iOS**: Fully supported
- **macOS**: Fully supported
- **tvOS**: Fallback message (WebKit not supported)
- **watchOS**: Fallback message (WebKit not supported)

## Troubleshooting

If you encounter any issues:

1. Make sure your JSON is valid
2. Check that your data structure matches what Chart.js expects
3. For complex charts, test your configuration on the Chart.js website first

## License

This project is available under the MIT license. See the LICENSE file for more info.

## Acknowledgements

- [Chart.js](https://www.chartjs.org/) - Simple yet flexible JavaScript charting library
