//
//  FreeDraw.swift
//  DrawNote
//
//  Created by nhatlee on 8/26/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit

class FreeDraw: UIView {
    var lastPoint: CGPoint!
    var swiping = false
    
    var pts = [CGPoint](repeating: CGPoint.zero, count: 5)
    // we now need to keep track of the four points of a Bezier segment and the first control point of the next segment
    var ctr: Int = 0
    var pathFree: UIBezierPath!
    var shapeLayer: CAShapeLayer!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiping = false
        guard let touch = touches.first else{return}
        lastPoint = touch.location(in: self)
        
        pathFree = UIBezierPath();
        ctr = 0;
        pts[0] = lastPoint;
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiping = true
        guard let touch = touches.first else{ return }
        let currentPoint = touch.location(in: self)
        ctr += 1;
        pts[ctr] = currentPoint;
        if (ctr == 4)
        {
            pts[3] = CGPoint(x: ((pts[2].x + pts[4].x)/2.0), y: ((pts[2].y + pts[4].y)/2.0))// move the endpoint to the middle of the line joining the second control point of the first Bezier segment and the first control point of the second Bezier segment
            pathFree.move(to: pts[0])
            pathFree.addCurve(to: pts[3], controlPoint1: pts[1], controlPoint2: pts[2])
            
            // replace points and get ready to handle the next segment
            pts[0] = pts[3];
            pts[1] = pts[4];
            ctr = 1;
        }
        self.drawWhenMouseMove(isMove: true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !swiping else{return}
    }
    
    
    func drawWhenMouseMove(isMove: Bool){
        shapeLayer = buildShape(withHighLight: false)
        self.layer.addSublayer(shapeLayer)
    }
    
    
    
    func buildShape(withHighLight isHighLight: Bool) -> CAShapeLayer {
        let shapeFinal = CAShapeLayer()
        shapeFinal.path = pathFree.cgPath
        shapeFinal.strokeColor = UIColor.red.cgColor
        shapeFinal.lineWidth = 2
        shapeFinal.fillColor = UIColor.clear.cgColor
        if isHighLight {
            shapeFinal.lineWidth = 4 + 1
            shapeFinal.strokeColor = UIColor.red.cgColor
        }
        return shapeFinal
    }
}
