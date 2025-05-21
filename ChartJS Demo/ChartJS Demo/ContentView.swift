//
//  ContentView.swift
//  ChartJS Demo
//
//  Created by Ming on 21/5/2025.
//

import SwiftUI
import ChartJS

#Preview("Simple Chart") {
    // Use the entire view for the chart
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
    
    let configJson = """
    {
        "type": "bar",
        "options": {
            "responsive": true,
            "plugins": {
                "title": {
                    "display": true,
                    "text": "Simple Chart Example"
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
        Charts(dataJson: dataJson, configJson: configJson)
            .frame(height: geometry.size.width > geometry.size.height ?
                  geometry.size.height : // landscape
                  geometry.size.height * 0.3) // portrait
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .position(x: geometry.size.width/2, y: geometry.size.height/2)
    }
}

#Preview("Multiple Datasets") {
    // Use the entire view for the chart
    let dataJson = """
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
                    "text": "Dynamic Chart Example"
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
        Charts(dataJson: dataJson, configJson: configJson)
            .frame(height: geometry.size.width > geometry.size.height ?
                  geometry.size.height : // landscape
                  geometry.size.height * 0.3) // portrait
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .position(x: geometry.size.width/2, y: geometry.size.height/2)
    }
}
