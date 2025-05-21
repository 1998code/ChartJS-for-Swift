//
//  Pie.swift
//  ChartJS
//
//  Created by Ming on 18/5/2025.
//

import SwiftUI
import ChartJS

#Preview("Pie Chart") {
    let dataJson = """
    {
        "labels": ["Red", "Orange", "Yellow", "Green", "Blue"],
        "datasets": [
            {
                "label": "Dataset 1",
                "data": [65, 59, 80, 81, 56],
                "backgroundColor": [
                    "rgb(255, 99, 132)",
                    "rgb(255, 159, 64)",
                    "rgb(255, 205, 86)",
                    "rgb(75, 192, 192)",
                    "rgb(54, 162, 235)"
                ]
            }
        ]
    }
    """
    
    let configJson = """
    {
        "type": "pie",
        "options": {
            "responsive": true,
            "plugins": {
                "legend": {
                    "position": "top"
                },
                "title": {
                    "display": true,
                    "text": "Chart.js Pie Chart"
                }
            }
        }
    }
    """
    
    return GeometryReader { geometry in
        Charts(dataJson: dataJson, configJson: configJson)
            .frame(height: geometry.size.width > geometry.size.height ?
                  geometry.size.height : // landscape
                  geometry.size.height * 0.3) // portrait
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .position(x: geometry.size.width/2, y: geometry.size.height/2)
    }
}

#Preview("Doughnut Chart") {
    let dataJson = """
    {
        "labels": ["Red", "Orange", "Yellow", "Green", "Blue"],
        "datasets": [
            {
                "label": "Dataset 1",
                "data": [65, 59, 80, 81, 56],
                "backgroundColor": [
                    "rgb(255, 99, 132)",
                    "rgb(255, 159, 64)",
                    "rgb(255, 205, 86)",
                    "rgb(75, 192, 192)",
                    "rgb(54, 162, 235)"
                ]
            }
        ]
    }
    """
    
    let configJson = """
    {
        "type": "doughnut",
        "options": {
            "responsive": true,
            "plugins": {
                "legend": {
                    "position": "top"
                },
                "title": {
                    "display": true,
                    "text": "Chart.js Doughnut Chart"
                }
            }
        }
    }
    """
    
    return GeometryReader { geometry in
        Charts(dataJson: dataJson, configJson: configJson)
            .frame(height: geometry.size.width > geometry.size.height ?
                  geometry.size.height : // landscape
                  geometry.size.height * 0.3) // portrait
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .position(x: geometry.size.width/2, y: geometry.size.height/2)
    }
}
