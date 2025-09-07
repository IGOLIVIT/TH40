//
//  FieldDetail.swift
//  TH40
//
//  Created by IGOR on 07/09/2025.
//

import SwiftUI

struct FieldDetail: View {

    @StateObject var viewModel: FieldworkViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New entry")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 21, weight: .semibold))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = true
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(Color("re"))
                                .font(.system(size: 18, weight: .medium))
                        })
               
                    }
                    
                }
                    .padding()
                
                
                ScrollView(.vertical, showsIndicators: false) {

                    VStack(alignment: .leading) {

                        Text("Task title")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
  
                        Text(viewModel.selectedField?.fTit ?? "")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                                .padding(.bottom)
                        
                        Text("Date and time of execution")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))

                        HStack {
                            
                            Text((viewModel.selectedField?.fDate ?? Date()).convertDate(format: "MMM dd, YYYY"))
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text((viewModel.selectedField?.fTime ?? Date()).convertDate(format: "hh:mm a"))
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                        .padding(.bottom)
                        
                        Text("Location")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text(viewModel.selectedField?.fLoc ?? "")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                                .padding(.bottom)
                        
                        Text("Task description")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text(viewModel.selectedField?.fDescr ?? "")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                                .padding(.bottom)
                        
                        Text("Status")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))

                        Text(viewModel.selectedField?.fStatus ?? "")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                                .padding(.bottom)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(maxHeight: .infinity)
                .padding()
                .background(Color("bg"))
            }
            
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack(spacing: 15) {

                    Text("Delete?")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("This action cannot be undone.")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Rectangle()
                        .fill(.black.opacity(0.2))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteField(withFTit: viewModel.selectedField?.fTit ?? "", completion: {
                                
                                viewModel.fetchFields()
                            })
                  
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                                viewModel.isDetail = false
                            }
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    FieldDetail(viewModel: FieldworkViewModel())
}
