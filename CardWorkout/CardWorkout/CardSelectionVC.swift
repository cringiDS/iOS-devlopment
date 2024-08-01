//
//  CardSelectionVC.swift
//  KeshavCard
//
//  Created by kanu priya on 18/07/24.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var CardImageView: UIImageView!

    var cards: [UIImage] = Card.allValues
    
    var timer: Timer! //force unwrapping
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1 , target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    
    @objc func showRandomImage() {
        CardImageView.image = cards.randomElement() ?? UIImage(named: "AS") //? optional in case it's empty and AS shows when array empty
    }


    @IBAction func StopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    /*@IBAction func rulesButtonTapped(_ sender: UIButton) {
    }*/ //don't need this coz we alrady based it off the segway
}
