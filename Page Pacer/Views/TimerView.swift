//
//  TimerView.swift
//  Page Pacer
//
//  Created by Aryan Karani on 11/5/22.
//

import SwiftUI

struct TimerView: View {
    
    let timerTime: Int // Time in seconds
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timerVal = 0 // Time left in seconds
    @State private var circleProgress = 1.0
    @State private var isTimerRunning = false
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .rotation(Angle(degrees: 270))
                    .trim(from: 0.0, to: circleProgress)
                    .stroke(lineWidth: 15.0)
                    .animation(.linear(duration: 1), value: circleProgress)
                Text(secondsToHMS(timerVal))
                    .font(.largeTitle)
                    .padding()
                    .onReceive(timer) { _ in
                        if (timerVal > 0) {
                            self.timerVal -= 1;
                        }
                        else {
                            self.timerVal = 0;
                        }
                        circleProgress=Double(self.timerVal-1)/Double(self.timerTime)
                    }
            }
            .frame(minWidth: 0, idealWidth: 200, maxWidth: 300, minHeight: 0, idealHeight: 200, maxHeight: 300, alignment: .center)
            .onAppear {
                self.stopTimer()
                self.timerVal = self.timerTime;
            }
            .onTapGesture {
                if isTimerRunning {
                    self.stopTimer()
                }
                else if timerVal == 0 {
                    self.resetTimer()
                }
                else {
                    self.startTimer()
                }
            }
            
            Button {
                self.resetTimer()
            } label: {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("Restart")
                }
            }
            .padding()
            .foregroundColor(.red)
        }
    }
    
    func secondsToHMS(_ seconds: Int) -> String {
        let hours: Int = Int(seconds/3600)
        let minutes: Int = Int((seconds%3600)/60)
        let seconds: Int = Int(seconds%3600%60)
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func stopTimer() {
        self.timer.upstream.connect().cancel()
        isTimerRunning = false
    }
        
    func startTimer() {
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        isTimerRunning = true
    }
    
    func resetTimer() {
        self.stopTimer()
        self.timerVal = self.timerTime
        self.circleProgress = 1.0
    }
    
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timerTime: 10)
    }
}
