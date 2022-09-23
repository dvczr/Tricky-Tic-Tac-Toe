//
//  CreateNewGameViewController.swift
//  3T
//
//  Created by David Zirath on 2022-09-20.
//

import UIKit

class CreateNewGameViewController: UIViewController {
    
    var game = TicTacToe()
    
    let segueToEnterName: String = "segueToEnterName"

    @IBOutlet weak var viewPopUpFrame: UIView!
    @IBOutlet weak var viewPopUpContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewPopUpFrame.layer.cornerRadius = 11
        viewPopUpContainer.layer.cornerRadius = 4
    }

    @IBAction func modePvsPvsCpu(_ sender: UIButton) {
        let ans = sender.tag
        self.game.createNewGame(selection: ans)
        performSegue(withIdentifier: segueToEnterName, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToEnterName {
            if let destinationVC = segue.destination as? EnterNameViewController {
                destinationVC.game =  self.game
            }
        }
    }
}
