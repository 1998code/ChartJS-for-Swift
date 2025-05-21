//
//  Line.swift
//  ChartJS
//
//  Created by Ming on 18/5/2025.
//

import SwiftUI
import ChartJS

#Preview("Simple Line Chart") {
    let dataJson = """
    {
        "labels": ["January", "February", "March", "April", "May", "June", "July"],
        "datasets": [{
            "label": "My First Dataset",
            "data": [65, 59, 80, 81, 56, 55, 40],
            "fill": false,
            "borderColor": "rgb(75, 192, 192)",
            "tension": 0.3
        }]
    }
    """
    
    let configJson = """
    {
        "type": "line",
        "options": {
            "responsive": true,
            "plugins": {
                "title": {
                    "display": true,
                    "text": "Chart.js Line Chart"
                }
            }
        }
    }
    """
    
    GeometryReader { geometry in
        Charts(dataJson: dataJson, configJson: configJson)
            .frame(height: geometry.size.width > geometry.size.height ? 
                  geometry.size.height : // landscape
                  geometry.size.height * 0.3) // portrait
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .position(x: geometry.size.width/2, y: geometry.size.height/2)
    }
}

#Preview("Line Chart with Gradient") {
    let dataJson = """
    {
        "labels": ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        "datasets": [{
            "label": "Monthly Data",
            "data": [45, 55, 65, 75, 95, 105, 95, 75, 55, 45, 35, 25],
            "fill": true,
            "borderColor": "rgb(75, 192, 192)",
            "tension": 0.35,
            "backgroundColor": "GRADIENT"
        }]
    }
    """
    
    let configJson = """
    {
        "type": "line",
        "options": {
            "responsive": true,
            "plugins": {
                "title": {
                    "display": true,
                    "text": "Chart.js Line Chart with Vertical Gradient"
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
    
    let scriptSetup = """
    <script>
        document.addEventListener('chartjs-render', function(event) {
            const chart = event.detail.chart;
            const ctx = chart.ctx;
            const chartArea = chart.chartArea;
            
            if (chartArea && chart.data.datasets.length > 0) {
                const dataset = chart.data.datasets[0];
                
                if (dataset.backgroundColor === "GRADIENT") {
                    const gradient = ctx.createLinearGradient(0, chartArea.top, 0, chartArea.bottom);
                    gradient.addColorStop(0, 'rgba(75, 192, 192, 0.8)');
                    gradient.addColorStop(1, 'rgba(75, 192, 192, 0.0)');
                    dataset.backgroundColor = gradient;
                    chart.update();
                }
            }
        });
    </script>
    """
    
    GeometryReader { geometry in
        Charts(dataJson: dataJson, configJson: configJson, scriptSetup: scriptSetup)
            .frame(height: geometry.size.width > geometry.size.height ? 
                  geometry.size.height : // landscape
                  geometry.size.height * 0.3) // portrait
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .position(x: geometry.size.width/2, y: geometry.size.height/2)
    }
}

#Preview("Multi-Dataset Line Chart with Gradients") {
    let dataJson = """
    {
        "labels": ["January", "February", "March", "April", "May", "June", "July"],
        "datasets": [
            {
                "label": "Dataset 1",
                "data": [65, 59, 80, 81, 56, 55, 40],
                "borderColor": "rgb(255, 99, 132)",
                "backgroundColor": "GRADIENT1",
                "tension": 0.3,
                "fill": true
            },
            {
                "label": "Dataset 2",
                "data": [28, 48, 40, 19, 45, 35, 30],
                "borderColor": "rgb(35, 253, 152)",
                "backgroundColor": "GRADIENT2",
                "tension": 0.3,
                "fill": true
            }
        ]
    }
    """
    
    let configJson = """
    {
        "type": "line",
        "options": {
            "responsive": true,
            "plugins": {
                "title": {
                    "display": true,
                    "text": "Chart.js Multi-Line Chart with Gradients"
                }
            }
        }
    }
    """
    
    let scriptSetup = """
    <script>
        document.addEventListener('chartjs-render', function(event) {
            const chart = event.detail.chart;
            const ctx = chart.ctx;
            const chartArea = chart.chartArea;
            
            if (chartArea && chart.data.datasets.length > 0) {
                // Process each dataset
                chart.data.datasets.forEach((dataset, i) => {
                    if (dataset.backgroundColor === "GRADIENT1") {
                        const gradient = ctx.createLinearGradient(0, chartArea.top, 0, chartArea.bottom);
                        gradient.addColorStop(0, 'rgba(255, 99, 132, 0.8)');
                        gradient.addColorStop(1, 'rgba(255, 99, 132, 0.0)');
                        dataset.backgroundColor = gradient;
                    } else if (dataset.backgroundColor === "GRADIENT2") {
                        const gradient = ctx.createLinearGradient(0, chartArea.top, 0, chartArea.bottom);
                        gradient.addColorStop(0, 'rgba(35, 253, 152, 0.8)');
                        gradient.addColorStop(1, 'rgba(35, 253, 152, 0.0)');
                        dataset.backgroundColor = gradient;
                    }
                });
                
                // Update the chart to apply changes
                chart.update();
            }
        });
    </script>
    """
    
    GeometryReader { geometry in
        Charts(dataJson: dataJson, configJson: configJson, scriptSetup: scriptSetup)
            .frame(height: geometry.size.width > geometry.size.height ? 
                  geometry.size.height : // landscape
                  geometry.size.height * 0.3) // portrait
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .position(x: geometry.size.width/2, y: geometry.size.height/2)
    }
}
