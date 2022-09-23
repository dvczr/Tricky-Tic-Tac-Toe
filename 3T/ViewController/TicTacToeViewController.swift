//
//  TicTacToeViewController.swift
//  3T
//
//  Created by David Zirath on 2022-09-16.
//

import UIKit

class TicTacToeViewController: UIViewController {
    
    var game: TicTacToe?
    
    let segueToPopUpRematch: String = "segueToPopUpRematch"
    
    let imgCross = UIImage(systemName: "xmark")!.withTintColor(.systemIndigo)
    let imgCircle = UIImage(systemName: "circle")!.withTintColor(.systemTeal)
    
    
    var rsltWin: String? = nil
    var winConditions: [String]? = nil
    
    @IBOutlet weak var t1: UIImageView!
    @IBOutlet weak var t2: UIImageView!
    @IBOutlet weak var t3: UIImageView!
    @IBOutlet weak var t4: UIImageView!
    @IBOutlet weak var t5: UIImageView!
    @IBOutlet weak var t6: UIImageView!
    @IBOutlet weak var t7: UIImageView!
    @IBOutlet weak var t8: UIImageView!
    @IBOutlet weak var t9: UIImageView!
    
    @IBOutlet weak var onWinInnerD: UIImageView!
    @IBOutlet weak var onWinOuterLeftV: UIImageView!
    @IBOutlet weak var onWinOuterRightV: UIImageView!
    @IBOutlet weak var onWinUpperH: UIImageView!
    @IBOutlet weak var onWinLowerH: UIImageView!
    
    @IBOutlet weak var lblUpper: UILabel!
    @IBOutlet weak var lblLower: UILabel!
    
    @IBOutlet weak var p1ScoreWon: UILabel!
    @IBOutlet weak var p1ScoreLost: UILabel!
    @IBOutlet weak var p1ScoreDraw: UILabel!
    
