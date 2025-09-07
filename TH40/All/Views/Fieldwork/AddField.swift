//
//  AddField.swift
//  TH40
//
//  Created by IGOR on 07/09/2025.
//

import SwiftUI

struct AddField: View {

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
                            
                            viewModel.fStatus = viewModel.curStatus
                            
                            viewModel.addField()
                            
                            viewModel.curStatus = ""
                            
                            viewModel.fTit = ""
                            viewModel.fLoc = ""
                            viewModel.fDescr = ""
                            
                            viewModel.fetchFields()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                        })
                        .opacity(viewModel.fTit.isEmpty || viewModel.curStatus.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.fTit.isEmpty || viewModel.curStatus.isEmpty ? true : false)
                    }
                    
                }
                    .padding()
                
                
                ScrollView(.vertical, showsIndicators: false) {

                    VStack(alignment: .leading) {

                        Text("Task title")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
  
                        ZStack(content: {
                            
                            Text("Enter task title")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.fTit.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.fTit)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.bottom)
                        
                        Text("Date and time of execution")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))

                        HStack {
                            
                            DatePicker(selection: $viewModel.fDate, displayedComponents: .date, label: {
                                
                            })
                            
                            DatePicker(selection: $viewModel.fTime, displayedComponents: .hourAndMinute, label: {
                                
                            })
                            
                            Spacer()
                            
                        }
                        .padding(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.bottom)
                        
                        Text("Location")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                        ZStack(content: {
                            
                            Text("Enter location")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.fLoc.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.fLoc)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.bottom)
                        
                        Text("Task description")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                        ZStack(content: {
                            
                            Text("Enter task description")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.fDescr.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.fDescr)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.bottom)
                        
                        Text("Status")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))

                        HStack {
                            
                            ForEach(viewModel.statuses, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curStatus = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(.white.opacity(viewModel.curStatus == index ? 1 : 0.3))
                                        .font(.system(size: 14, weight: .medium))
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color("bg2"))
                                        .cornerRadius(120)
                                })
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(maxHeight: .infinity)
                .padding()
                .background(Color("bg"))
            }
            
        }
    }
}

#Preview {
    AddField(viewModel: FieldworkViewModel())
}
