//
//  Like.swift
//  vkontakteVS
//
//  Created by Home on 01.08.2021.
//

import UIKit
import SwiftUI

struct Like: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let square = CGRect(x: rect.minX, y: rect.minY, width: min(rect.maxX-rect.minX,rect.maxY-rect.minY), height: min(rect.maxX-rect.minX,rect.maxY-rect.minY))
        let scaleFactor = CGFloat(square.width/480)
        
        path.move(to: CGPoint(x: 433.6*scaleFactor, y: 67*scaleFactor))
        path.addCurve(to: CGPoint(x: 341.3*scaleFactor, y: 28.8*scaleFactor), control1: CGPoint(x: 408.9*scaleFactor, y: 42.3*scaleFactor), control2: CGPoint(x: 376.2*scaleFactor, y: 28.8*scaleFactor))
        path.addCurve(to: CGPoint(x: 248.9*scaleFactor, y: 67.1*scaleFactor), control1: CGPoint(x: 306.4*scaleFactor, y: 28.8*scaleFactor), control2: CGPoint(x: 273.6*scaleFactor, y: 42.4*scaleFactor))
        path.addLine(to: CGPoint(x: 236*scaleFactor, y: 80*scaleFactor))
        path.addLine(to: CGPoint(x: 222.9*scaleFactor, y: 66.9*scaleFactor))
        path.addCurve(to: CGPoint(x: 130.4*scaleFactor, y: 28.5*scaleFactor), control1: CGPoint(x: 198.2*scaleFactor, y: 42.2*scaleFactor), control2: CGPoint(x: 165.3*scaleFactor, y: 28.5*scaleFactor))
        path.addCurve(to: CGPoint(x: 38.2*scaleFactor, y: 66.7*scaleFactor), control1: CGPoint(x: 95.6*scaleFactor, y: 28.5*scaleFactor), control2: CGPoint(x: 62.8*scaleFactor, y: 42.1*scaleFactor))
        path.addCurve(to: CGPoint(x: 0*scaleFactor, y: 159.1*scaleFactor), control1: CGPoint(x: 13.5*scaleFactor, y: 91.4*scaleFactor), control2: CGPoint(x: -0.1*scaleFactor, y: 124.2*scaleFactor))
        path.addCurve(to: CGPoint(x: 38.4*scaleFactor, y: 251.4*scaleFactor), control1: CGPoint(x: 0*scaleFactor, y: 194*scaleFactor), control2: CGPoint(x: 13.7*scaleFactor, y: 226.7*scaleFactor))
        path.addLine(to: CGPoint(x: 226.2*scaleFactor, y: 439.2*scaleFactor))
        path.addCurve(to: CGPoint(x: 235.7*scaleFactor, y: 443.2*scaleFactor), control1: CGPoint(x: 228.8*scaleFactor, y: 441.8*scaleFactor), control2: CGPoint(x: 232.3*scaleFactor, y: 443.2*scaleFactor))
        path.addCurve(to: CGPoint(x: 245.2*scaleFactor, y: 439.3*scaleFactor), control1: CGPoint(x: 239.1*scaleFactor, y: 443.2*scaleFactor), control2: CGPoint(x: 242.6*scaleFactor, y: 441.9*scaleFactor))
        path.addLine(to: CGPoint(x: 433.4*scaleFactor, y: 251.8*scaleFactor))
        path.addCurve(to: CGPoint(x: 471.7*scaleFactor, y: 159.4*scaleFactor), control1: CGPoint(x: 458.1*scaleFactor, y: 227.1*scaleFactor), control2: CGPoint(x: 471.7*scaleFactor, y: 194.3*scaleFactor))
        path.addCurve(to: CGPoint(x: 433.6*scaleFactor, y: 67*scaleFactor), control1: CGPoint(x: 471.8*scaleFactor, y: 124.5*scaleFactor), control2: CGPoint(x: 458.3*scaleFactor, y: 91.7*scaleFactor))
        return path
    }
}
