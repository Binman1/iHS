//
//  RegisterVC.swift
//  iHS Swift
//
//  Created by arash on 11/10/16.
//  Copyright © 2016 Ali Zare Sh. All rights reserved.
//

/*
 Arash : Section1 - Register View Controller
 */

import UIKit

class RegisterVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGestures()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// Set Edge Gestures
    func setGestures() {
        let leftGestureScreen = UIPanGestureRecognizer(target: self, action: #selector(goToWelcomeVC))
        view.addGestureRecognizer(leftGestureScreen)
        
    }
    
    func goToWelcomeVC(sender : UIPanGestureRecognizer) {
        let transition = sender.translationInView(self.view)
        if transition.x > 0 {
        dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    
}
