//
//  Polar.swift
//  ChartJS
//
//  Created by Ming on 21/5/2025.
//

import SwiftUI
import ChartJS

#Preview("Polar Area Chart") {
    let dataJson = """
    {
        "labels": ["Red", "Orange", "Yellow", "Green", "Blue"],
        "datasets": [
            {
                "label": "Dataset 1",
                "data": [65, 59, 80, 81, 56],
                "backgroundColor": [
                    "rgba(255, 99, 132, 0.5)",
                    "rgba(255, 159, 64, 0.5)",
                    "rgba(255, 205, 86, 0.5)",
                    "rgba(75, 192, 192, 0.5)",
                    "rgba(54, 162, 235, 0.5)"
                ]
            }
        ]
    }
    """
    
    let configJson = """
    {
        "type": "polarArea",
        "options": {
            "responsive": true,
            "scales": {
                "r": {
                    "pointLabels": {
                        "display": true,
                        "centerPointLabels": true,
                        "font": {
                            "size": 18
                        }
                    }
                }
            },
            "plugins": {
                "legend": {
                    "position": "top"
                },
                "title": {
                    "display": true,
                    "text": "Chart.js Polar Area Chart With Centered Point Labels"
                }
            }
        }
    }
    """
    
    return GeometryReader { geometry in
        Charts(dataJson: dataJson, configJson: configJson)
            .frame(height: geometry.size.width > geometry.size.height ?
                  geometry.size.height : // landscape
                  geometry.size.height * 0.5) // portrait
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .position(x: geometry.size.width/2, y: geometry.size.height/2)
    }
}
