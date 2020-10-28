//
//  Eisenburg_Mcguire.swift
//  OperatingSystem
//
//  Created by Y.Jing on 2020/10/15.
//


import SwiftUI
import Foundation

class EisenburgArithemetic: ObservableObject{
    
    @Published var model:Arithmetic
    
    static func create(temp:Int)->Arithmetic{
        
        let numberOfCards:Int = temp
        return Arithmetic(numberOfCards: numberOfCards)
    }
    init(temp:Int){
        self.model = EisenburgArithemetic.create(temp: temp)
    }
    func changeState(num:Int, tempState:Int){
        model.changeState(num: num, tempState: tempState)
    }
}

struct Eisenburg: View {
    @ObservedObject var eisenburgViewModel:EisenburgArithemetic
    
    @ObservedObject var pickerModel:PickerModel
    
    @State var mark:Int = 1
    
    var count:Int = 0
    var body: some View{
        VStack{
            ForEach(0..<eisenburgViewModel.model.cards.count){ id in
                CardView(card:eisenburgViewModel.model.cards[id])
            }
            .foregroundColor(Color.white)
            .font(Font.largeTitle)
            Text(" ")
            
            HStack{
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut(duration:0.8)){
                        if mark == 1 {
                            for i in 0..<eisenburgViewModel.model.cards.count{
                                if eisenburgViewModel.model.cards[eisenburgViewModel.model.cards.count-i-1].state == 1{
                                    eisenburgViewModel.changeState(num: eisenburgViewModel.model.cards.count-i-1, tempState: 2)
                                    break
                                }
                                if eisenburgViewModel.model.cards[eisenburgViewModel.model.cards.count-i-1].state == 0{
                                    eisenburgViewModel.changeState(num: eisenburgViewModel.model.cards.count-i-1, tempState: 1)
                                    break
                                }
                            }
                        }
                    }
                }, label: {Text("开始")
                    .foregroundColor(Color.blue)
                    .font(Font.largeTitle)
                    
                })
                
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut(duration:0.8)){
                        
                        for i in 0..<eisenburgViewModel.model.cards.count{
                            eisenburgViewModel.model.changeState(num: i, tempState: 0)
                        }
                        mark = 1
                        
                    }
                }, label: {Text("重启")
                    .foregroundColor(Color.blue)
                    .font(Font.largeTitle)
                    
                })
                Spacer()
                
            }
            Text(" ")
        }
        
        
    }
    
}

