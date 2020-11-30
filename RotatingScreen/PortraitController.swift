//
//  RotatingScreenController.swift
//  RotatingScreen
//
//  Created by 永田大祐 on 2020/11/30.
//

import UIKit

class PortraitController: UIViewController {

    @IBOutlet var bt: UIView!

    override var shouldAutorotate: Bool {
        if UIDevice.current.orientation.isPortrait {
            UIDevice.current.setValue(0, forKey: "orientation")
        }
        return D.orientationFlg
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.orientation.isLandscape {
            UIDevice.current.setValue(0, forKey: "orientation")
        }
        return D.duration
    }
    

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        if D.orientationFlg == false {
            UIDevice.current.setValue(1, forKey: "orientation")
        } else {
            UIDevice.current.setValue(3, forKey: "orientation")
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        view.backgroundColor = .black
        D.orientationFlg = false
    }

    @IBAction func btAction(_ sender: UIButton) {
        D.duration = .all
        D.orientationFlg = true
        UIDevice.current.setValue(3, forKey: "orientation")
        bindSet {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main2", bundle: nil)
            if let vc = storyboard.instantiateInitialViewController() {
                self.present(vc, animated: true, completion: nil)
            }
        }
    }

    func bindSet(call: @escaping () -> Void) {
        call()
    }
}
