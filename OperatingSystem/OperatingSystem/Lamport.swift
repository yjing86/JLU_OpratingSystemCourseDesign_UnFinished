//
//  Lamport.swift
//  OperatingSystem
//
//  Created by Y.Jing on 2020/10/15.
//
import SwiftUI
import Foundation

class LamportArithemetic: ObservableObject{
    
    @Published var model:Arithmetic
    //@ObservedObject var pickerModel:PickerModel
    var animaArray:Array<anima> = Array<anima>()

    static func create(temp:Int)->Arithmetic{
        let numberOfCards:Int = temp
        return Arithmetic(numberOfCards: numberOfCards)
    }
    init(temp:Int){
        self.model = LamportArithemetic.create(temp: temp)
    }
    func changeState(num:Int, tempState:Int){
        model.changeState(num: num, tempState: tempState)
    }
    func calculate(mark:Int){
        if mark < 2 {
        animaArray = model.cal(mark: mark)
        }
    }
    
    func move(mark:Int,tempNum:Int)->(tmark:Int,ttempNum:Int){
        
        model.changeState(num: animaArray[tempNum].num, tempState: animaArray[tempNum].state)
        let ttempNum = tempNum+1
        var tmark = 2
        if animaArray.count == ttempNum{
            tmark = 3
        }
        
        return (tmark,ttempNum)
    }
}

struct Lamport: View {
    @ObservedObject var lamportViewModel:LamportArithemetic
    
    @ObservedObject var pickerModel:PickerModel
    
    @State var mark:Int = 0
    
    @State var count:Int = 0
    
    var body: some View{
        ForEach(0..<lamportViewModel.model.cards.count){ id in
            CardView(card: lamportViewModel.model.cards[id])    //初始值false，不初始化会报错
            
        }
        .foregroundColor(Color.white)    //属性可以被覆盖
        .font(Font.largeTitle)
        Text(" ")
        
        HStack{
            Spacer()
            Button(action: {
                withAnimation(.easeInOut(duration:0.8)){
                    lamportViewModel.calculate(mark: mark)
                    if (mark != 3 ){
                        let resulet = lamportViewModel.move(mark: mark, tempNum: count)
                        mark = resulet.tmark
                        count = resulet.ttempNum
                        
                    }
                }
            }, label: {Text("开始")
                .foregroundColor(Color.blue)
                .font(Font.largeTitle)
            })
            
            Spacer()
            Button(action: {
                withAnimation(.easeInOut(duration:0.8)){
                    for i in 0..<lamportViewModel.model.cards.count{
                        lamportViewModel.model.changeState(num: i, tempState: 0)
                    }
                    mark = 1
                    count = 0
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


