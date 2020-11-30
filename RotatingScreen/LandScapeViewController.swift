//
//  LandScapeViewController.swift
//  RotatingScreen
//
//  Created by 永田大祐 on 2020/11/30.
//

import UIKit

class LandScapeViewController: UIViewController {

    @IBOutlet var bt: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        D.orientationFlg = false
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        if D.duration == .portrait {
            D.orientationFlg = false
        } else {
            D.orientationFlg = true
        }
    }

    override var shouldAutorotate: Bool {
        return D.orientationFlg
    }

    @IBAction func btAction(_ sender: UIButton) {
        D.duration =  .portrait
        D.orientationFlg = true
        UIDevice.current.setValue(1, forKey: "orientation")
        bindSet { [self] in
            dismiss(animated: true, completion: nil)
        }
    }

    func bindSet(call: @escaping () -> Void) {
        call()
    }
}
