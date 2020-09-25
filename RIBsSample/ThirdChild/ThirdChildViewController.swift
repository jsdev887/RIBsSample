//
//  ThirdChildViewController.swift
//  RIBsSample
//
//  Created by Jiwoo on 2020/09/24.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol ThirdChildPresentableListener: class {
}

final class ThirdChildViewController: UIViewController, ThirdChildPresentable, ThirdChildViewControllable {

    internal static func instantiate() -> ThirdChildViewController {
        return Storyboard.Main.instantiate(ThirdChildViewController.self)
    }
    
    weak var listener: ThirdChildPresentableListener?
    
    @IBOutlet weak var messageBoxLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Passing Data - 6. Third Child View Controller")
        
        bindLabel()
    }
    
    private var message: Message?
    
    func setMessage(newMessage: Message) {
        self.message = newMessage
        print("Passing Data - 4. Message arrived: \(newMessage)")
    }
    
    private func bindLabel() {
        print("Passing Data - 7. Label text set with new message")
        let labelText = "This child got\n" + (message?.currentMessage ?? "nothing") 
        messageBoxLabel.text = labelText
    }
}
