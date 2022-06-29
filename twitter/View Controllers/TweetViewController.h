//
//  TweetViewController.h
//  twitter
//
//  Created by Nikita Singh on 6/28/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetViewController : UIViewController

@property(strong, nonatomic)Tweet* tweet;
@property(strong, nonatomic)User* user;
@property (strong, nonatomic) IBOutlet UILabel *authorLabel;
@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UILabel *tweetContentLabel;
@property (strong, nonatomic) IBOutlet UILabel *authorScreennameLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *repliesLabel;
@property (strong, nonatomic) IBOutlet UILabel *retweetsLabel;
@property (strong, nonatomic) IBOutlet UILabel *favoritesLabel;
@property (weak, nonatomic) IBOutlet UIButton *repliesButton;
@property (weak, nonatomic) IBOutlet UIButton *retweetsButton;
@property (weak, nonatomic) IBOutlet UIButton *favoritesButton;
@end

NS_ASSUME_NONNULL_END
