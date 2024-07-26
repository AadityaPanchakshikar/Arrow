//
//  CreateUserNameView.swift
//  Arrow
//
//  Created by Ferocious_Lad on 12/05/23.
//

import SwiftUI

struct CreateUserNameView: View {
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
        VStack(spacing:12){
            
            Text("Choose a username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("to make this account truly yours.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField("Username", text:$viewModel.username)
                .autocapitalization(.none)
                .modifier(TextFieldModifier())
            
            NavigationLink{
                CreatePasswordView()
                    .navigationBarBackButtonHidden()
            }label: {
                Text("Next")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame (width: 330, height: 44)
                    .background (Color(.systemBlue))
                    .cornerRadius (10)
                    .shadow(radius: 7)
            }
            .padding(.vertical)
            
            Spacer()
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct CreateUserNameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserNameView()
    }
}
