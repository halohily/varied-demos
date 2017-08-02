//
//  LYWebView.m
//  pageSource
//
//  Created by 刘毅 on 2017/8/1.
//  Copyright © 2017年 halohily. All rights reserved.
//

#import "LYWebView.h"

@interface LYWebView()
//显示网页来源的label
@property (nonatomic, strong) UILabel *sourceLabel;
//存储URL中host部分
@property (nonatomic, strong) NSString *source;

@end

@implementation LYWebView

//重写webview的loadRequest方法，将网页来源的相关设置写在这里，这样使用时可以默认具有此特性，无需额外设置
- (void)loadRequest:(NSURLRequest *)request
{
    [super loadRequest:request];
    self.source = request.URL.host;
//    显示网页来源的UI更新
    dispatch_async(dispatch_get_main_queue(), ^{
        [self sourceLabel];
    });
}

//显示网页来源label的懒加载get方法
- (UILabel *)sourceLabel
{
    if(!_sourceLabel)
    {
        UILabel *source = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, [[UIScreen mainScreen] bounds].size.width, 15)];
        source.textColor = [UIColor whiteColor];
        source.textAlignment = NSTextAlignmentCenter;
        source.font = [UIFont systemFontOfSize:12.0];
//        将label嵌入到scrollview下面
        [self insertSubview:source belowSubview:self.scrollView];
        source.text = [NSString stringWithFormat:@"此网页由 %@ 提供", self.source];
        return source;
    }
    else
    {
        return _sourceLabel;
    }
}

@end
