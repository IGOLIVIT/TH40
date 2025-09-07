//
//  ContentView.swift
//  TH40
//
//  Created by IGOR on 07/09/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Collection

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {

                        CollectionView()
                            .tag(Tab.Collection)
                        
                        FieldworkView()
                            .tag(Tab.Fieldwork)

                        EncyclopediaView()
                            .tag(Tab.Encyclopedia)

                    })
                    
                    TabBar(selectedTab: $current_tab)
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
                
            } else {
                
                ob1()
            }
        }
    }
}

#Preview {
    ContentView()
}
