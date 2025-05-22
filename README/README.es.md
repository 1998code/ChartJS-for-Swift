# ChartJS para Swift

Un envoltorio SwiftUI para Chart.js que te permite crear fácilmente gráficos hermosos y responsivos en tus aplicaciones iOS ~~y macOS~~.

![ChartJS@3x](https://github.com/user-attachments/assets/9051153e-7d07-4b4f-8da7-fa9ac1793349)

## Características

- Crea varios tipos de gráficos soportados por Chart.js (barras, líneas, circular, anillo, etc.)
- Completamente personalizable con opciones de configuración de Chart.js
- Funciona en iOS y macOS (mensaje alternativo para tvOS y watchOS)
- Integración con SwiftUI mediante la vista `Charts`
- Diseño responsivo que se adapta a diferentes tamaños de pantalla

## Requisitos

- iOS 13.0+ / ~~macOS 10.15+~~(Próximamente)
- Swift 5.9+
- Xcode 16.0+

## Instalación

### Swift Package Manager

Añade este paquete a tu proyecto agregando lo siguiente a tu archivo `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/1998code/ChartJS-for-Swift", from: "1.0.0")
]
```

O añádelo directamente desde Xcode:
1. Archivo > Swift Packages > Añadir dependencia de paquete
2. Introduce la URL del repositorio: `https://github.com/1998code/ChartJS-for-Swift`

## Uso

### Ejemplo básico

```swift
import SwiftUI
import ChartJS

struct ContentView: View {
    let dataJson = """
    {
        "labels": ["Ene", "Feb", "Mar", "Abr", "May", "Jun"],
        "datasets": [{
            "label": "Ventas 2025",
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
                    "text": "Ventas Mensuales"
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
            
            Text("Gráfico de ventas mensuales")
                .font(.caption)
        }
    }
}
```

### Múltiples tipos de gráficos

Puedes crear diferentes tipos de gráficos cambiando la propiedad `type` en la configuración:

```swift
// Gráfico de líneas
let lineConfigJson = """
{
    "type": "line",
    "options": {
        "responsive": true,
        "plugins": {
            "title": {
                "display": true,
                "text": "Gráfico de Líneas"
            }
        }
    }
}
"""

// Gráfico circular
let pieConfigJson = """
{
    "type": "pie",
    "options": {
        "responsive": true,
        "plugins": {
            "title": {
                "display": true,
                "text": "Gráfico Circular"
            }
        }
    }
}
"""
```

### Diseño responsivo

Para la mejor experiencia responsiva, usa GeometryReader:

```swift
GeometryReader { geometry in
    Charts(dataJson: dataJson, configJson: configJson)
        .frame(height: geometry.size.width > geometry.size.height ?
               geometry.size.height : // paisaje
               geometry.size.height * 0.3) // retrato
        .padding()
}
```

### JavaScript personalizado

Si necesitas añadir inicialización JavaScript personalizada, usa el parámetro `scriptSetup`:

```swift
let scriptSetup = """
<script>
    // JavaScript personalizado para ejecutar antes de la inicialización del gráfico
    function customFunction() {
        console.log('Configuración personalizada completa');
    }
    customFunction();
</script>
"""

Charts(dataJson: dataJson, configJson: configJson, scriptSetup: scriptSetup)
```

## Soporte de plataformas

- **iOS**: Totalmente soportado
- **macOS**: Próximamente
- **tvOS**: (WebKit no soportado)
- **watchOS**: (WebKit no soportado)

## Solución de problemas

Si encuentras problemas:

1. Asegúrate de que tu JSON sea válido
2. Comprueba que tu estructura de datos coincida con lo que Chart.js espera
3. Para gráficos complejos, prueba tu configuración en el sitio web de Chart.js primero

## Licencia

Este proyecto está disponible bajo la licencia MIT. Consulta el archivo LICENSE para más información.

## Agradecimientos

- [Chart.js](https://www.chartjs.org/) - Librería JavaScript de gráficos simple y flexible

---

## Traducciones

Esta documentación está disponible también en:

[English](../README.md) | [繁中](README.zh-TW.md) / [简中](README.zh-CN.md) / [粵語](README.zh-HK.md) | [日本語](README.ja.md) | [Español](README.es.md)

No dudes en abrir un pull request para añadir nuevos idiomas o corregir cualquier error.