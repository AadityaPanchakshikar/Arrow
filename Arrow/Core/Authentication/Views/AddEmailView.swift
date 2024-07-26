//
//  AddEmail.swift
//  Arrow
//
//  Created by Ferocious_Lad on 12/05/23.
//

import SwiftUI


struct AddEmailView: View{
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View{
        VStack(spacing:12){
            Text("Add your Email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll Use this Email to sign into your Account.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField("Email", text:$viewModel.email)
                .autocapitalization(.none)
                .modifier(TextFieldModifier())
            
            
            NavigationLink{
                CreateUserNameView()
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


struct AddEmailView_Previews: PreviewProvider{
    static var previews: some View {
        AddEmailView()
    }
}
