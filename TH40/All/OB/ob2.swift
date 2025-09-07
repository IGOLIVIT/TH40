//
//  ob2.swift
//  TH40
//
//  Created by IGOR on 07/09/2025.
//

import SwiftUI

struct ob2: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("Img2")
                        .resizable()
                 
                    VStack {
                        
                        Spacer()
                        
                        VStack {
                            
                            Text("Plan and track your field research tasks effectively 🌍")
                                .foregroundColor(.white)
                                .font(.system(size: 32, weight: .bold))
                                .padding()
                            
                            Spacer()
                            
                            NavigationLink(destination: {
                                
                                ob3()
                                    .navigationBarBackButtonHidden()
                                
                            }, label: {
                                
                                Text("Next")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(Color("pr"))
                                    .cornerRadius(28)
                            })
                            .padding(.bottom, 23)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 300)
                        .background(Color("bg2"))
                        .cornerRadius(20)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ob2()
}
