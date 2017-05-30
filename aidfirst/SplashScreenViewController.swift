//
//  SplashScreenViewController.swift
//  AidFirst
//
//  Created by Arminas on 29/05/2017.
//  Copyright © 2017 Arminas. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var aidFirstLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.logoImageView.center.x = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            UIView.animate(withDuration: 1.0){
                self.logoImageView.center.y = 0.0 - self.logoImageView.bounds.height/2
                self.logoImageView.alpha = 0.0
                self.logoImageView.bounds.size.height = self.logoImageView.bounds.size.height/2
                self.logoImageView.bounds.size.width = self.logoImageView.bounds.size.width/2
            }
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
                self.aidFirstLabel.alpha = 0.0
                self.copyrightLabel.alpha = 0.0
            },
                           completion: { finished in self.performSegue(withIdentifier: "toTabBarController", sender: self)}
            )
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func logoSlide(to: CGFloat, duration: Double){
        UIView.animate(withDuration: duration){
            self.logoImageView.center.x += to
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
