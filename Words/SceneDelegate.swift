//
//  SceneDelegate.swift
//  Words
//
//  Created by Дмитрий Тимофеев on 04.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
       
        let navigation = UINavigationController(rootViewController: ViewController())
//        navigation.navigationBar.barStyle = .black
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }

}

