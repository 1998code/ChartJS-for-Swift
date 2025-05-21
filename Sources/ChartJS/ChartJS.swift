//
//  ChartJS.swift
//  ChartJS
//
//  Created by Ming on 21/5/2025.
//

import SwiftUI
import WebKit

/// A SwiftUI view that renders charts using Chart.js
public struct Charts: View {
    var dataJson: String
    var configJson: String
    var height: CGFloat?
    var scriptSetup: String?
    
    /// Initialize a new Charts view
    /// - Parameters:
    ///   - dataJson: JSON string containing chart data
    ///   - configJson: JSON string containing chart configuration
    ///   - height: Optional height for the chart
    ///   - scriptSetup: Optional JavaScript for additional chart setup
    public init(dataJson: String, configJson: String, height: CGFloat? = nil, scriptSetup: String? = nil) {
        self.dataJson = dataJson
        self.configJson = configJson
        self.height = height
        self.scriptSetup = scriptSetup
    }
    
    public var body: some View {
        ChartView(dataJson: dataJson, configJson: configJson, height: height, scriptSetup: scriptSetup)
    }
}

/// The underlying UIViewRepresentable that renders Chart.js content
struct ChartView: UIViewRepresentable {
    // Support for JSON configuration
    var dataJson: String
    var configJson: String
    
    // Optional height parameter
    var height: CGFloat?
    
    // Optional script setup for advanced customization
    var scriptSetup: String?
    
    init(dataJson: String, configJson: String, height: CGFloat? = nil, scriptSetup: String? = nil) {
        self.dataJson = dataJson
        self.configJson = configJson
        self.height = height
        self.scriptSetup = scriptSetup
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        
        // Configure webView for transparency
        webView.isOpaque = false
        webView.backgroundColor = UIColor.clear
        webView.scrollView.backgroundColor = UIColor.clear
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.scrollView.isScrollEnabled = true
        webView.translatesAutoresizingMaskIntoConstraints = true
        let htmlContent = generateChartHTMLWithJSON(dataJson: dataJson, configJson: configJson)
        if let chartJsBundleUrl = chartJSBundle.url(forResource: "chart", withExtension: "js") {
            let tempDir = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("chartjs-local")
            let tempChartJsUrl = tempDir.appendingPathComponent("chart.js")
            if !FileManager.default.fileExists(atPath: tempChartJsUrl.path) {
                try? FileManager.default.createDirectory(at: tempDir, withIntermediateDirectories: true)
                do {
                    try FileManager.default.copyItem(at: chartJsBundleUrl, to: tempChartJsUrl)
                    print("[ChartJS] Copied chart.js to temp: \(tempChartJsUrl.path)")
                } catch {
                    print("[ChartJS] Error copying chart.js: \(error)")
                }
            } else {
                print("[ChartJS] chart.js already exists at temp: \(tempChartJsUrl.path)")
            }
            print("[ChartJS] baseURL for WKWebView: \(tempDir)")
            webView.loadHTMLString(htmlContent, baseURL: tempDir)
            context.coordinator.previousDataJson = dataJson
            context.coordinator.previousConfigJson = configJson
            webView.evaluateJavaScript("console.log('Chart loaded with data');", completionHandler: nil)
        } else {
            print("[ChartJS] Error: chart.js file not found in the bundle")
            webView.loadHTMLString(htmlContent, baseURL: nil)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: ChartView
        var previousDataJson: String = ""
        var previousConfigJson: String = ""
        
        init(_ parent: ChartView) {
            self.parent = parent
            self.previousDataJson = parent.dataJson
            self.previousConfigJson = parent.configJson
        }
    }
    
    private func generateChartHTMLWithJSON(dataJson: String, configJson: String) -> String {
        // Always use local chart.js, never CDN
        let chartJsScriptTag = "<script src=\"chart.js\"></script>"
        return """
        <!DOCTYPE html>
        <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
            \(chartJsScriptTag)
            <style>
                body { margin: 0; padding: 0; }
                .chart-container { 
                    width: 100%; 
                    height: 100vh; 
                    position: relative;
                }
                canvas { display: block; }
            </style>
            \(scriptSetup ?? "")
        </head>
        <body>
            <div class="chart-container">
                <canvas id="myChart"></canvas>
            </div>
            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    const ctx = document.getElementById('myChart').getContext('2d');
                    const data = \(dataJson);
                    const config = \(configJson);
                    
                    // Create the chart with the provided configuration
                    const chart = new Chart(ctx, {
                        type: config.type || 'bar',
                        data: data,
                        options: {
                            ...config.options,
                            responsive: true,
                            maintainAspectRatio: false
                        }
                    });
                    
                    // Dispatch an event for the chart creation
                    // This allows custom scripts to modify the chart
                    const chartEvent = new CustomEvent('chartjs-render', { 
                        detail: { chart: chart } 
                    });
                    document.dispatchEvent(chartEvent);
                    
                    // Log for debugging
                    console.log('Chart created:', chart);
                });
            </script>
        </body>
        </html>
        """
    }
}

// Extension to get the correct bundle for resources
private extension ChartView {
    var chartJSBundle: Bundle {
#if SWIFT_PACKAGE
        return Bundle.module
#else
        let candidates = [
            Bundle(for: Coordinator.self),
            Bundle.main,
        ]
        for bundle in candidates {
            if bundle.path(forResource: "chart", ofType: "js") != nil {
                return bundle
            }
        }
        return Bundle.main
#endif
    }
}

#Preview("Simple Chart") {
    let dataJson = """
    {
        "labels": ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        "datasets": [{
            "label": "Data",
            "data": [12, 19, 3, 5, 2, 3],
            "backgroundColor": "rgba(75, 192, 192, 0.2)",
            "borderColor": "rgba(75, 192, 192, 1)",
            "borderWidth": 1
        }]
    }
    """
    
    let dataJson2 = """
    {
        "labels": ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
        "datasets": [
            {
                "label": "Sales",
                "data": [12, 19, 3, 5, 2, 3],
                "backgroundColor": "rgba(255, 99, 132, 0.2)",
                "borderColor": "rgba(255, 99, 132, 1)",
                "borderWidth": 1
            },
            {
                "label": "Revenue",
                "data": [7, 11, 5, 8, 3, 7],
                "backgroundColor": "rgba(54, 162, 235, 0.2)",
                "borderColor": "rgba(54, 162, 235, 1)",
                "borderWidth": 1
            }
        ]
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
                    "text": "ChartJS for Swift"
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
    
    return GeometryReader { geometry in
        VStack{
            Charts(dataJson: dataJson, configJson: configJson)
                .frame(height: geometry.size.width > geometry.size.height ?
                       geometry.size.height : // landscape
                       geometry.size.height * 0.3) // portrait
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Charts(dataJson: dataJson2, configJson: configJson)
                .frame(height: geometry.size.width > geometry.size.height ?
                       geometry.size.height : // landscape
                       geometry.size.height * 0.3) // portrait
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
