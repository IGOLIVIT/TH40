//
//  EncyclopediaView.swift
//  TH40
//
//  Created by IGOR on 07/09/2025.
//

import SwiftUI

struct EncyclopediaView: View {
    
    @StateObject var viewModel = EncyclopediaViewModel()

    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Encyclopedia")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                                    
                    VStack {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.guides, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedGuide = index
                                        
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDetail = true
                                        }
                                        
                                    }, label: {
                                        
                                        VStack {
                                            
                                            HStack {
                                                
                                                VStack(alignment: .leading) {
                                                    
                                                    Text(index.cname)
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 20, weight: .semibold))
                                                    
                                                    Text("Latin: \(index.lname)")
                                                        .foregroundColor(.white.opacity(0.4))
                                                        .font(.system(size: 16, weight: .medium))
                                                    
                                                }
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                                                            
                                                Image(systemName: "chevron.right")
                                                    .foregroundColor(.white.opacity(0.3))
                                            }
                                            
                                        }
                                        .padding()
                                        .background(Color("bg2"))
                                        .cornerRadius(15)
                                    })
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                    .padding()
                    .background(Color("bg"))

            }
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            EncyclopedDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    EncyclopediaView()
}
