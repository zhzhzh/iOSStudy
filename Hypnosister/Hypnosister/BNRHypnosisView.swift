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
        
        let margin:CGFloat = 60
        let imageRect = CGRect(x: margin, y: margin*2, width: bounds.size.width - margin*2, height: bounds.size.height - margin*4);
        
        if let currentContext = UIGraphicsGetCurrentContext() {
            //渐变
            currentContext.saveGState();
            
            let myPath = UIBezierPath()
            
            let p1 = CGPoint(x: imageRect.origin.x + imageRect.size.width/2, y: imageRect.origin.y)
            myPath.move(to: p1)
            let p2 = CGPoint(x:imageRect.origin.x, y: imageRect.origin.y + imageRect.size.height);
            myPath.addLine(to: p2);
            let p3 = CGPoint(x:imageRect.origin.x + imageRect.size.width, y: imageRect.origin.y + imageRect.size.height);
            myPath.addLine(to: p3);
            myPath.addLine(to: p1);
            
            myPath.addClip();
            
            
            let location: [CGFloat] = [ 0.0, 1.0 ];
            let components: [CGFloat] = [ 0.0, 1.0, 0.0, 1.0,
                                          1.0, 1.0, 0.0, 1.0 ];
            
            let colorspace = CGColorSpaceCreateDeviceRGB();
            let gradient = CGGradient(colorSpace: colorspace,colorComponents: components, locations: location, count: 2);
            let startPoint = CGPoint(x: imageRect.origin.x, y: imageRect.origin.y);
            let endPoint = CGPoint(x: imageRect.origin.x + imageRect.size.width, y: imageRect.origin.y + imageRect.size.height);
            currentContext.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0));
            
            currentContext.restoreGState();
            
            //阴影
            currentContext.saveGState();
            currentContext.setShadow(offset: CGSize(width:4 ,height: 7), blur:3)
            let image = UIImage.init(named:"logo")
            image?.draw(in: imageRect)
            
            
            
            
            
            
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
