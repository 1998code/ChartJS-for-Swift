//
//  Bar.swift
//  ChartJS
//
//  Created by Ming on 21/5/2025.
//

import SwiftUI
import ChartJS

#Preview("Border Radius Chart") {
    let dataJson = """
    {
        "labels": ["January", "February", "March", "April", "May", "June", "July"],
        "datasets": [
            {
                "label": "Fully Rounded",
                "data": [65, -59, 80, -81, 56, -55, 40],
                "borderColor": "rgb(255, 99, 132)",
                "backgroundColor": "rgba(255, 99, 132, 0.5)",
                "borderWidth": 2,
                "borderRadius": 999,
                "borderSkipped": false
            },
            {
                "label": "Small Radius",
                "data": [28, -48, 40, -19, 86, -27, 90],
                "borderColor": "rgb(54, 162, 235)",
                "backgroundColor": "rgba(54, 162, 235, 0.5)",
                "borderWidth": 2,
                "borderRadius": 5,
                "borderSkipped": false
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
                "legend": {
                    "position": "top"
                },
                "title": {
                    "display": true,
                    "text": "Bar Chart Border Radius"
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

#Preview("Floating Bar Chart") {
    let dataJson = """
    {
        "labels": ["January", "February", "March", "April", "May", "June", "July"],
        "datasets": [
            {
                "label": "Dataset 1",
                "data": [
                    [-65, 30],
                    [-25, 59],
                    [-30, 80],
                    [-10, 81],
                    [-25, 56],
                    [-45, 55],
                    [-15, 40]
                ],
                "backgroundColor": "rgba(255, 99, 132, 0.5)"
            },
            {
                "label": "Dataset 2",
                "data": [
                    [-45, 28],
                    [-80, 48],
                    [-25, 40],
                    [-60, 19],
                    [-15, 86],
                    [-50, 27],
                    [-30, 90]
                ],
                "backgroundColor": "rgba(54, 162, 235, 0.5)"
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
                "legend": {
                    "position": "top"
                },
                "title": {
                    "display": true,
                    "text": "Chart.js Floating Bar Chart"
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

#Preview("Horizontal Bar Chart") {
    let dataJson = """
    {
        "labels": ["January", "February", "March", "April", "May", "June", "July"],
        "datasets": [
            {
                "label": "Dataset 1",
                "data": [65, -59, 80, -81, 56, -55, 40],
                "borderColor": "rgb(255, 99, 132)",
                "backgroundColor": "rgba(255, 99, 132, 0.5)",
                "borderWidth": 2
            },
            {
                "label": "Dataset 2",
                "data": [28, -48, 40, -19, 86, -27, 90],
                "borderColor": "rgb(54, 162, 235)",
                "backgroundColor": "rgba(54, 162, 235, 0.5)",
                "borderWidth": 2
            }
        ]
    }
    """
    
    let configJson = """
    {
        "type": "bar",
        "options": {
            "indexAxis": "y",
            "elements": {
                "bar": {
                    "borderWidth": 2
                }
            },
            "responsive": true,
            "plugins": {
                "legend": {
                    "position": "right"
                },
                "title": {
                    "display": true,
                    "text": "Chart.js Horizontal Bar Chart"
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

#Preview("Stacked Bar Chart") {
    let dataJson = """
    {
        "labels": ["January", "February", "March", "April", "May", "June", "July"],
        "datasets": [
            {
                "label": "Dataset 1",
                "data": [65, -59, 80, -81, 56, -55, 40],
                "backgroundColor": "rgb(255, 99, 132)"
            },
            {
                "label": "Dataset 2",
                "data": [28, -48, 40, -19, 86, -27, 90],
                "backgroundColor": "rgb(54, 162, 235)"
            },
            {
                "label": "Dataset 3",
                "data": [35, -25, 60, -35, 45, -40, 70],
                "backgroundColor": "rgb(75, 192, 192)"
            }
        ]
    }
    """
    
    let configJson = """
    {
        "type": "bar",
        "options": {
            "plugins": {
                "title": {
                    "display": true,
                    "text": "Chart.js Bar Chart - Stacked"
                }
            },
            "responsive": true,
            "scales": {
                "x": {
                    "stacked": true
                },
                "y": {
                    "stacked": true
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

#Preview("Stacked Bar Chart with Groups") {
    let dataJson = """
    {
        "labels": ["January", "February", "March", "April", "May", "June", "July"],
        "datasets": [
            {
                "label": "Dataset 1",
                "data": [65, -59, 80, -81, 56, -55, 40],
                "backgroundColor": "rgb(255, 99, 132)",
                "stack": "Stack 0"
            },
            {
                "label": "Dataset 2",
                "data": [28, -48, 40, -19, 86, -27, 90],
                "backgroundColor": "rgb(54, 162, 235)",
                "stack": "Stack 0"
            },
            {
                "label": "Dataset 3",
                "data": [35, -25, 60, -35, 45, -40, 70],
                "backgroundColor": "rgb(75, 192, 192)",
                "stack": "Stack 1"
            }
        ]
    }
    """
    
    let configJson = """
    {
        "type": "bar",
        "options": {
            "plugins": {
                "title": {
                    "display": true,
                    "text": "Chart.js Bar Chart - Stacked with Groups"
                }
            },
            "responsive": true,
            "interaction": {
                "intersect": false
            },
            "scales": {
                "x": {
                    "stacked": true
                },
                "y": {
                    "stacked": true
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

#Preview("Vertical Bar Chart") {
    let dataJson = """
    {
        "labels": ["January", "February", "March", "April", "May", "June", "July"],
        "datasets": [
            {
                "label": "Dataset 1",
                "data": [65, -59, 80, -81, 56, -55, 40],
                "borderColor": "rgb(255, 99, 132)",
                "backgroundColor": "rgba(255, 99, 132, 0.5)"
            },
            {
                "label": "Dataset 2",
                "data": [28, -48, 40, -19, 86, -27, 90],
                "borderColor": "rgb(54, 162, 235)",
                "backgroundColor": "rgba(54, 162, 235, 0.5)"
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
                "legend": {
                    "position": "top"
                },
                "title": {
                    "display": true,
                    "text": "Chart.js Bar Chart"
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
