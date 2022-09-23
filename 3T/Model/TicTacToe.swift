//
//  TicTacToe.swift
//  3T
//
//  Created by David Zirath on 2022-09-16.
//

import Foundation
import UIKit

class TicTacToe {
    
    var grid = [0, 0, 0,
                0, 0, 0,
                0, 0, 0]
    
    var isP1Act: Bool = true
    var isP2Act: Bool = false
    var isCpuOn: Bool = false
    var gameRunning: Bool = true
    var promptRematch: Bool = false
    
    let TILE_EMPTY = 0
  
    let asPlayer1 = 1
    let asPlayer2 = 2
    
    var p1: Player?
    var p2: Player?
    
    func createNewGame(selection: Int) {
        switch selection {
        case 1:
            self.p1 = Player(name: "Player 1", scoreWon: 0, scoreDraw: 0, scoreLost: 0)
            self.p2 = Player(name: "CPU", scoreWon: 0, scoreDraw: 0, scoreLost: 0)
            self.isCpuOn = true
            self.isP2Act = false
            break
        case 2:
            self.p1 = Player(name: "Player 1", scoreWon: 0, scoreDraw: 0, scoreLost: 0)
            self.p2 = Player(name: "Player 2", scoreWon: 0, scoreDraw: 0, scoreLost: 0)
            self.isCpuOn = false
            self.isP2Act = false
            break
        default: return
        }
    }
    
    func playerMove(indexOf: Int) -> [Int] {
        let currentTile = (indexOf - 1)
        
        if self.grid[currentTile] == TILE_EMPTY {
            while gameRunning {
                if isP1Act {
                    self.grid[indexOf - 1] = (asPlayer1)
                    let p1Move: [Int] = [indexOf, asPlayer1]
                    switchPlayer()
                    print("\tT\(indexOf):[√] » \(self.p1!.name)")
                    return p1Move
                    
                } else if isP2Act && !isCpuOn {
                    self.grid[indexOf - 1] = (asPlayer2)
                    let p2Move: [Int] = [indexOf, asPlayer2]
                    switchPlayer()
                    print("\tT\(indexOf):[√] » \(self.p2!.name)")
                    return p2Move
                }
                else if isP2Act && isCpuOn{
                    let cpu = cpuMove()
                    self.grid[cpu - 1] = (asPlayer2)
                    let p2Move: [Int] = [cpu, asPlayer2]
                    switchPlayer()
                    print("\tT\(cpu):[√] » CPU")
                    return p2Move
                }
                switchPlayer()
            }
        }
        return [-1,-1]
    }
    
    func cpuMove() -> Int {
        let target = TILE_EMPTY
        var n: Int?
            
            repeat {
                n = Int.random(in: 1...9)
                if grid[n! - 1] == target {
                    break
                }
            } while n != target
        return n!
    }
    
    private func switchPlayer(){
        
        isP1Act.toggle()
        isP2Act.toggle()
    }
    
