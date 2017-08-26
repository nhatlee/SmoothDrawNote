//
//  DrawVC.swift
//  DrawNote
//
//  Created by nhatlee on 8/26/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit

class DrawVC: UIViewController, UIGestureRecognizerDelegate {

    var panGesture: UIPanGestureRecognizer!
    
    var firstPoint: CGPoint?
    var secondPoint: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(touch:)))
//        panGesture.delegate = self
//        self.view.addGestureRecognizer(panGesture)
    }
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        let startPoint = gestureRecognizer.location(in: self.view)
//        
//        return true
//    }
//    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        <#code#>
//    }
    
    func panGestureAction(touch: UIPanGestureRecognizer){
        
    }
    
    
    func addLine(fromPoint start: CGPoint, toPoint end:CGPoint) {
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.strokeColor = UIColor.red.cgColor
        line.lineWidth = 3
        line.lineJoin = kCALineJoinRound
        self.view.layer.addSublayer(line)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
