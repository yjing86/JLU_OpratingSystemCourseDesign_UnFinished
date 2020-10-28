//
//  ViewList.swift
//  OperateSystem
//
//  Created by Y.Jing on 2020/10/13.
//

import SwiftUI

struct SwiftUIViewList: View {
    
    @ObservedObject var pickerModel:PickerModel = PickerModel()
    
    @State var isModal = false
    var texta:String = "当前共有"
    var textb:String = "个进程"

    var body: some View {
        
        let text1: String = "Dekker"
        let text2: String = "Peterson"
        let text3: String = "Lamport"
        let text4: String = "Eisenburg"
        let image1: Image = Image("a")
        let image2: Image = Image("b")
        let image3: Image = Image("c")
        let image4: Image = Image("d")
        
        VStack{
            
            NavigationView{
                List(){
                    NavigationLink(destination: Dekker(dekkerViewModel: DekkerArithemetic(temp: pickerModel.picked+2), pickerModel: pickerModel)) {
                        SwiftUIViewRow(tname: text1,tinamge: image1, ttemp: "")
                    }
                    
                    NavigationLink(destination: Peterson(petersonViewModel: PetersonArithemetic(temp: pickerModel.picked+2), pickerModel: pickerModel)) {
                        SwiftUIViewRow(tname: text2,tinamge: image2, ttemp: "")
                    }
                    
                    NavigationLink(destination: Lamport(lamportViewModel: LamportArithemetic(temp: pickerModel.picked+2), pickerModel: pickerModel)) {
                        SwiftUIViewRow(tname: text3,tinamge: image3, ttemp: "")
                    }
                    NavigationLink(destination: Eisenburg(eisenburgViewModel: EisenburgArithemetic(temp: pickerModel.picked+2), pickerModel: pickerModel))  {
                        SwiftUIViewRow(tname: text4,tinamge: image4, ttemp: "")
                    }
                    
                    SwiftUIViewRow(tname: "",tinamge: Image("white"), ttemp: "")
                    
                    Button(action: {print(self.isModal)
                            self.isModal = true}, label: {
                                SwiftUIViewRow(tname:texta + "    \(pickerModel.picked+2)    " + textb ,tinamge: Image("fff"), ttemp: "")
                            })
                        .sheet(isPresented: $isModal, onDismiss: {
                            print("Detail View Dismissed")
                        }) {
                            SwiftUIView(pickerModel: pickerModel)
                        }
        
//                    Group{
//                        SwiftUIViewRow(tname: "小组成员",tinamge: Image("timg-2"), ttemp: "")
//                        SwiftUIViewRow(tname: "荆煜",tinamge: Image("timg"), ttemp: "学号:55180123")
//                        SwiftUIViewRow(tname: "刘昂霖",tinamge: Image("timg"), ttemp: "学号:55180125")
//                        SwiftUIViewRow(tname: "赵阳",tinamge: Image("timg"), ttemp: "学号:55180119")
//
//                        SwiftUIViewRow(tname: "余沛文",tinamge: Image("timg"), ttemp: "学号:25180424")
//
//                    }
                    
                }
                .navigationBarTitle(Text("Operating System"))
            }
            Text("Copyright © 2020 荆煜。 保留所有权利。")
        }

    }
}
