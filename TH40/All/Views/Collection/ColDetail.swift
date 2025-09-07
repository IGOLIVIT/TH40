//
//  ColDetail.swift
//  TH40
//
//  Created by IGOR on 07/09/2025.
//

import SwiftUI

struct ColDetail: View {

    @StateObject var viewModel: CollectionViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Entry")
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
                        
                        Text("Observation details")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .padding(.vertical)
                        
                        Text("Species")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text(viewModel.selectedCol?.cSpec ?? "")
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .regular))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                        .padding(.bottom)
                        
                        Text("Common Name")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text(viewModel.selectedCol?.cCName ?? "")
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .regular))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                        .padding(.bottom)
                        
                        Text("Latin Name")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text(viewModel.selectedCol?.cLName ?? "")
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .regular))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                        .padding(.bottom)

                        Text("Date and time of observation")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                        HStack {
                            
                            Text((viewModel.selectedCol?.cDate ?? Date()).convertDate(format: "MMM dd, YYYY"))
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text((viewModel.selectedCol?.cTime ?? Date()).convertDate(format: "hh:mm a"))
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
                        
                        Text(viewModel.selectedCol?.cLoc ?? "")
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .regular))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                        
                        Text("Environmental conditions")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .padding(.vertical)
                        
                        HStack {
                            
                            VStack(alignment: .leading) {
                                
                                Text("Temperature")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                                Text(viewModel.selectedCol?.cTemp ?? "")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading) {
                                
                                Text("Humidity")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                                Text(viewModel.selectedCol?.cHum ?? "")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)

                        }
                        .padding(.bottom)
                        
                        Text("Climate")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
          
                        Text(viewModel.selectedCol?.cClim ?? "")
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
                            
                            CoreDataStack.shared.deleteCol(withCCName: viewModel.selectedCol?.cCName ?? "", completion: {
                                
                                viewModel.fetchCols()
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
    ColDetail(viewModel: CollectionViewModel())
}