    func winDraw(grid: [Int]) -> [String] {
        let p1Win: String = "\(self.p1!.name)\nWON!"
        let p2Win: String = "\(self.p2!.name)\nWON!"
        let p1Lose: String = "\(self.p1!.name)\nLOST!"
        let p2Lose: String = "\(self.p2!.name)\nLOST!"
        let draw: String = "¡IT'S A DRAW!"
        let strArray: [String]
        
            // HORIZONTAL 3-IN-A-ROW
            if (grid[0] == asPlayer1) && (grid[1] == asPlayer1) && (grid[2] == asPlayer1) {
                setScoreP1()
                print("\t\(p1Win)\n")
                print("\t\(p2Lose)\n")
                strArray = ["Line.H.Upper", p1Win, p2Lose]
                return strArray
            }
            else if (grid[0] == asPlayer2) && (grid[1] == asPlayer2) && (grid[2] == asPlayer2) {
                setScoreP2()
                print("\t\(p2Win)\n")
                print("\t\(p1Lose)\n")
                strArray = ["Line.H.Upper", p2Win, p1Lose]
                return strArray
            }
            
            if grid[3] == asPlayer1 && grid[4] == asPlayer1 && grid[5] == asPlayer1 {
                setScoreP1()
                print("\t\(p1Win)\n")
                print("\t\(p2Lose)\n")
                strArray = ["Line.H", p1Win, p2Lose]
                return strArray
            }
            else if grid[3] == asPlayer2 && grid[4] == asPlayer2 && grid[5] == asPlayer2 {
                setScoreP2()
                print("\t\(p2Win)\n")
                print("\t\(p1Lose)\n")
                strArray = ["Line.H", p2Win, p1Lose]
                return strArray
            }
            
            if grid[6] == asPlayer1 && grid[7] == asPlayer1 && grid[8] == asPlayer1 {
                setScoreP1()
                print("\t\(p1Win)\n")
                print("\t\(p2Lose)\n")
                strArray = ["Line.H.Lower", p1Win, p2Lose]
                return strArray
            }
            else if grid[6] == asPlayer2 && grid[7] == asPlayer2 && grid[8] == asPlayer2 {
                setScoreP2()
                print("\t\(p2Win)\n")
                print("\t\(p1Lose)\n")
                strArray = ["Line.H.Lower", p2Win, p1Lose]
                return strArray
            }
            // VERTICALL 3-IN-A-ROW
            if grid[0] == asPlayer1 && grid[3] == asPlayer1 && grid[6] == asPlayer1 {
                setScoreP1()
                print("\t\(p1Win)\n")
                print("\t\(p2Lose)\n")
                strArray = ["Line.V.Left", p1Win, p2Lose]
                return strArray
            }
            else if grid[0] == asPlayer2 && grid[3] == asPlayer2 && grid[6] == asPlayer2 {
                setScoreP2()
                print("\t\(p2Win)\n")
                print("\t\(p1Lose)\n")
                strArray = ["Line.V.Left", p2Win, p1Lose]
                return strArray
            }
            if grid[1] == asPlayer1 && grid[4] == asPlayer1 && grid[7] == asPlayer1 {
                setScoreP1()
                print("\t\(p1Win)\n")
                print("\t\(p2Lose)\n")
                strArray = ["Line.V", p1Win, p2Lose]
                return strArray
            }
            else if grid[1] == asPlayer2 && grid[4] == asPlayer2 && grid[7] == asPlayer2 {
                setScoreP2()
                print("\t\(p2Win)\n")
                print("\t\(p1Lose)\n")
                strArray = ["Line.V", p2Win, p1Lose]
                return strArray
            }
            if grid[2] == asPlayer1 && grid[5] == asPlayer1 && grid[8] == asPlayer1 {
                setScoreP1()
                print("\t\(p1Win)\n")
                print("\t\(p2Lose)\n")
                strArray = ["Line.V.Right", p1Win, p2Lose]
                return strArray
            }
            else if grid[2] == asPlayer2 && grid[5] == asPlayer2 && grid[8] == asPlayer2 {
                setScoreP2()
                print("\t\(p2Win)\n")
                print("\t\(p1Lose)\n")
                strArray = ["Line.V.Right", p2Win, p1Lose]
                return strArray
            }
            // DIAGONAL 3-IN-A-ROW
            if (grid[0] == asPlayer1) && (grid[4] == asPlayer1) && (grid[8] == asPlayer1) {
                setScoreP1()
                print("\t\(p1Win)\n")
                print("\t\(p2Lose)\n")
                strArray = ["Line.D.Down", p1Win, p2Lose]
                return strArray
            }
            else if (grid[0] == asPlayer2) && (grid[4] == asPlayer2) && (grid[8] == asPlayer2) {
                setScoreP2()
                print("\t\(p2Win)\n")
                print("\t\(p1Lose)\n")
                strArray = ["Line.D.Down", p2Win, p1Lose]
                return strArray
            }
            
            if (grid[6] == asPlayer1) && (grid[4] == asPlayer1) && (grid[2] == asPlayer1) {
                setScoreP1()
                print("\t\(p1Win)\n")
                print("\t\(p2Lose)\n")
                strArray = ["Line.D.Up", p1Win, p2Lose]
                return strArray
            }
            else if (grid[6] == asPlayer2) && (grid[4] == asPlayer2) && (grid[2] == asPlayer2) {
                setScoreP2()
                print("\t\(p2Win)\n")
                print("\t\(p1Lose)\n")
                strArray = ["Line.D.Up", p2Win, p1Lose]
                return strArray
            }
            // DRAW
            if (grid[0] != 0) && (grid[1] != 0) && (grid[2] != 0) && (grid[3] != 0) && (grid[4] != 0) && (grid[5] != 0) && (grid[6] != 0) && (grid[7] != 0) && (grid[8] != 0) {
                setDraw()
                print("\t\t\t   \(draw)\n")
                strArray = ["Draw", draw]
                return strArray
            }
        return ["nil", "nil", "nil"]
        }
    
