//
//  SecondViewController.swift
//  blackjackGame
//
//  Created by Thuc Nguyen on 2020-05-13.
//  Copyright © 2020 Thuc Nguyen. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {
    
//house cards
    @IBOutlet weak var houseCard1: UIImageView!
    
    @IBOutlet weak var houseCard2: UIImageView!
    
    @IBOutlet weak var houseCard3: UIImageView!
    
    @IBOutlet weak var houseCard4: UIImageView!
    
    @IBOutlet weak var houseCard5: UIImageView!
    
//your cards
    @IBOutlet weak var yourCard1: UIImageView!
    
    @IBOutlet weak var yourCard2: UIImageView!
    
    @IBOutlet weak var yourCard3: UIImageView!
    
    @IBOutlet weak var yourCard4: UIImageView!
    
    @IBOutlet weak var yourCard5: UIImageView!
    
//your score
    @IBOutlet weak var yourScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    var cards = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48 ,49, 50, 51]

    var deck:Int = 52
    var Score_house1: Int = 0
    var Score_you1: Int = 0
    var Score_house2: Int = 0
    var Score_you2: Int = 0
    
    func returnScore1 (num: Int) -> Int {
        var score: Int = 0
        if (num==11 || num==12 || num==13) {
            score = 10
        }
        else if (num==14) {
            score = 1
        }
        else {
            score = num
        }
        return score
    }
    
    func returnScore2 (num: Int) -> Int {
        var score: Int = 0
        if (num==11 || num==12 || num==13) {
            score = 10
        }
        else if (num==14) {
            score = 11
        }
        else {
            score = num
        }
        return score
    }
    
    func bust(score1: Int, score2: Int) -> Int  {
        var didBust: Int = 0
        if (score1>21 && score2>21) {
           didBust = 1
        }
        else {
            didBust = 0
        }
        return didBust
    }
    
    func drawCard ()-> Int {
        var card: Int = -1
        card = Int.random(in: 0...(deck-1))
        let temp:Int = cards[card]
        cards[card] = cards[(deck-1)]
        cards[(deck-1)] = temp
        deck-=1
        return temp
    }
    
    var houseNum1: Int = 0
    var houseSuit1: Int = 0
    
    var startCount: Int = 0
    @IBAction func startButton() {
        if (startCount == 0) {
            let your1: Int
            your1 = drawCard()
            let yourNum1 = (your1/4)+2
            let yourSuit1 = (your1%4)+1
            yourCard1.image = UIImage(named: "card\(yourNum1)suit\(yourSuit1)")
            
            let house1: Int
            house1 = drawCard()
            houseNum1 = (house1/4)+2
            houseSuit1 = (house1%4)+1
            houseCard1.image = UIImage(named: "facedown")
            
            let your2: Int
            your2 = drawCard()
            let yourNum2 = (your2/4)+2
            let yourSuit2 = (your2%4)+1
            yourCard2.image = UIImage(named: "card\(yourNum2)suit\(yourSuit2)")
            if (yourNum1==14 && yourNum2==14) {
                Score_you1 = 12
                Score_you2 = 12
            }
            else {
                Score_you1 = Score_you1 + returnScore1(num: yourNum1)
                Score_you2 = Score_you2 + returnScore2(num: yourNum1)
                Score_you1 = Score_you1 + returnScore1(num: yourNum2)
                Score_you2 = Score_you2 + returnScore2(num: yourNum2)
            }
            
            let house2: Int
            house2 = drawCard()
            let houseNum2 = (house2/4)+2
            let houseSuit2 = (house2%4)+1
            houseCard2.image = UIImage(named: "card\(houseNum2)suit\(houseSuit2)")
            if (houseNum1==14 && houseNum2==14) {
                Score_house1 = 12
                Score_house2 = 12
            }
            else {
                Score_house1 = Score_house1 + returnScore1(num: houseNum1)
                Score_house2 = Score_house2 + returnScore2(num: houseNum1)
                Score_house1 = Score_house1 + returnScore1(num: houseNum2)
                Score_house2 = Score_house2 + returnScore2(num: houseNum2)
            }
            startCount = 1
        }
    }
    


    var hitCount: Int = 0
    @IBAction func hitButton() {
        if (startCount == 1 && standCount == 0) {
            if (hitCount == 0) {
                if (bust(score1: Score_you1, score2: Score_you2) == 0) {
                    let your3: Int
                    your3 = drawCard()
                    let yourNum3 = (your3/4)+2
                    let yourSuit3 = (your3%4)+1
                    yourCard3.image = UIImage(named: "card\(yourNum3)suit\(yourSuit3)")
                    hitCount+=1
                    Score_you1 = Score_you1 + returnScore1(num: yourNum3)
                    Score_you2 = Score_you2 + returnScore2(num: yourNum3)
                }
                else {
                    yourScore.text = String("YOU BUST!")
                    hitCount+=6
                }
            }
            else if (hitCount == 1) {
                if (bust(score1: Score_you1, score2: Score_you2) == 0) {
                    let your4: Int
                    your4 = drawCard()
                    let yourNum4 = (your4/4)+2
                    let yourSuit4 = (your4%4)+1
                    yourCard4.image = UIImage(named: "card\(yourNum4)suit\(yourSuit4)")
                    hitCount+=1
                    Score_you1 = Score_you1 + returnScore1(num: yourNum4)
                    Score_you2 = Score_you2 + returnScore2(num: yourNum4)
                }
                else {
                    yourScore.text = String("YOU BUST!")
                    hitCount+=6
                }
            }
            else if (hitCount == 2) {
                if (bust(score1: Score_you1, score2: Score_you2) == 0) {
                    let your5: Int
                    your5 = drawCard()
                    let yourNum5 = (your5/4)+2
                    let yourSuit5 = (your5%4)+1
                    yourCard5.image = UIImage(named: "card\(yourNum5)suit\(yourSuit5)")
                    hitCount+=1
                    Score_you1 = Score_you1 + returnScore1(num: yourNum5)
                    Score_you2 = Score_you2 + returnScore2(num: yourNum5)
                }
                else {
                    yourScore.text = String("YOU BUST!")
                    hitCount+=6
                }
            }
        }
    }
    
    var standCount: Int = 0
    @IBAction func standButton() {
        if (standCount == 0) {
            if (Score_house2<17) {
                let house3: Int
                house3 = drawCard()
                let houseNum3 = (house3/4)+2
                let houseSuit3 = (house3%4)+1
                houseCard3.image = UIImage(named: "card\(houseNum3)suit\(houseSuit3)")
                Score_house1 = Score_house1 + returnScore1(num: houseNum3)
                Score_house2 = Score_house2 + returnScore2(num: houseNum3)
            }
            if (Score_house1<17 && Score_house2<17) {
                let house4: Int
                house4 = drawCard()
                let houseNum4 = (house4/4)+2
                let houseSuit4 = (house4%4)+1
                houseCard4.image = UIImage(named: "card\(houseNum4)suit\(houseSuit4)")
                Score_house1 = Score_house1 + returnScore1(num: houseNum4)
                Score_house2 = Score_house2 + returnScore2(num: houseNum4)
            }
            if (Score_house1<17 && Score_house2<17) {
                let house5: Int
                house5 = drawCard()
                let houseNum5 = (house5/4)+2
                let houseSuit5 = (house5%4)+1
                houseCard5.image = UIImage(named: "card\(houseNum5)suit\(houseSuit5)")
                Score_house1 = Score_house1 + returnScore1(num: houseNum5)
                Score_house2 = Score_house2 + returnScore2(num: houseNum5)
            }
            var scorey:Int = Score_you1
            var scoreh: Int = Score_house1
            if ((21>=Score_you1) && (Score_you1>Score_you2)) {
                scorey = Score_you1
            }
            else if ((21>=Score_you2) && (Score_you2>Score_you1)){
                scorey = Score_you2
            }
            else if (Score_you1>21 && Score_you2>21) {
                scorey = Score_you1
            }
            if ((21>=Score_house1) && (Score_house1>Score_house2)) {
                scoreh = Score_house1
            }
            else if ((21>=Score_house2) && (Score_house2>Score_house1)){
                scoreh = Score_house2
            }
            else if (Score_house1>21 && Score_house2>21) {
                scoreh = Score_house1
            }
            houseCard1.image = UIImage(named: "card\(houseNum1)suit\(houseSuit1)")
            if (scorey>21) {
                yourScore.text = String("YOU BUST! Your Score: \(scorey)")
            }
            else if (scorey<=21) {
                if (scoreh>21) {
                    yourScore.text = String ("YOU WON! Your Score: \(scorey)")
                }
                else if (scorey>scoreh) {
                    yourScore.text = String ("YOU WON! Your Score: \(scorey)")
                }
                else if (scoreh>scorey) {
                    yourScore.text = String ("YOU LOST! Your Score: \(scorey)")
                }
                else if (scorey==scorey) {
                    yourScore.text = String ("TIE! Your Score: \(scorey)")
                }
            }
            standCount = 1
        }
    }
}
