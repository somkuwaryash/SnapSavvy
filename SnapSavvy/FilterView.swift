//
//  FilterView.swift
//  SnapSavvy
//
//  Created by Yash Somkuwar on 02/07/24.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct FilterView: View {
    
    @Binding var image: UIImage?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var ciContext: CIContext = CIContext()
    
    var body: some View {
        
        VStack {
            
            if let image = image, let ciImage = CIImage(image: image) {
                
                Image(uiImage: applyFilter(to: ciImage))
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 400)
                
            } else {
                
                Text("No Image Selected")
                font(.headline)
                
            }
            
            HStack {
                
                Button(action: {
                    
                    currentFilter = CIFilter.sepiaTone()
                    
                }, label: {
                    
                    Text("Sepia")
                    
                })
                .padding()
                
                Button(action: {
                    
                    currentFilter = CIFilter.photoEffectNoir()
                    
                }, label: {
                    
                    Text("Noir")
                    
                })
                .padding()
                
                Button(action: {
                    
                    currentFilter = CIFilter.colorInvert()
                    
                }, label: {
                    
                    Text("Invert")
                    
                })
                .padding()
                
            }
            
            
            
        }
        
        
        
    }
    
    func applyFilter(to ciImage: CIImage) -> UIImage {
        
        currentFilter.setValue(ciImage, forKeyPath: kCIInputImageKey)
        
        if let outputImage = currentFilter.outputImage,
           let cgImage = ciContext.createCGImage(outputImage, from: outputImage.extent) {
            
            return UIImage(cgImage: cgImage)
            
        }
        
        return UIImage(ciImage: ciImage)
        
    }
}

//#Preview {
//    FilterView()
//}
