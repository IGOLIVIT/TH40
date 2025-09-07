//
//  ob3.swift
//  TH40
//
//  Created by IGOR on 07/09/2025.
//

import SwiftUI

struct ob3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("Img3")
                        .resizable()
                 
                    VStack {
                        
                        Spacer()
                        
                        VStack {
                            
                            Text("Explore a detailed and informative species database anytime 📚")
                                .foregroundColor(.white)
                                .font(.system(size: 32, weight: .bold))
                                .padding()
                            
                            Spacer()
                            
                            Button(action: {
                                
                                status = true
                                
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
    ob3()
}
