//
//  ViewController.swift
//  Robot
//
//  Created by user130165 on 11/19/17.
//  Copyright © 2017 KevinGonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Cabeza: ParteRobot!
    @IBOutlet weak var Tronco: ParteRobot!
    @IBOutlet weak var PiernaIzq: ParteRobot!
    @IBOutlet weak var PiernaDer: ParteRobot!
    @IBOutlet weak var BrazoIzq: ParteRobot!
    @IBOutlet weak var BrazoDer: ParteRobot!

    
    private lazy var animator : UIDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    private var gravedad : UIGravityBehavior!
    private var colision : UICollisionBehavior!
    private var snap : UISnapBehavior!
    private var Posiciones : [CGPoint] = []
    private var robotParts : [ParteRobot] = []
    private var PartesOnPoint : [Bool] = []
    private var Armado = true
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        robotParts = [Cabeza, Tronco, PiernaDer, PiernaIzq, BrazoDer, BrazoIzq]
        Posiciones = [Cabeza.center, Tronco.center, PiernaDer.center, PiernaIzq.center,BrazoDer.center , BrazoIzq.center]
        PartesOnPoint = [true, true, true, true, true, true]
    }
    
    @IBAction func OnClick(_ sender: ParteRobot)
    {
        animator.removeAllBehaviors()
        if(Armado)
        {
            for parte in robotParts
            {
                gravedad = UIGravityBehavior(items: [parte])
                colision = UICollisionBehavior(items: [parte])
                colision.translatesReferenceBoundsIntoBoundary = true
                animator.addBehavior(gravedad)
                animator.addBehavior(colision)
            }
            PartesOnPoint = [false, false, false, false, false, false]
            Armado = false
        }
        else
        {
            snap = UISnapBehavior(item: robotParts[sender.tag], snapTo: Posiciones[sender.tag])
            snap.damping = 0.2
            animator.addBehavior(snap)
            view.layoutIfNeeded()
            PartesOnPoint[sender.tag] = true
            if !PartesOnPoint.contains(false)
            {
                Armado = true
            }
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        animator.removeAllBehaviors()
    }


}

