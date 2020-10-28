//
//  ViewRow.swift
//  OperateSystem
//
//  Created by Y.Jing on 2020/10/13.
//

import SwiftUI

struct SwiftUIViewRow: View {
    var name: String
    var image: Image
    var temp: String
    
    var body: some View {
        HStack {
            self.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(self.name)
            Spacer()
            Text(self.temp)
        }
    }
    
    init(tname: String, tinamge: Image, ttemp: String) {
        name = tname
        image = tinamge
        temp = ttemp
    }
}

struct ViewRow_Previews: PreviewProvider {
    static var previews: some View {
       // let image:Image = UIImage(named: "chilkoottrail")
        SwiftUIViewRow(tname: "test",tinamge: Image("chilkoottrail"),ttemp: "test")
    }
}
