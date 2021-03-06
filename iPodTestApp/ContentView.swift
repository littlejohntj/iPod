//
//  ContentView.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/2/21.
//

import SwiftUI
import MusicKit
import MediaPlayer

struct ContentView: View {
    
    @StateObject var state: AppState

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                iPodCase {
                    iPodHID()
                }
                .transformEffect( CGAffineTransform(scaleX: 0.8, y: 0.8) )
                .transformEffect( CGAffineTransform(translationX: 120, y: 80) )
                Spacer()
            }
        }
        .environmentObject(state)
        .onAppear {
            async {
                await MusicAuthorization.request()
            }
        }
    }
}

struct iPodHID: View {
    
    @EnvironmentObject var appState: AppState
    var controlBarViewModel = ControlBarViewModel {
        
    }
    
    var body: some View {
        VStack {
            Screen(width: 340) {
                MenuList()
            }
            .frame(width: 340, height: 290, alignment: .center)
            ControlBar(viewModel: controlBarViewModel, buttonSize: 90)
                .frame(width: 420, height: 90, alignment: .center)
                .padding()
            Wheel {
                print("suppppp")
                appState.selfNavigate()
            }
            .frame(width: 340, height: 340, alignment: .top)
                
        }
        .frame(width: 420, height: 760, alignment: .center)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(state: AppState())
                .previewDevice("iPhone 12 Pro")
        }
    }
}
