//
//  PopUpRematchViewController.swift
//  3T
//
//  Created by David Zirath on 2022-09-20.
//

import UIKit

class PopUpRematchViewController: UIViewController {
    
    var game: TicTacToe?
    
    let segueToTicTacToeRematch: String = "segueToTicTacToeRematch"
    
    @IBOutlet weak var viewPopUpFrame: UIView!
    @IBOutlet weak var viewPopUpContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewPopUpFrame.layer.cornerRadius = 11
        viewPopUpContainer.layer.cornerRadius = 4
    }
    
    @IBAction func reMatch(_ sender: UIButton) {
        guard let game = self.game else {return}
        
        let ans = sender.tag
        let goTo: String = game.reMatch(ansYesOrNo: ans)
        
        performSegue(withIdentifier: goTo, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToTicTacToeRematch {
            if let destinationVC = segue.destination as? TicTacToeViewController {
                destinationVC.game = TicTacToe()
                destinationVC.game?.grid = [ 0, 0, 0,
                                             0, 0, 0,
                                             0, 0, 0 ]
                destinationVC.game?.p1 = self.game?.p1
                destinationVC.game?.p2 = self.game?.p2
                if game!.isCpuOn {
                    destinationVC.game!.isCpuOn = true
                }
            }
        }
    }
}
