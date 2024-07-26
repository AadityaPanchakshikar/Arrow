//
//  LoginView.swift
//  Arrow
//
//  Created by Ferocious_Lad on 12/05/23.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Spacer()
                
                // logo
                Text("Arrow") // add custom logo later
                    .font(.largeTitle)
                    .bold()
                    .italic()
                    .padding(.top)
                    .padding()
                
                
            // input filds
                VStack{
                    TextField("Email", text:$viewModel.email)
                        .autocapitalization(.none)
                        .modifier(TextFieldModifier())
                    
                    SecureField("Password", text:$viewModel.password)
                        .modifier(TextFieldModifier())
                }
                Button{
                    print("Clicked forgot Password")
                }label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                    
                }.frame(maxWidth: .infinity, alignment: .trailing)
                
                Button{
                    Task { try await viewModel.signIn()}
                }label:{
                    Text("Log In")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame (width: 330, height: 44)
                        .background (Color(.systemBlue))
                        .cornerRadius (10)
                        .shadow(radius: 7)
                        
                }
                .padding()
                
                HStack{
                    Rectangle()
                        .frame (width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                        
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        
                    
                    Rectangle()
                        .frame (width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                        
                }
                .foregroundColor(.gray)
                .padding()
                
                Spacer()
                
                NavigationLink{
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                }label: {
                    HStack(spacing:3){
                        Text("Don't have an Account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.subheadline)
                }
                .padding(.vertical,16)
            }
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
