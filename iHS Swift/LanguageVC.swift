//
//  LanguageVC.swift
//  iHS Swift
//
//  Created by arash on 11/10/16.
//  Copyright © 2016 Ali Zare Sh. All rights reserved.
//


/*
 Arash : Section1 - Language View Controller
 */

import UIKit

class LanguageVC: UIViewController {
    
    @IBOutlet weak var btnEn: UIButton!
    @IBOutlet weak var btnIr: UIButton!
    @IBOutlet weak var btnAr: UIButton!
    @IBOutlet weak var btnTr: UIButton!
    
    
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
        let rightGestureScreen = UIPanGestureRecognizer(target: self, action: #selector(goToWelcomeVC))
        
        view.addGestureRecognizer(rightGestureScreen)
        
    }
    
    ///selector func
     func goToWelcomeVC(sender : UIPanGestureRecognizer) {
        let transition = sender.translationInView(self.view)
        
        if transition.x < 0 {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let welcomeVC = storyBoard.instantiateViewControllerWithIdentifier("welcomeVC")
            let transitionStyle = UIModalTransitionStyle.FlipHorizontal
            welcomeVC.modalTransitionStyle = transitionStyle
            self.presentViewController(welcomeVC, animated: true, completion: nil)
        }
    }
    
}
