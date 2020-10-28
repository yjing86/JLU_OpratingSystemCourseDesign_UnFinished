//
//  Dekker.swift
//  OperatingSystem
//
//  Created by Y.Jing on 2020/10/15.
//

import SwiftUI
import Foundation

class DekkerArithemetic: ObservableObject{
        
    @Published var model:Arithmetic
    
    //@ObservedObject var pickerModel:PickerModel

    static func create(temp:Int)->Arithmetic{
        
        let numberOfCards:Int = 2
        return Arithmetic(numberOfCards: numberOfCards)
    }
    init(temp:Int){
        self.model = DekkerArithemetic.create(temp: temp)
    }
    func changeState(num:Int, tempState:Int){
        model.changeState(num: num, tempState: tempState)
    }
    
}

struct Dekker: View {
    @ObservedObject var dekkerViewModel:DekkerArithemetic 
    
    @ObservedObject var pickerModel:PickerModel

    @State var mark:Int = 0

    var count:Int = 0
    var body: some View{    //view必须有body
        //ZStack填充ForEach，ForEach组成HStack
//        Text("Peterson")
//                       .foregroundColor(Color.black)    //属性可以被覆盖
//                       .font(Font.largeTitle)
//
        VStack{        //HStack水平排列，不加HStack的话会显示出四个页面来
//            Text("Peterson")
//                .foregroundColor(Color.black)    //属性可以被覆盖
//                .font(Font.largeTitle)
//
            ForEach(0..<dekkerViewModel.model.cards.count){ id in
                CardView(card: dekkerViewModel.model.cards[id])    //初始值false，不初始化会报错
            }
            .foregroundColor(Color.white)    //属性可以被覆盖
            .font(Font.largeTitle)
            Text(" ")

            HStack{
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut(duration:0.8)){ //使用default duration
//
                        if mark == 0 {
                            if dekkerViewModel.model.cards[1].state == 0{
                                dekkerViewModel.changeState(num: 1, tempState: 1)
                                
                            }
                            else {                            dekkerViewModel.changeState(num: 1, tempState: 2)
                                mark = 1
                            }
                        }else if mark == 1 {
                            for i in 0..<dekkerViewModel.model.cards.count{
                                if dekkerViewModel.model.cards[i].state == 1{
                                    dekkerViewModel.changeState(num: i, tempState: 2)
                                    break
                                }
                                if dekkerViewModel.model.cards[i].state == 0{
                                    dekkerViewModel.changeState(num: i, tempState: 1)
                                    break
                                }
                                if (i == dekkerViewModel.model.cards.count-1 ) &&  (dekkerViewModel.model.cards[i].state == 2){
                                    mark = 3

                                }
                            }
                        }
                        
//                        if dekkerViewModel.count>0{
//                            dekkerViewModel.changeState(num: dekkerViewModel.count-1, tempState: 1)
//                            dekkerViewModel.count = dekkerViewModel.count-1
//                        }
                        
                    }
                }, label: {Text("开始")
                    .foregroundColor(Color.blue)
                    .font(Font.largeTitle)
                    
                    
                })
                
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut(duration:0.8)){
                        
                        for i in 0..<dekkerViewModel.model.cards.count{
                            dekkerViewModel.model.changeState(num: i, tempState: 0)
                        }
                        mark = 1
                        
                        
                        
                        //使用default duration
//
//                        dekkerViewModel.changeState(num: dekkerViewModel.count-1, tempState: 1)
//                        dekkerViewModel.count = dekkerViewModel.count-1
//
//                        dekkerViewModel.changeState(num: dekkerViewModel.count-1, tempState: 1)

//                        if dekkerViewModel.count>0{
//                            dekkerViewModel.changeState(num: dekkerViewModel.count-1, tempState: 1)
//                            dekkerViewModel.count = dekkerViewModel.count-1
//
//                        }
                        
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

