//
//  SwiftUIView.swift
//  OperatingSystem
//
//  Created by Y.Jing on 2020/10/15.
//

import SwiftUI
import Foundation
import UIKit

//struct dataModel{
//    var selectedItem:Int
//    init(temp:Int) {
//        self.selectedItem = temp
//    }
//    mutating func changeData (temp: Int){
//        self.selectedItem = temp
//    }
//    mutating func getData() ->Int{
//        return self.selectedItem
//    }
//}
//
//class viewModel: ObservableObject {
//
//    @Published var sData:dataModel  = creat()
//
//    static func creat()->dataModel{
//        return dataModel(temp: 0)
//    }
//    func changeData (temp: Int){
//        sData.changeData(temp: temp)
//    }
//    func getData() ->Int{
//        return sData.getData()
//    }
//
//    func show()->Int{
//        let temp = sData.selectedItem
//        return temp + 2
//    }
//}
//

class PickerModel:ObservableObject{
    @Published var picked: Int = 0 {
        didSet{
            print("here")
        }
    }
}

struct SwiftUIView: View{

    @ObservedObject var pickerModel:PickerModel
    
    let process:[Int] = [2,3,4,5,6,7,8,9,10]

    var body: some View {
        
        VStack{
            Spacer()
            Text("请选择进程数")
            HStack{
                Spacer()
                Picker(selection: self.$pickerModel.picked, label: Text("")){
                    ForEach(0 ..< process.count) {
                        Text(self.process[$0].description).tag($0)
                    }
                }
                Spacer()
            }
            Text("当前进程数: ") + Text("\(process[self.pickerModel.picked])")
            Spacer()
            
        }
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        var pickerModel:PickerModel = PickerModel()
        SwiftUIView(pickerModel: pickerModel)
    }
}
