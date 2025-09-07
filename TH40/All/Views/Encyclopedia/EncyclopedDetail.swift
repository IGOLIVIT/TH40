//
//  EncyclopedDetail.swift
//  TH40
//
//  Created by IGOR on 07/09/2025.
//

import SwiftUI

struct EncyclopedDetail: View {
    
    @StateObject var viewModel: EncyclopediaViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Encyclopedia")
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

                    }
                    
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading) {
                        
                        HStack {
                            
                            VStack(alignment: .leading) {
                                
                                Text("Common name")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))

                                Text(viewModel.selectedGuide?.cname ?? "")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                                        .padding(.bottom)
                                
                                Text("Latin name")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))

                                Text(viewModel.selectedGuide?.lname ?? "")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                                        .padding(.bottom)
                            }
                            
                            Spacer()
                            
                            Image(viewModel.selectedGuide?.image ?? "")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                        }
                        
                        Text("Description")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))

                        Text(viewModel.selectedGuide?.des ?? "")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                                .padding(.bottom)
                        
                        Text("Habitat")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))

                        Text(viewModel.selectedGuide?.hab ?? "")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                                .padding(.bottom)
                        
                        Text("Feeding and reproduction habits")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))

                        Text(viewModel.selectedGuide?.hab ?? "")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("bg2")))
                                .padding(.bottom)
                        
                        Text("Conservation status")
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))

                        Text(viewModel.selectedGuide?.stat ?? "")
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
    }
}

#Preview {
    EncyclopedDetail(viewModel: EncyclopediaViewModel())
}
