//
//  ViewController.swift
//  DynamicViews
//
//  Created by Malek T. on 9/17/15.
//  Copyright © 2015 Medigarage Studios LTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var iconAnimator:UIDynamicAnimator!
    var btnAnimator: UIDynamicAnimator!
    
    
    @IBOutlet var dismissButton: UIButton!
    @IBOutlet var icon: UIImageView!
    
    @IBAction func dismissAction(_ sender: AnyObject) {
        
        iconAnimator = UIDynamicAnimator(referenceView: icon)
        iconAnimator.removeAllBehaviors()
        let iconDestinationPoint: CGPoint = CGPoint(x: -20, y: -300)
        let snapBehavior = UISnapBehavior(item: icon, snapTo: iconDestinationPoint)
        snapBehavior.damping = 20.0
        iconAnimator.addBehavior(snapBehavior)
        
        // Animating the button
        let btnDestinationPoint: CGPoint = CGPoint(x: 20, y: 300)
        btnAnimator = UIDynamicAnimator(referenceView: dismissButton)
        btnAnimator.removeAllBehaviors()
        let dynamicItemBehavior = UIDynamicItemBehavior(items: [dismissButton])
        dynamicItemBehavior.addLinearVelocity(btnDestinationPoint, for: dismissButton)
        btnAnimator.addBehavior(dynamicItemBehavior)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dismissButton.layer.cornerRadius = 20.0
        dismissButton.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

