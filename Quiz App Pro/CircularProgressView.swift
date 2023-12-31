//
//  CircularProgressView.swift
//  Quiz App Pro
//
//  Created by Minaga Ekanayake on 02/08/2023.
//

import SwiftUI

struct CircularProgressView: View {
    var progress: CGFloat
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(.red)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: .init(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.red)
                .rotationEffect(Angle(degrees: 270))

        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.25)
    }
}
