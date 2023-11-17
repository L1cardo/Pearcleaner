//
//  TopBarMini.swift
//  Pearcleaner
//
//  Created by Alin Lupascu on 11/14/23.
//

import Foundation
import SwiftUI

struct TopBarMini: View {
    @Binding var reload: Bool
    @AppStorage("displayMode") var displayMode: DisplayMode = .system
    @AppStorage("settings.sentinel.enable") private var sentinel: Bool = false
    @AppStorage("settings.general.mini") private var mini: Bool = false
    @Binding var search: String
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            
            Spacer()
            
            if appState.currentView == .apps {
//                HStack {
//                    Spacer()
                    
                SearchBarMini(search: $search, reload: $reload)
//                    .frame(width: 150)
                    .offset(x: 20)
                    .padding(.horizontal, 30)
//                        .padding(.top, 5)
                    
                Spacer()
                    
//                    Button("") {
//                        withAnimation(.easeInOut(duration: 0.5)) {
//                            // Refresh Apps list
//                            reload.toggle()
//                            let sortedApps = getSortedApps()
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                                appState.sortedApps.userApps = sortedApps.userApps
//                                appState.sortedApps.systemApps = sortedApps.systemApps
//                                reload.toggle()
//                            }
//                            
//                        }
//                    }
//                    .buttonStyle(SimpleButtonStyle(icon: "arrow.triangle.2.circlepath", help: "Refresh app list", color: Color("mode")))
//                    .padding(.leading, 5)
//                }
            }
            
            if appState.currentView == .apps {
                Button("") {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        appState.currentView = .empty
                        appState.appInfo = AppInfo.empty
                    }
                }
                .buttonStyle(SimpleButtonStyle(icon: "arrow.down.app", help: "Drop", color: Color("mode")))
            } else if appState.currentView == .empty {
                Button("") {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        appState.currentView = .apps
                    }
                }
                .buttonStyle(SimpleButtonStyle(icon: "list.triangle", help: "Apps", color: Color("mode")))
            } else if appState.currentView == .files {
                Button("") {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        appState.currentView = .empty
                        appState.appInfo = AppInfo.empty
                    }
                }
                .buttonStyle(SimpleButtonStyle(icon: "arrow.down.app", help: "Drop", color: Color("mode")))
                Button("") {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        appState.currentView = .apps
                    }
                }
                .buttonStyle(SimpleButtonStyle(icon: "list.triangle", help: "Apps", color: Color("mode")))
            }
            
            
        }
        .padding(.horizontal, 10)
        .padding(.top, 10)
        .padding(.bottom, 15)
    }
}


struct SearchBarMini: View {
    @Binding var search: String
    @Binding var reload: Bool
    
    var body: some View {
        HStack {
            TextField("Search", text: $search)
                .textFieldStyle(SimpleSearchStyle(trash: true, reload: $reload, text: $search))
        }
        .frame(height: 20)
    }
}
