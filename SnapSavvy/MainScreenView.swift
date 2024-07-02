//
//  MainScreenview.swift
//  SnapSavvy
//
//  Created by Yash Somkuwar on 02/07/24.
//

import SwiftUI

struct MainScreenView: View {
    @State private var image: UIImage?
    @State private var showPhotoPicker = false
    @State private var showFilterView = false
    @State private var showShareView = false

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()

                if let image = image {
                    PolaroidFrame(image: Image(uiImage: image))
                } else {
                    Text("Select a photo")
                        .font(.headline)
                        .foregroundColor(.cyan)
                        .padding()
                }

                Spacer()

                HStack {
                    Button(action: {
                        showPhotoPicker = true
                    }) {
                        Text("Photo")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.cyan)
                            .cornerRadius(10)
                    }
                    .padding()

                    if image != nil {
                        Button(action: {
                            showFilterView = true
                        }) {
                            Text("Filter")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.cyan)
                                .cornerRadius(10)
                        }
                        .padding()
                    }

                    if image != nil {
                        Button(action: {
                            showShareView = true
                        }) {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.accentColor)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .sheet(isPresented: $showPhotoPicker) {
            PhotoPickerView(image: $image)
        }
        .sheet(isPresented: $showFilterView) {
            FilterView(image: $image)
        }
        .sheet(isPresented: $showShareView) {
            if let unwrappedImage = image {
                ShareView(image: unwrappedImage)
            }
        }
    }
}

struct PolaroidFrame: View {
    var image: Image

    var body: some View {
        VStack {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .clipped()
                .background(Color.white)
//                .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 10)
            Text("Caption")
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color.white)
                .cornerRadius(10)
        }
        .frame(width: 300, height: 400)
//        .background(Color.white)
        .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 10)
        .padding()
    }
}

//#Preview {
//    MainScreenView()
//}
