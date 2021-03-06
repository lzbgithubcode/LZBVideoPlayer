//
//  ViewController.m
//  LZBVideoPlayer
//
//  Created by zibin on 2016/6/28.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "LZBVideoPlayerView.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *showView;

@property (nonatomic, strong) LZBVideoPlayerView *playerView;

@property (nonatomic, strong) NSMutableArray <NSURL *>*playAddresses;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.playerView];
    self.playerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
    [self.playerView playWithURL:self.playAddresses.firstObject isSupportCache:NO];
    self.playerView.playAddresses = self.playAddresses;
}



- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.playerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
}

- (UIView *)showView
{
  if(_showView == nil)
  {
      _showView = [UIView new];
      _showView.backgroundColor = [UIColor greenColor];
  }
    return _showView;
}


- (LZBVideoPlayerView *)playerView
{
  if(_playerView == nil)
  {
      _playerView = [[LZBVideoPlayerView alloc]init];
  }
    return _playerView;
}


- (NSMutableArray *)playAddresses
{
   if(_playAddresses == nil)
   {
       _playAddresses = [NSMutableArray array];
       for (NSInteger i = 1; i< 10; i++) {
           [_playAddresses addObject:[NSURL URLWithString:[NSString stringWithFormat:@"http://120.25.226.186:32812/resources/videos/minion_0%ld.mp4",(long)i]]];
       }
       
   }
    return _playAddresses;
}
@end
