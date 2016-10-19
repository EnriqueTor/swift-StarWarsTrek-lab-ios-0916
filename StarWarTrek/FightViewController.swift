//
//  FightViewController.swift
//  StarWarTrek
//
//  Created by Enrique Torrendell on 10/19/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FightViewController: UIViewController {

    @IBOutlet weak var starTrekFighter: UIImageView!
    @IBOutlet weak var starWarsFighter: UIImageView!
    
    var starTrekSelected: UIImage?
    var starWarsSelected: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        starWarsFighter.image = starWarsSelected
        starTrekFighter.image = starTrekSelected
        
        drag()
        
        
        
        
    }
    
    
    func drag() {
        
        let dragStarTrek = UIPanGestureRecognizer(target: self, action: #selector(draggingView(_:)))
        starTrekFighter?.addGestureRecognizer(dragStarTrek)
//        punchStarTrek()
    
        let dragStarWars = UIPanGestureRecognizer(target: self, action: #selector(draggingView(_:)))
        starWarsFighter?.addGestureRecognizer(dragStarWars)
        
    }
    
    func draggingView(_ sender: UIPanGestureRecognizer) {
        
        let point = sender.location(in: view)
        let draggedView = sender.view!
        draggedView.center = point
        
        if starWarsFighter.frame.intersects(starTrekFighter.frame) {
            view.backgroundColor = getRandomColor()
        }
        else {
            view.backgroundColor = UIColor.white
        }
    
    }
    
    func getRandomColor() -> UIColor {
        
            let red:CGFloat = CGFloat(drand48())
            let green:CGFloat = CGFloat(drand48())
            let blue:CGFloat = CGFloat(drand48())
            
            return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
        }
    }
    
    

