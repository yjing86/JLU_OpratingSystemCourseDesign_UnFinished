//
//  Cardview.swift
//  OperatingSystem
//
//  Created by Y.Jing on 2020/10/22.
//

import SwiftUI


struct CardView: View{
    
    var card: Arithmetic.Card
    
    var body: some View{
        ZStack{
            if card.state == 0{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
                    .frame(width: 380)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                    .frame(width: 380)
                Text(card.content)
                
            }else if card.state == 1{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.green)
                    .frame(width: 380)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                    .frame(width: 380)
                Text(card.content)
                
            }else if card.state == 2{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.blue)
                    .frame(width: 380)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                    .frame(width: 380)
                Text(card.content)
            }
        }
    }
}

