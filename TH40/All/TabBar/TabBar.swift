//
//  TabBar.swift
//  TH40
//
//  Created by IGOR on 07/09/2025.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 6, content: {

                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("pr") : Color.gray.opacity(0.5))
                            .frame(width: 15, height: 15)

                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("pr") : Color.gray.opacity(0.5))
                            .font(.system(size: 11, weight: .regular))

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 24)
        .padding(.bottom, 38)
        .background(RoundedRectangle(cornerRadius: 0).fill(Color("bg2")))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Collection = "Collection"
    
    case Fieldwork = "Fieldwork"
    
    case Encyclopedia = "Encyclopedia"
    
}
