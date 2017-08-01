//
//  LYWebView.m
//  pageSource
//
//  Created by 刘毅 on 2017/8/1.
//  Copyright © 2017年 halohily. All rights reserved.
//

#import "LYWebView.h"

@interface LYWebView()

@property (nonatomic, strong) UILabel *sourceLabel;
@property (nonatomic, strong) NSString *source;
@end

@implementation LYWebView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//- (instancetype)init
//{
//    self = [super init];
//    if (self)
//    {
//        [self sourceLabel];
//    }
//    return self;
//}

- (void)loadRequest:(NSURLRequest *)request
{
    [super loadRequest:request];
    self.source = request.URL.host;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self sourceLabel];
    });
}

- (UILabel *)sourceLabel
{
    if(!_sourceLabel)
    {
        UILabel *source = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, [[UIScreen mainScreen] bounds].size.width, 15)];
        source.textColor = [UIColor whiteColor];
        source.textAlignment = NSTextAlignmentCenter;
        source.font = [UIFont systemFontOfSize:12.0];
        [self insertSubview:source belowSubview:self.scrollView];
        source.text = [NSString stringWithFormat:@"此网页由 %@ 提供", self.source];
        return source;
    }
    else
    {
        return _sourceLabel;
    }
}

//- (void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self sourceLabel];
//    });
//}
@end
