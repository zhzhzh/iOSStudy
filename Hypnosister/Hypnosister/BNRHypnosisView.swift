//
//  BNRHypnosisView.swift
//  Hypnosister
//
//  Created by Zhang, Jie on 9/8/16.
//  Copyright © 2016 Jie Zhang. All rights reserved.
//

import UIKit

class BNRHypnosisView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let bounds = self.bounds;
        var center = CGPoint();
        center.x = bounds.origin.x + bounds.size.width / 2.0;
        center.y = bounds.origin.y + bounds.size.height / 2.0;
        
//        let radius = (min(bounds.size.width, bounds.size.height) / 2.0)
//        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true);
        
        let maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
        let path = UIBezierPath();
        
        var currentRadius = maxRadius;
        while currentRadius > 0 {
            path.move(to: CGPoint(x:center.x + currentRadius, y: center.y));
            path.addArc(withCenter: center, radius: currentRadius, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true);
            currentRadius -= 20;
        }
        
        path.lineWidth = 10;
        UIColor.lightGray.setStroke()
        
        path.stroke();
        
        if let currentContext = UIGraphicsGetCurrentContext() {
        
            currentContext.saveGState();
            currentContext.setShadow(offset: CGSize(width:4 ,height: 7), blur:3)
        
        
            let image = UIImage.init(named:"logo")
            image?.draw(in: rect)
            
            currentContext.restoreGState();
        }
        

        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.backgroundColor = UIColor.clear;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
