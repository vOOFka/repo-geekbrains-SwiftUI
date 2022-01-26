//
//  LoginVKView.swift
//  vkswiftUI
//
//  Created by Home on 23.01.2022.
//

import SwiftUI
import WebKit

struct LoginVKContainerView: View {
    @ObservedObject var navigationDelegate: WebViewNavigationDelegate = WebViewNavigationDelegate()
   
    var body: some View {
        NavigationView {
            HStack {
                LoginVKView(navigationDelegate: navigationDelegate)
                .fullScreenCover(isPresented: $navigationDelegate.isAuth, onDismiss: nil, content: {
                        MainView()                        
                    })
            }
        }
    }
}

struct LoginVKView: UIViewRepresentable {
    var navigationDelegate: WebViewNavigationDelegate
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = navigationDelegate
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let request = buildAuthRequest() {
            uiView.load(request)
        }
    }
    
    private func buildAuthRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: "7937212"), //7937212 my app ban?  //6704883
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "friends,photos,groups,wall"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        return components.url.map { URLRequest(url: $0) }
    }
}

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate, ObservableObject {
    @Published var isAuth: Bool = false
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment else {
                  decisionHandler(.allow)
                  return
              }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        guard let token = params["access_token"],
              let userIdString = params["user_id"],
              let _ = Int(userIdString)
        else {
            decisionHandler(.allow)
            return
        }
        
        UserDefaults.standard.set(token, forKey: "vkToken")
        UserDefaults.standard.set(userIdString, forKey: "userIdString")
        NotificationCenter.default.post(name: NSNotification.Name("vkTokenSaved"), object: self)
        NotificationCenter.default.post(name: NSNotification.Name("userIdString"), object: self)
        isAuth = true
        
        decisionHandler(.cancel)
    }
}

//struct LoginVKView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginVKView()
//    }
//}
