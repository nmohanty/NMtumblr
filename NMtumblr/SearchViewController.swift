//
//  SearchViewController.swift
//  NMtumblr
//
//  Created by Namrata Mohanty on 11/4/16.
//  Copyright © 2016 MOS360. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchImageView: UIImageView!

    @IBOutlet weak var ImageView: UIImageView!
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    
    
    var images: [UIImage]!
    var animatedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
       let loading_1 = UIImage(named: "loading-1")
        
        
        let loading_2 = UIImage(named: "loading-2")
        
        let loading_3 = UIImage(named: "loading-3")
        
        let images = [loading_1, loading_2, loading_3]
        
       
        
        animatedImage = UIImage.animatedImage(with: images as! [UIImage], duration: 1.0)
        
            //UIImage.animatedImage(with: images!, duration: 1.0)
        
      ImageView.image = animatedImage
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //hide the background image feed and show the custom loading indicator
        searchImageView.alpha = 0
        ImageView.alpha = 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //add a delay method. In the completion block of the delay, hide the custom loading indicator and show the background image feed
        // Delay for 2 seconds, then run the code between the braces.
        let secondsToDelay = 2.0
        run(after: secondsToDelay) {
            // This code will run after the delay
            self.ImageView.alpha = 0
            self.searchImageView.alpha = 1
            
        }
    }
    
    func run(after wait: TimeInterval, closure: @escaping () -> Void) {
        let queue = DispatchQueue.main
        queue.asyncAfter(deadline: DispatchTime.now() + wait, execute: closure)
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
