//
//  ViewController.swift
//  SquareToCircle
//
//  Created by Andrew Seeley on 5/2/17.
//  Copyright © 2017 Seemu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let squareLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
     
        // Add the square to our view
        let squareCenter = CGPoint(x: 200, y: 200)
        let square = squarePathWithCenter(center: squareCenter, side: 100)
        squareLayer.path = square.cgPath
        squareLayer.fillColor = UIColor.red.cgColor
        self.view.layer.addSublayer(squareLayer)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch!.location(in: self.view)
        if squareLayer.path!.contains(point) {
            print ("We tapped the square")
        }
    }
    
    func squarePathWithCenter(center: CGPoint, side: CGFloat) -> UIBezierPath {
        let squarePath = UIBezierPath()
        let startX = center.x - side / 2
        let startY = center.y - side / 2
        squarePath.move(to: CGPoint(x: startX, y: startY))
        squarePath.addLine(to: squarePath.currentPoint)
        squarePath.addLine(to: CGPoint(x: startX + side, y: startY))
        squarePath.addLine(to: squarePath.currentPoint)
        squarePath.addLine(to: CGPoint(x: startX + side, y: startY + side))
        squarePath.addLine(to: squarePath.currentPoint)
        squarePath.addLine(to: CGPoint(x: startX, y: startY + side))
        squarePath.addLine(to: squarePath.currentPoint)
        squarePath.close()
        return squarePath
    }
    
    
}

