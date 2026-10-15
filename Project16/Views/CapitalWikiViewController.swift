//
//  CapitalWikiViewController.swift
//  Project16
//
//  Created by Karla E. Martins Fernandes on 15/10/26.
//

import UIKit
import WebKit

final class CapitalWikiViewController: UIViewController, WKNavigationDelegate {

    private let webView = WKWebView()
    private let url: URL

    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureWebView()
        loadWikipediaPage()
    }

    private func configureView() {
        view.backgroundColor = .systemBackground
    }

    private func configureWebView() {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.navigationDelegate = self

        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func loadWikipediaPage() {
        webView.load(URLRequest(url: url))
    }
    
    
    func webView(_ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let targetURL = navigationAction.request.url,
              targetURL == url else {
            decisionHandler(.cancel)
            return
        }

        decisionHandler(.allow)
    }
}
