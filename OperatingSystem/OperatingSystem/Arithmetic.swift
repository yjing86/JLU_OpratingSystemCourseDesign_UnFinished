//
//  Arithmetic.swift
//  OperatingSystem
//
//  Created by Y.Jing on 2020/10/21.
//

import Foundation

struct Arithmetic{
    var cards: Array<Card>
    
    mutating func changeState(num:Int, tempState:Int){
        cards[num].state = tempState
        if tempState == 0{
            cards[num].content = "Waiting"
        }else if tempState == 1 {
            cards[num].content = "Working"

        }else if tempState == 2 {
            cards[num].content = "Done"

        }
    }
    
    init(numberOfCards:Int) {
        cards = Array<Card>()
        for i in 0..<numberOfCards{
            cards.append(Card(id: i))
        }
    }
    mutating func cal (mark:Int) -> Array<anima>{
        var animaArray:Array<anima> = Array<anima>()
        if mark == 0{
            animaArray.append(anima(num:1,state: 1))
            animaArray.append(anima(num:1,state: 2))
            
            for i in 0..<cards.count{
                if i != 1{
                    animaArray.append(anima(num:i,state: 1))
                    animaArray.append(anima(num:i,state: 2))
                }
            }
        }else if mark == 1{
            for i in 0..<cards.count{
                animaArray.append(anima(num:i,state: 1))
                animaArray.append(anima(num:i,state: 2))
            }
        }
        return animaArray
    }
    
  
    struct Card:Identifiable {
        var state:Int = 0
        var id:Int
        var content:String = "Waiting"
    }
    mutating func mutiThread(){
        
    }
}
struct anima {
    var num:Int = 0
    var state:Int = 0
}
