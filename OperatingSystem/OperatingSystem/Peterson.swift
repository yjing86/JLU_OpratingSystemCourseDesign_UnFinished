//
//  Peterson.swift
//  OperatingSystem
//
//  Created by Y.Jing on 2020/10/15.
//


import SwiftUI
import Foundation

class PetersonArithemetic: ObservableObject{
    
    @Published var model:Arithmetic
    
    static func create(temp:Int)->Arithmetic{
        
        let numberOfCards:Int = 2
        return Arithmetic(numberOfCards: numberOfCards)
    }
    init(temp:Int){
        self.model = PetersonArithemetic.create(temp: temp)
    }
    func changeState(num:Int, tempState:Int){
        model.changeState(num: num, tempState: tempState)
    }
}

struct Peterson: View {
    @ObservedObject var petersonViewModel:PetersonArithemetic
    
    @ObservedObject var pickerModel:PickerModel
    
    @State var mark:Int = 1
    
    var count:Int = 0
    var body: some View{
        VStack{
            ForEach(0..<petersonViewModel.model.cards.count){ id in
                CardView(card: petersonViewModel.model.cards[id])
            }
            .foregroundColor(Color.white)
            .font(Font.largeTitle)
            Text(" ")
            
            HStack{
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut(duration:0.8)){
                        if mark == 1 {
                            for i in 0..<petersonViewModel.model.cards.count{
                                if petersonViewModel.model.cards[i].state == 1{
                                    petersonViewModel.changeState(num: i, tempState: 2)
                                    break
                                }
                                if petersonViewModel.model.cards[i].state == 0{
                                    petersonViewModel.changeState(num: i, tempState: 1)
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
                        
                        for i in 0..<petersonViewModel.model.cards.count{
                            petersonViewModel.model.changeState(num: i, tempState: 0)
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

