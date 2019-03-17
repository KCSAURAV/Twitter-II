//
//  TweetVC.swift
//  Twitter
//
//  Created by SAURAV on 3/16/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetVC: UIViewController {

 
  @IBOutlet weak var tweetTV: UITextView!
  @IBAction func cancel(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  @IBAction func tweet(_ sender: Any) {
    if(!tweetTV.text.isEmpty){
      TwitterAPICaller.client?.postTweet(tweet: tweetTV.text, success:{ self.dismiss(animated: true, completion: nil)}, failure:{
       (error) in print("Error posting \(error)")
       self.dismiss(animated: true, completion: nil)
      }
      )
      
    }
    else{
      self.dismiss(animated: true, completion: nil)
    }
  }
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      tweetTV.becomeFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
