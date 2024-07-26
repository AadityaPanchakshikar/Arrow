//
//  completeSignUpView.swift
//  Arrow
//
//  Created by Ferocious_Lad on 12/05/23.
//

import SwiftUI

struct completeSignUpView: View {
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
        VStack(spacing:12){
            
            Spacer()
            
            Text("Welcome to Arrow. \(viewModel.username)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
    
            Text("Click Below to Complete registration & Start using Arrow")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            
            Button{
                Task { try await viewModel.createUser()  }
            }label: {
                Text("Complete")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame (width: 330, height: 44)
                    .background (Color(.systemBlue))
                    .cornerRadius (10)
                    .shadow(radius: 7)
            }
            .padding(.vertical)
            
            HStack{
                Image(systemName: "info.circle")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .bold()
                    .padding(.leading)
                    .padding(.bottom)
                
                Text("Make sure to add Health related Information in App Settings for better tracking")
                    .font(.footnote)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .padding(.trailing)
                    .padding()
                
            }
            
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

struct completeSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        completeSignUpView()
    }
}
