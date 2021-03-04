//
//  ViewController.swift
//  WysaPractical
//
//  Created by Rushang Prajapati on 04/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgForDrag: UIImageView!
    var animator: UIDynamicAnimator!
    var snapping: UISnapBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: view)
        snapping = UISnapBehavior(item: imgForDrag, snapTo: view.center)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.panGesture))
        imgForDrag.addGestureRecognizer(panGesture)
    }
    
    @objc func panGesture(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            animator.removeBehavior(snapping)
        case .changed:
            let tran = sender.translation(in: view)
            imgForDrag.center = CGPoint(x: imgForDrag.center.x + tran.x, y: imgForDrag.center.y + tran.y)
            sender.setTranslation(.zero, in: view)
        case .ended, .cancelled, .failed:
            animator.addBehavior(snapping)
        default:
            break
        }
    }
    
}

