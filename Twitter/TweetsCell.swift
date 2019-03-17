//
//  TweetsCell.swift
//  Twitter
//
//  Created by SAURAV on 3/10/19.
//  Copyright © 2019 Dan. All rights reserved.

import UIKit

class TweetsCell: UITableViewCell {
  
  var favorited:Bool = false
  var tweetID:Int = -1
  @IBOutlet weak var profileImg: UIImageView!
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var tweet: UILabel!
  @IBOutlet weak var favB: UIButton!
  @IBOutlet weak var retweetB: UIButton!
  @IBAction func retweet(_ sender: Any) {
    TwitterAPICaller.client?.retweet(tweetID: tweetID, success: {self.setRetweeted(true)}, failure: { (error) in print("Unsuccessful retweet: \(error)" )})
  }
  @IBAction func favortweet(_ sender: Any) {
    let isfavorited = !favorited
    if(isfavorited){
      TwitterAPICaller.client?.favoriteTweet(tweetID: tweetID, success: {self.setFav(true)}, failure:{ (error) in print("Unsuccessful: \(error)" )})
    }
    else{
      TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetID, success: {self.setFav(false)}, failure:{ (error) in print("Unsuccessful: \(error)" )})
    }
  }
  
  func setFav(_ isFav:Bool){
    favorited = isFav
    if(favorited){
      favB.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
    }
    else{
      favB.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
    }
  }
  func setRetweeted(_ isRetweeted:Bool){
    if(isRetweeted){
      retweetB.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
      retweetB.isEnabled = false
    }else{
      retweetB.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
        retweetB.isEnabled = true
    }
  }
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
