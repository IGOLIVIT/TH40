//
//  AddColl.swift
//  TH40
//
//  Created by IGOR on 07/09/2025.
//

import SwiftUI

struct AddColl: View {
    
    @StateObject var viewModel: CollectionViewModel
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
                            
                            viewModel.cSpec = viewModel.curSpec
                            viewModel.cClim = viewModel.curClim
                            
                            viewModel.addCol()
                            
                            viewModel.cCName = ""
                            viewModel.cLName = ""
                            viewModel.cLoc = ""
                            viewModel.cTemp = ""
                            viewModel.cHum = ""
                            
                            viewModel.fetchCols()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                        })
                        .opacity(viewModel.cCName.isEmpty ? 0.4 : 1)
                        .disabled(viewModel.cCName.isEmpty ? true : false)
                    }
                    
                }
                    .padding()
                
                
                ScrollView(.vertical, showsIndicators: false) {

                    VStack(alignment: .leading) {
                        
                        Text("Observation details")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .padding(.vertical)
                        
                        Text("Species")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                        Menu(content: {
                            
                            ForEach(viewModel.species, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curSpec = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Text(viewModel.curSpec)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                             
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.bottom)
                        
                        Text("Common Name")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                        ZStack(content: {
                            
                            Text("Enter common name")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.cCName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.cCName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.bottom)
                        
                        Text("Latin Name")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                        ZStack(content: {
                            
                            Text("Enter latin name")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.cLName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.cLName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.bottom)

                        Text("Date and time of observation")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))

                        HStack {
                            
                            DatePicker(selection: $viewModel.cDate, displayedComponents: .date, label: {
                                
                                
                            })
                            
                            DatePicker(selection: $viewModel.cDate, displayedComponents: .hourAndMinute, label: {
                                
                                
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
                                .opacity(viewModel.cLoc.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.cLoc)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        
                        Text("Environmental conditions")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .padding(.vertical)
                        
                        HStack {
                            
                            VStack(alignment: .leading) {
                                
                                Text("Temperature")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                                ZStack(content: {
                                    
                                    Text("0℃")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.cTemp.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.cTemp)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading) {
                                
                                Text("Humidity")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                                ZStack(content: {
                                    
                                    Text("0%")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.cHum.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.cHum)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)

                        }
                        .padding(.bottom)
                        
                        Text("Climate")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                        Menu(content: {
                            
                            ForEach(viewModel.climats, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curClim = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Text(viewModel.curClim)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                             
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
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
    AddColl(viewModel: CollectionViewModel())
}
