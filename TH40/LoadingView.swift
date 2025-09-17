//
//  LoadingView.swift
//  TH40
//
//  Created by IGOR on 15/09/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 130)
                 
                    VStack {
                        
                        Spacer()
                        
                        ProgressView()
                            .padding(.bottom)
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}
