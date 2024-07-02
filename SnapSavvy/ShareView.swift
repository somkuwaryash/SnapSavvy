//
//  ShareView.swift
//  SnapSavvy
//
//  Created by Yash Somkuwar on 02/07/24.
//

import SwiftUI

struct ShareView: UIViewControllerRepresentable {
    var image: UIImage
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        return activityViewController
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}

//#Preview {
//    ShareView()
//}
