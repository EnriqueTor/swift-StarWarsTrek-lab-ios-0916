//
//  ViewController.swift
//  StarWarTrek
//
//  Created by James Campagno on 10/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lukeSkywalker: UIImageView!
    @IBOutlet weak var hanSolo: UIImageView!
    @IBOutlet weak var chewbacca: UIImageView!
    @IBOutlet weak var anakinJedi: UIImageView!
    @IBOutlet weak var captainKirk: UIImageView!
    @IBOutlet weak var drMacCoy: UIImageView!
    @IBOutlet weak var spock: UIImageView!
    @IBOutlet weak var uhuru: UIImageView!
    
    var starWarsCharacter: UIImage!
    var starTrekCharacter: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starTrekPicked()
        starWarsPicked()
        
    }
    
    func starWarsPicked() {
        
        let starWars = [lukeSkywalker, hanSolo, chewbacca, anakinJedi]
        
        for view in starWars {
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeColor))
            
            gestureRecognizer.numberOfTapsRequired = 1
            view?.addGestureRecognizer(gestureRecognizer)
            
        }
    }
    
    
    func starTrekPicked() {
        
        let starTreck = [captainKirk, drMacCoy, spock, uhuru]
        
        for view in starTreck {
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeColor2))
            
            gestureRecognizer.numberOfTapsRequired = 1
            view?.addGestureRecognizer(gestureRecognizer)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFight" {
            if let dest = segue.destination as? FightViewController {
                dest.starWarsSelected = starWarsCharacter
                dest.starTrekSelected = starTrekCharacter
                
            }
        }
    }
    
    func changeColor(_ sender: UITapGestureRecognizer) {
        
        let tappedView = sender.view as! UIImageView
        tappedView.layer.borderWidth = 4
        tappedView.layer.borderColor = UIColor.gray.cgColor
        tappedView.alpha = 0.5
        starWarsCharacter = tappedView.image
        checkForFight()
        
    }
    
    func changeColor2(_ sender: UITapGestureRecognizer) {
        
        let tappedView = sender.view as! UIImageView
        tappedView.layer.borderWidth = 4
        tappedView.layer.borderColor = UIColor.gray.cgColor
        tappedView.alpha = 0.5
        starTrekCharacter = tappedView.image
        
        checkForFight()
    }
    
    func checkForFight() {
        if starWarsCharacter != nil && starTrekCharacter != nil {
            performSegue(withIdentifier: "segueFight", sender: self)
        }
    }
}





