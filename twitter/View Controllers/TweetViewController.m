//
//  TweetViewController.m
//  twitter
//
//  Created by Nikita Singh on 6/28/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetViewController.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"


@interface TweetViewController ()

@end

@implementation TweetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTweetObject:self.tweet];
    // Do any additional setup after loading the view.
}

-(void)setTweetObject:(Tweet *)tweet {
    self.authorLabel.text = self.tweet.user.name;
    self.authorScreennameLabel.text = [NSString stringWithFormat:@"@%@",self.tweet.user.screenName];
    self.dateLabel.text = self.tweet.createdAtString;
    self.tweetContentLabel.text = self.tweet.text;
    NSString *URLString = self.tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    //NSData *urlData = [NSData dataWithContentsOfURL:url];
    [self.profileImageView setImageWithURL:url];
    self.retweetsLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    self.repliesLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount]; //have to change to get num replies
    self.favoritesLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
}

- (IBAction)didTapFavorite:(id)sender {
    if (self.tweet.favorited == NO) {
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        [self.favoritesButton setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
            [self setTweetObject:self.tweet];
        }];
    }
    else {
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        [self.favoritesButton setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
            [self setTweetObject:self.tweet];
        }];
    }
}

- (IBAction)didTapRetweet:(id)sender {
    if (self.tweet.retweeted == NO) {
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        [self.retweetsButton setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            }
            [self setTweetObject:self.tweet];
        }];
    }
    else {
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        [self.retweetsButton setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error unretweetng tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.text);
            }
            [self setTweetObject:self.tweet];
        }];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
