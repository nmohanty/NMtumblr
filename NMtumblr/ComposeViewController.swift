//
//  ComposeViewController.swift
//  NMtumblr
//
//  Created by Namrata Mohanty on 11/4/16.
//  Copyright © 2016 MOS360. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
   /* var textOriginal: CGPoint!
    var photoOriginal: CGPoint!
    var quoteOriginal: CGPoint!
    var linkOriginal: CGPoint!
    var chatOriginal: CGPoint!
    var videoOriginal: CGPoint!*/

    @IBOutlet weak var textIcon: UIImageView!
    @IBOutlet weak var photoIcon: UIImageView!
    @IBOutlet weak var quoteIcon: UIImageView!
    @IBOutlet weak var linkIcon: UIImageView!
    @IBOutlet weak var chatIcon: UIImageView!
    @IBOutlet weak var videoIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var fadeTransition: FadeTransition!
       // self.textIcon.transform = CGAffineTransform.identity
       // self.linkIcon.transform = CGAffineTransform.identity
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
       
        //icons animate to screen at different speed and delay
        UIView.animate(withDuration: 0.6, delay: 0.9, options: [], animations: {
            self.linkIcon.transform = CGAffineTransform.init(translationX: 0, y: -415)
            self.videoIcon.transform = CGAffineTransform.init(translationX: 0, y: -415)
            
        }, completion: nil )
        
        UIView.animate(withDuration: 0.5, delay: 0.6, options: [], animations: {
             self.textIcon.transform = self.textIcon.transform.translatedBy(x: 0, y: -515)
             self.quoteIcon.transform = self.quoteIcon.transform.translatedBy(x: 0, y: -515)
        }, completion: nil )

        
        
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [], animations: {
            self.photoIcon.transform = CGAffineTransform.init(translationX: 0, y: -515)
            self.chatIcon.transform = CGAffineTransform.init(translationX: 0, y: -415)
        }, completion: nil )

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
         //icons stay below screen
        textIcon.frame.origin = CGPoint(x: 40, y: 700)
        photoIcon.frame.origin = CGPoint(x: 150, y: 700)
        quoteIcon.frame.origin = CGPoint(x: 265, y: 700)
        linkIcon.frame.origin = CGPoint(x: 40, y: 730)
        chatIcon.frame.origin = CGPoint(x: 150, y: 730)
        videoIcon.frame.origin = CGPoint(x: 265, y: 730)
        
            }
    
    @IBAction func onTapButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [], animations: {
            self.quoteIcon.transform = self.quoteIcon.transform.translatedBy(x: 0, y: -250)
            self.videoIcon.transform = CGAffineTransform.init(translationX: 0, y: -400)
            
        }, completion: nil )
        
        UIView.animate(withDuration: 0.5, delay: 0.9, options: [], animations: {
            self.textIcon.transform = self.textIcon.transform.translatedBy(x: 0, y: -250)
            self.linkIcon.transform = CGAffineTransform.init(translationX: 0, y: -400)
                }, completion: nil )
        
        
        UIView.animate(withDuration: 0.5, delay: 0.6, options: [], animations: {
            self.photoIcon.transform = CGAffineTransform.init(translationX: 0, y: -250)
            self.chatIcon.transform = CGAffineTransform.init(translationX: 0, y: -400)
        }, completion: nil )
        
dismiss(animated: true, completion: nil)
        
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
