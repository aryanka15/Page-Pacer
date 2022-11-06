//
//  TimerView.swift
//  Page Pacer
//
//  Created by Aryan Karani on 11/5/22.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 15.0)
            Text("00:00:00")
                .font(.largeTitle)
                .padding()
        }
        .frame(minWidth: 0, idealWidth: 200, maxWidth: 350, minHeight: 0, idealHeight: 200, maxHeight: 350, alignment: .center)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
