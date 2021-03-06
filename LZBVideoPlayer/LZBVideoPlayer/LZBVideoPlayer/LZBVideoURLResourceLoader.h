//
//  LZBVideoURLResourceLoader.h
//  LZBVideoPlayer
//
//  Created by zibin on 2016/7/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "LZBVideoDownLoadManger.h"

/**
  这个类的功能是把缓存到本地的临时数据根据播放器需要的 offset 和 length 去取出数据, 并返回给播放器
 */

@protocol LZBVideoURLResourceLoaderDelegate <NSObject>


/**
 下载完成，传出视频保存的路径
 */
- (void)didFinishSucessLoadedWithManger:(LZBVideoDownLoadManger *)manger saveVideoPath:(NSString *)videoPath;


/**
  下载失败，传出错误原因
 */
- (void)didFailLoadedWithManger:(LZBVideoDownLoadManger *)manger withError:(NSError *)error;

@end

@interface LZBVideoURLResourceLoader : NSObject <AVAssetResourceLoaderDelegate>


/**
   监听代理, 就能获得下载状态
 */
@property (nonatomic, weak) id <LZBVideoURLResourceLoaderDelegate> delegate;

/**
  修改传入的URL，输出系统不能识别的URL，使系统执行我们自定义的请求方法

 @param inputURL soure URL
 @return fix URL
 */
- (NSURL *)getVideoResourceLoaderSchemeWithURL:(NSURL *)inputURL;


/**
 取消资源下载并清除缓存
 */
- (void)invalidDownloader;
@end
