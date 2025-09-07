//
//  FieldworkView.swift
//  TH40
//
//  Created by IGOR on 07/09/2025.
//

import SwiftUI

struct FieldworkView: View {

    @StateObject var viewModel = FieldworkViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Fieldwork")
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
                        
                        if viewModel.fields.isEmpty {
                            
                            VStack {
                            
                            Image("empty")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120)
                            
                            Text("Fieldwork is empty")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 18, weight: .medium))
                            }
                            .frame(maxHeight: .infinity)
                            
                        } else {
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                
                                LazyVStack {
                                    
                                    ForEach(viewModel.fields, id: \.self) { index in
                                    
                                        Button(action: {
                                            
                                            viewModel.selectedField = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDetail = true
                                            }
                                            
                                        }, label: {
                                            
                                            VStack {
                                                
                                                HStack {
                                                    
                                                    Text(index.fTit ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 20, weight: .semibold))
                                                    
                                                    Spacer()
                                                    
                                                    if viewModel.fStatus == "Completed" {
                                                        
                                                        Text(index.fStatus ?? "")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 15, weight: .regular))
                                                            .padding(7)
                                                            .padding(.horizontal, 7)
                                                            .background(Color("gr"))
                                                            .cornerRadius(20)
                                                        
                                                    } else if viewModel.fStatus == "In Progress" {
                                                    
                                                        Text(index.fStatus ?? "")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 15, weight: .regular))
                                                            .padding(7)
                                                            .padding(.horizontal, 7)
                                                            .background(.white.opacity(0.2))
                                                            .cornerRadius(20)
                                                        
                                                    } else {
                                                        
                                                        Text(index.fStatus ?? "")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 15, weight: .regular))
                                                            .padding(7)
                                                            .padding(.horizontal, 7)
                                                            .background(Color("re"))
                                                            .cornerRadius(20)
                                                    }
                                                }
                                                
                                                HStack {
                                                    
                                                    Text("Date and Time:")
                                                        .foregroundColor(.white.opacity(0.2))
                                                        .font(.system(size: 18, weight: .semibold))
                                                                                                 
                                                    Text((index.fDate ?? Date()).convertDate(format: "MMM dd, YYYY"))
                                                        .foregroundColor(.white.opacity(0.6))
                                                        .font(.system(size: 18, weight: .regular))
                                                    
                                                    Text((index.fTime ?? Date()).convertDate(format: "hh:mm a"))
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
            
            viewModel.fetchFields()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddField(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            FieldDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    FieldworkView()
}
