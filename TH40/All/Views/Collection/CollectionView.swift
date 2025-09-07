//
//  CollectionView.swift
//  TH40
//
//  Created by IGOR on 07/09/2025.
//

import SwiftUI

struct CollectionView: View {
    
    @StateObject var viewModel = CollectionViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Collection")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                                    
                    VStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("+ New entry")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                    .padding(8)
                                    .padding(.horizontal, 8)
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(20)
                            }
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if viewModel.collrctions.isEmpty {
                            
                            VStack {
                                
                                Image("empty")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120)
                                
                                Text("Collection is empty")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 18, weight: .medium))
                                
                            }
                            .frame(maxHeight: .infinity)
                            
                        } else {
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                
                                LazyVStack {
                                    
                                    ForEach(viewModel.collrctions, id: \.self) { index in
                                    
                                        Button(action: {
                                            
                                            viewModel.selectedCol = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDetail = true
                                            }
                                            
                                        }, label: {
                                            
                                            VStack {
                                                
                                                HStack {
                                                    
                                                    Text(index.cCName ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 20, weight: .semibold))
                                                    
                                                    Spacer()
                                                 
                                                    Text(index.cSpec ?? "")
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 15, weight: .regular))
                                                        .padding(7)
                                                        .padding(.horizontal, 7)
                                                        .background(Color("pr"))
                                                        .cornerRadius(20)
                                                }
                                                
                                                HStack {
                                                    
                                                    Text("Latin:")
                                                        .foregroundColor(.white.opacity(0.2))
                                                        .font(.system(size: 18, weight: .semibold))
                                                                                                 
                                                    Text(index.cLName ?? "")
                                                        .foregroundColor(.white.opacity(0.6))
                                                        .font(.system(size: 18, weight: .regular))
                                                    
                                                    Spacer()

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
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                    .padding()
                    .background(Color("bg"))

            }
        }
        .onAppear {
            
            viewModel.fetchCols()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddColl(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            ColDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    CollectionView()
}
