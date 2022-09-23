//
//  EnterNameViewController.swift
//  3T
//
//  Created by David Zirath on 2022-09-20.
//

import UIKit

class EnterNameViewController: UIViewController {
    
    var game: TicTacToe?
    
    let segueToTicTacToe: String = "segueToTicTacToe"
    
    @IBOutlet weak var viewPopUpFrame: UIView!
    @IBOutlet weak var viewPopUpContainer: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtFieldUpper: UITextField!
    @IBOutlet weak var txtFieldLower: UITextField!
    @IBOutlet weak var btnPlay: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewPopUpFrame.layer.cornerRadius = 11
        viewPopUpContainer.layer.cornerRadius = 4
        
        if let game = self.game {
            if game.p2!.name == "CPU" {
                txtFieldLower.isUserInteractionEnabled = false
                txtFieldLower.borderStyle = .none
                txtFieldLower.text = game.p2!.name
            }
        }
    }
    
    @IBAction func onPlay(_ sender: Any) {
        if let game = self.game {
            if (game.p2!.name == "CPU") && (txtFieldUpper.text != "") {
                game.p1!.name = txtFieldUpper.text!
            }
            else if (txtFieldUpper.text != "") && (txtFieldLower.text != "") {
                game.p1!.name = txtFieldUpper.text!
                game.p2!.name = txtFieldLower.text!
            }
            else {return}
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToTicTacToe {
            if let destinationVC = segue.destination as? TicTacToeViewController {
                destinationVC.game = self.game
            }
        }
    }
}