    func reMatch(ansYesOrNo: Int) -> String {
        switch ansYesOrNo {
        case 0:
            print("\tReturnin To Home\n")
            gameRunning = true
            promptRematch = false
            isCpuOn = false
            isP1Act = true
            isP2Act = false
            return "segueToHome"
        case 1:
            print("\tReturning To ReMatch\n")
            if isCpuOn {
                isCpuOn = true
            }
            gameRunning = true
            promptRematch = false
            isP1Act = true
            isP2Act = false
            return "segueToTicTacToeRematch"
        default: return ""
        }
    }
    
    func setScoreP1() {
        self.p1?.scoreWon += 1
        self.p2?.scoreLost += 1
        gameRunning = false
        promptRematch = true
        showScore()
    }
    
    func setScoreP2() {
        self.p2?.scoreWon += 1
        self.p1?.scoreLost += 1
        gameRunning = false
        promptRematch = true
        showScore()
    }
    func setDraw() {
        self.p1?.scoreDraw += 1
        self.p2?.scoreDraw += 1
        gameRunning = false
        promptRematch = true
        showScore()
    }
    // CONSOL-LOG
    func showScore() {
        if (p1!.name.count < 3) {
            print("\n\t \(p1!.name)\t\t\t\tVs.\t\t \(p2!.name)\n\t*—————————*\t\t\t\t*—————————*\n\t| Won:\t\(p1!.scoreWon) |\t\t\t\t| Won:\t\(p2!.scoreWon) |\n\t| Lost:\t\(p1!.scoreLost) |\t\t\t\t| Lost:\t\(p2!.scoreLost) |\n\t| Draw:\t\(p1!.scoreDraw) |\t\t\t\t| Draw:\t\(p2!.scoreDraw) |\n\t*—————————*\t\t\t\t*—————————*\n")
        } else if (p1!.name.count >= 3 && p1!.name.count <= 6) {
            print("\n\t \(p1!.name)\t\t\tVs.\t\t \(p2!.name)\n\t*—————————*\t\t\t\t*—————————*\n\t| Won:\t\(p1!.scoreWon) |\t\t\t\t| Won:\t\(p2!.scoreWon) |\n\t| Lost:\t\(p1!.scoreLost) |\t\t\t\t| Lost:\t\(p2!.scoreLost) |\n\t| Draw:\t\(p1!.scoreDraw) |\t\t\t\t| Draw:\t\(p2!.scoreDraw) |\n\t*—————————*\t\t\t\t*—————————*\n")
        } else if (p1!.name.count >= 7 && p1!.name.count <= 10) {
            print("\n\t \(p1!.name)\t\tVs.\t\t \(p2!.name)\n\t*—————————*\t\t\t\t*—————————*\n\t| Won:\t\(p1!.scoreWon) |\t\t\t\t| Won:\t\(p2!.scoreWon) |\n\t| Lost:\t\(p1!.scoreLost) |\t\t\t\t| Lost:\t\(p2!.scoreLost) |\n\t| Draw:\t\(p1!.scoreDraw) |\t\t\t\t| Draw:\t\(p2!.scoreDraw) |\n\t*—————————*\t\t\t\t*—————————*\n")
        } else {
            print("\n\t*—————————*\n\t| Won:\t\(p1!.scoreWon) |\n\t| Lost:\t\(p1!.scoreLost) |\t \(p1!.name)\n\t| Draw:\t\(p1!.scoreDraw) |\n\t*—————————*\n\t\t\t\t Vs.\n\t*—————————*\n\t| Won:\t\(p2!.scoreWon) |\n\t| Lost:\t\(p2!.scoreLost) |\t \(p2!.name)\n\t| Draw:\t\(p2!.scoreDraw) |\n\t*—————————*\n")
        }
    }
}
