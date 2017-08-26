//
//  LineView.swift
//  DrawNote
//
//  Created by nhatlee on 8/26/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit

class LineView: UIView {
    var beginPoint: CGPoint!
    var lastPoint: CGPoint!
    var shapeLayer: CAShapeLayer!
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    
    
    //--------remain: parse touch end
    //remove invalid line
    
    override func draw(_ rect: CGRect) {
        
    }
    //MARK:-Touch override function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        beginPoint = touch.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        lastPoint = touch.location(in: self)
        if !checkValidDrawAction(getDistance(beginPoint, end: lastPoint)) {
            return
        }
        drawWhenMouseMove(isMove: true)
    }
    
    
    //MARK: - check valid
    func getDistance(_ beginPoint: CGPoint, end endPoint: CGPoint) -> CGFloat {
        return sqrt(pow(endPoint.x - beginPoint.x, 2) + pow(endPoint.y - beginPoint.y, 2))
    }
    
    func checkValidDrawAction(_ distance: CGFloat) -> Bool {
        if distance < 30 {
            return false
        }
        return true
    }
    
    //MARK:-drawing
    func drawWhenMouseMove(isMove: Bool){
        shapeLayer = buildShape(withHighLight: false)
        self.layer.addSublayer(shapeLayer)
    }
    
    func buildShape(withHighLight isHighLight: Bool) -> CAShapeLayer {
        let path = UIBezierPath()
        path.move(to: beginPoint)
        path.addLine(to: lastPoint)
        let shapeFinal = CAShapeLayer()
        shapeFinal.path = path.cgPath
        shapeFinal.strokeColor = UIColor.red.cgColor
        shapeFinal.fillColor = UIColor.clear.cgColor
        if isHighLight {
            shapeFinal.lineWidth = 4 + 1
            shapeFinal.strokeColor = UIColor.red.cgColor
        }
        else {
            shapeFinal.lineWidth = 4
        }
        return shapeFinal
    }

}
