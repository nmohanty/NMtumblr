//
//  TabBarViewController.swift
//  NMtumblr
//
//  Created by Namrata Mohanty on 11/3/16.
//  Copyright © 2016 MOS360. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var exploreImageView: UIImageView!
    
    @IBOutlet weak var contentView: UIView!
    
    var HomeViewController: UIViewController!
    var SearchViewController: UIViewController!
    var AccountViewController: UIViewController!
    var TrendingViewController: UIViewController!
    var destinationViewController: UIViewController!
    
    var selectedIndex: Int = 0
    var viewControllers: [UIViewController]!
    
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        HomeViewController = storyboard.instantiateViewController(withIdentifier: "homeViewController")
        SearchViewController = storyboard.instantiateViewController(withIdentifier: "searchViewController")
        AccountViewController = storyboard.instantiateViewController(withIdentifier: "accountViewController")
        TrendingViewController = storyboard.instantiateViewController(withIdentifier: "trendingViewController")
        //ComposeViewController = storyboard.instantiateViewController(withIdentifier: "composeViewController")
        
        viewControllers = [HomeViewController, SearchViewController, AccountViewController, TrendingViewController]
        
        buttons[selectedIndex].isSelected = true
        didPressButton(buttons[selectedIndex])
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didPressButton(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        
        buttons[previousIndex].isSelected = false
        
        if selectedIndex == 1 {
            exploreImageView.alpha = 0
        }
        
        else {
            exploreImageView.alpha = 1
            UIView.animate(withDuration:0.8, delay: 0.0,
                           // Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
                options: [.autoreverse,.repeat], animations: { () -> Void in
                    self.exploreImageView.transform = CGAffineTransform(translationX: 0, y: 10)
            }, completion: nil)
        }
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParentViewController: nil)
        
            previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.isSelected = true
        
        let vc = viewControllers[selectedIndex]
        
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
        
    }
    
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        destinationViewController = segue.destination
    // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.custom
       
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 1.0

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
