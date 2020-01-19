//
//  DetailView.swift
//  H4X0R N3W2
//
//  Created by Pushpinder Pal Singh on 19/01/20.
//  Copyright © 2020 Pushpinder Pal Singh. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
struct WebView:UIViewRepresentable{
    
    let urlString : String?
    
    func makeUIView(context: Context) -> WebView.UIViewType{
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context:Context) {
        if let safeStringn = urlString {
            if let url = URL(string: safeStringn){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}
