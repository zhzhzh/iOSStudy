//
//  ViewController.swift
//  Hypnosister
//
//  Created by Zhang, Jie on 9/8/16.
//  Copyright © 2016 Jie Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150);
        let firstFrame = view.bounds;
        let firstView = BNRHypnosisView(frame: firstFrame);
//        firstView.backgroundColor = UIColor.redColor();
        view.addSubview(firstView)
        
//        let secondFrame = CGRect(x: 20, y: 30, width: 50, height: 50);
//        let secondView = BNRHypnosisView(frame: secondFrame);
//        secondView.backgroundColor = UIColor.blueColor();
//        firstView.addSubview(secondView)
        
        
        view.backgroundColor = UIColor.white;

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

