//
//  Player.swift
//  3T
//
//  Created by David Zirath on 2022-09-16.
//

import Foundation


struct Player {
    private var _name: String = ""
    private var _scoreWon: Int = 0
    private var _scoreDraw: Int = 0
    private var _scoreLost: Int = 0
    
    public init(name: String, scoreWon: Int, scoreDraw: Int, scoreLost: Int) {
        self.name = name
        self.scoreWon = scoreWon
        self.scoreDraw = scoreDraw
        self.scoreLost = scoreLost
    }
    
    public var name: String {
        get {
            return self._name;
        }
        set {
            if newValue.isEmpty {
//                return
                fatalError("No input was made!")
            } else {
                self._name = newValue
            }
        }
    }
    
    public var scoreWon: Int {
        get {
            return self._scoreWon
        }
        set {
            if newValue >= 1 {
                self._scoreWon = newValue
            }
        }
    }
    
    public var scoreDraw: Int {
        get {
            return self._scoreDraw
        }
        set {
            if newValue >= 1 {
                self._scoreDraw = newValue
            }
        }
    }
    
    public var scoreLost: Int {
        get {
            return self._scoreLost
        }
        set {
            if newValue >= 1 {
                self._scoreLost = newValue
            }
        }
    }
    
    
//    var name: String
//
//    private var _scoreWon = 0
//    private var _scoreDraw = 0
//    private var _scoreLost = 0
//
//    var scoreWon: Int {
//        get { return _scoreWon}
//        set {
//            _scoreWon = newValue
//        }
//    }
//
//    var scoreDraw: Int {
//        get { return _scoreDraw}
//        set {
//            _scoreDraw = newValue
//        }
//    }
//
//    var scoreLost: Int {
//        get { return _scoreLost}
//        set {
//            _scoreLost = newValue
//        }
//    }

    
    
//    private var scoreDraw: Int
//    private var scoreLost: Int
    
//    init(name: String) {
//        self.name = name
////        self.scoreWon = 0
//        self.scoreDraw = 0
//        self.scoreLost = 0
//    }
//    var scoreWon: Int {
//        get {
//            return self.scoreWon
//        }
//        set {
//            scoreWon = newValue
//        }
//    }
    
    
}
