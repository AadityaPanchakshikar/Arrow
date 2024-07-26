//
//  UploadPostView.swift
//  Arrow
//
//  Created by Ferocious_Lad on 12/05/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption:String = ""
    @State private var isImagePickerPresented:Bool = false
    @State var viewModel = UploadPostViewModel()
    @Binding var tabIndex:Int
    var body: some View {
        
    VStack{
        ScrollView{
            // action toolbar
            HStack{
                
                    Button{
                        ClearPostDataReturnFeed()
                    }label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .font(.title2)
                            .bold()
                    }
                    
                    Spacer()
                    
                    Text("New Post")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button{
                        Task {
                            try await viewModel.uploadPost(caption:caption)
                            ClearPostDataReturnFeed()
                        }
                    }label: {
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .font(.title2)
                            .bold()
                    }
                }.padding(.horizontal)
                
                // post image & caption
                
                if let Image = viewModel.postImage{
                    
                    Image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 360, height: 360)
                        .clipped()
                        .padding()
                }
                
                TextField("Now Enter a Caption...",text: $caption, axis: .vertical)
                    .padding()
                
                
                Spacer()
            }
            .onAppear{
                isImagePickerPresented.toggle()
            }
            .padding()
            .photosPicker(isPresented: $isImagePickerPresented, selection: $viewModel.selectedImage)
            
        }
        
    }
    
    func ClearPostDataReturnFeed() {
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView( tabIndex: .constant(0))
    }
}