    @IBOutlet weak var p2ScoreWon: UILabel!
    @IBOutlet weak var p2ScoreLost: UILabel!
    @IBOutlet weak var p2ScoreDraw: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let game = game {
            lblUpper.text = game.p1!.name
            lblLower.text = game.p2!.name
            p1ScoreWon.text = "WON: \(game.p1!.scoreWon)"
            p1ScoreLost.text = "LOST: \(game.p1!.scoreLost)"
            p1ScoreDraw.text = "DRAW: \(game.p1!.scoreDraw)"
            p2ScoreWon.text = "WON: \(game.p2!.scoreWon)"
            p2ScoreLost.text = "LOST: \(game.p2!.scoreLost)"
            p2ScoreDraw.text = "DRAW: \(game.p2!.scoreDraw)"
            onTurn()

            
        }
    }
    
    @IBAction func onGridTileSelected(_ sender: UITapGestureRecognizer) {

        guard let tappedTile = sender.view?.tag else {return}
        guard let game = self.game else {return}
        
        let playersMoves = game.playerMove(indexOf: tappedTile)
        let moves = playersMoves[0]
        let isPlayersTurn = playersMoves[1]
        let p1 = 1
        let p2 = 2
        
        while game.gameRunning {
            onTurn()
//            imgCross!.withTintColor(.systemIndigo)
//            imgCircle!.withTintColor(.systemTeal)
            switch moves {
            case 1:
                if isPlayersTurn == p1 { t1.image = self.imgCross
                    t1.tintColor = .systemTeal.withAlphaComponent(0.5)
                }
                else if isPlayersTurn == p2 { t1.image = self.imgCircle
                    t1.tintColor = .systemIndigo.withAlphaComponent(0.5)
                }
                break
            case 2:
                if isPlayersTurn == p1 {
                    t2.image = self.imgCross
                    t2.tintColor = .systemTeal.withAlphaComponent(0.5)
                }
                else if isPlayersTurn == p2 {
                    t2.image = self.imgCircle
                    t2.tintColor = .systemIndigo.withAlphaComponent(0.5)
                }
                break
            case 3:
                if isPlayersTurn == p1 {
                    t3.image = imgCross
                    t3.tintColor = .systemTeal.withAlphaComponent(0.5)
                }
                else if isPlayersTurn == p2 {
                    t3.image = imgCircle
                    t3.tintColor = .systemIndigo.withAlphaComponent(0.5)
                }
                break
            case 4:
                if isPlayersTurn == p1 {
                    t4.image = imgCross
                    t4.tintColor = .systemTeal.withAlphaComponent(0.5)
                }
                else if isPlayersTurn == p2 {
                    t4.image = imgCircle
                    t4.tintColor = .systemIndigo.withAlphaComponent(0.5)
                }
                break
            case 5:
                if isPlayersTurn == p1 {
                    t5.image = imgCross
                    t5.tintColor = .systemTeal.withAlphaComponent(0.5)
                }
                else if isPlayersTurn == p2 {
                    t5.image = imgCircle
                    t5.tintColor = .systemIndigo.withAlphaComponent(0.5)
                }
                break
            case 6:
                if isPlayersTurn == p1 {
                    t6.image = imgCross
                    t6.tintColor = .systemTeal.withAlphaComponent(0.5)
                }
                else if isPlayersTurn == p2 {
                    t6.image = imgCircle
                    t6.tintColor = .systemIndigo.withAlphaComponent(0.5)
                }
                break
            case 7:
                if isPlayersTurn == p1 {
                    t7.image = imgCross
                    t7.tintColor = .systemTeal.withAlphaComponent(0.5)
                }
                else if isPlayersTurn == p2 {
                    t7.image = imgCircle
                    t7.tintColor = .systemIndigo.withAlphaComponent(0.5)
                }
                break
            case 8:
                if isPlayersTurn == p1 {
                    t8.image = imgCross
                    t8.tintColor = .systemTeal.withAlphaComponent(0.5)
                }
                else if isPlayersTurn == p2 {
                    t8.image = imgCircle
                    t8.tintColor = .systemIndigo.withAlphaComponent(0.5)
                }
                break
            case 9:
                if isPlayersTurn == p1 {
                    t9.image = imgCross
                    t9.tintColor = .systemTeal.withAlphaComponent(0.5)
                }
                else if isPlayersTurn == p2 {
                    t9.image = imgCircle
                    t9.tintColor = .systemIndigo.withAlphaComponent(0.5)
                }
                break
            default: return
            }
            
            winConditions = game.winDraw(grid: game.grid)
            guard let winConditions = winConditions else {return}
            
            switch winConditions[0] {
            case "Line.H", "Line.V", "Line.D.Down", "Line.D.Up":
                onWinInnerD.image = UIImage(named: winConditions[0])
                setlblEndOfRound(winConditions: winConditions)
                break
            case "Line.H.Upper":
                onWinUpperH.image = UIImage(named: "Line.H")
                setlblEndOfRound(winConditions: winConditions)
                break
            case "Line.H.Lower":
                onWinLowerH.image = UIImage(named: "Line.H")
                setlblEndOfRound(winConditions: winConditions)
                break
            case "Line.V.Left":
                onWinOuterLeftV.image = UIImage(named: "Line.V")
                setlblEndOfRound(winConditions: winConditions)
                break
            case "Line.V.Right":
                onWinOuterRightV.image = UIImage(named: "Line.V")
                setlblEndOfRound(winConditions: winConditions)
                break
            case "Draw":
                onWinInnerD.image = UIImage(systemName: "stop")
//                onWinInnerD.tintColor = .black
                setlblEndOfRound(winConditions: winConditions)
                break
            default: return
            }
            
            if game.promptRematch {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) { [self] in
                    performSegue(withIdentifier: segueToPopUpRematch, sender: self)
                }
            }
        }
    }
    
    func setlblEndOfRound(winConditions: [String]) {
        
        game!.isP1Act = false
        game!.isP2Act = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.lblUpper.font = UIFont.systemFont(ofSize: 30.0, weight: .black)
            self.lblLower.font = UIFont.systemFont(ofSize: 30.0, weight: .black)
            self.lblUpper.textAlignment = .center
            self.lblLower.textAlignment = .center

            if self.winConditions?[0] == "Draw" {
                self.lblUpper.text = winConditions[1]
                self.lblLower.text = winConditions[1]
            }
            else {
                self.lblUpper.text = winConditions[1]
                self.lblLower.text = winConditions[2]
            }
        }
    }
    
    func onTurn() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                if self.game!.isP1Act {
                    self.lblUpper.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
                    self.lblLower.font = UIFont.systemFont(ofSize: 20.0, weight: .regular)
                    self.lblUpper.textAlignment = .center
                    self.lblLower.textAlignment = .center
                }
                if self.game!.isP2Act {
                    self.lblUpper.font = UIFont.systemFont(ofSize: 20.0, weight: .regular)
                    self.lblLower.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
                    self.lblUpper.textAlignment = .center
                    self.lblLower.textAlignment = .center
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToPopUpRematch {
            if let destinationVC = segue.destination as? PopUpRematchViewController {
                destinationVC.game = self.game
            }
        }
    }
}
