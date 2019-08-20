//
//  AppDelegate.m
//  PmwayBeta
//
//  Created by 孙旭 on 2019/8/19.
//  Copyright © 2019 Sunwanqing. All rights reserved.
//

#import "AppDelegate.h"
#import "MSLaunchView.h"
#import "PWLoginOSystemViewController.h"
#import "ConstantFile.h"
#import "UIImage+GIF.h"
#import "UIImageView+WebCache.h"

@interface AppDelegate ()
{
    MSLaunchView *_launchView;
    UILabel *myTest1;
    CABasicAnimation *animation;
    UIImageView *logoimageV;
}
@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //加载动画
//    [self TMSLaunchView];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    PWLoginOSystemViewController *vc = [[PWLoginOSystemViewController alloc]init];
    UINavigationController * Na = [[UINavigationController alloc]initWithRootViewController:vc];
    
    self.window.rootViewController = Na;
    [self.window makeKeyAndVisible];
    
    CGRect frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width ,[UIScreen mainScreen].bounds.size.height );
//    frame.size = [UIImage imageNamed:@"login.gif"].size;
    //    frame.size.width = [UIImage imageNamed:@"启动页640.gif"].size.width / 2;
    //    frame.size.height = [UIImage imageNamed:@"启动页640.gif"].size.height / 2;
    // 读取gif图片数据
    NSData *gif = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"login" ofType:@"gif"]];
    // view生成
//    UIWebView *webView = [[UIWebView alloc] initWithFrame:frame];
//    webView.userInteractionEnabled = NO;//用户不可交互
//    [webView loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    
    UIImageView *webView = [[UIImageView alloc] initWithFrame:frame];
    webView.userInteractionEnabled = NO;//用户不可交互
    [webView sd_setImageWithURL:[NSURL URLWithString:@"http://s4.sinaimg.cn/bmiddle/6723f54bgbf531d393833&690"] placeholderImage:[UIImage imageNamed:@"login.gif"]];
//    webView.image = [UIImage imageWithData:gif];
//    [webView loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    
    
    [self.window addSubview:webView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [webView removeFromSuperview];
    });
    //    [self.view addSubview:webView];
    
//    [self customLaunchImageView];
    return YES;
}
- (void)customLaunchImageView
{
    UIImageView *launchImageView = [[UIImageView alloc] initWithFrame:self.window.bounds];
//    launchImageView.image = [self getLaunchImage];;
    launchImageView.image = [UIImage imageNamed:@"登录面_IOS"];
    
    [self.window addSubview:launchImageView];
    [self.window bringSubviewToFront:launchImageView];
    
    myTest1 = [[UILabel alloc]initWithFrame:CGRectMake(5,kHeight-250, 50, 50)];
    myTest1.backgroundColor = [UIColor whiteColor];
    myTest1.textAlignment = NSTextAlignmentCenter;
    myTest1.text = @"程昆仑";
    myTest1.layer.masksToBounds = YES;
    myTest1.layer.cornerRadius = 25;
    myTest1.textColor = [UIColor whiteColor];
    [launchImageView addSubview:myTest1];
    
    logoimageV = [[UIImageView alloc]initWithFrame:CGRectMake((kWidth-300)/2, (kHeight-150)/2, 300, 150)];
    logoimageV.image = [UIImage imageNamed:@"setuphigt"];
    logoimageV.alpha  = 0;
    [launchImageView addSubview:logoimageV];
    
    //路径动画。
    CGMutablePathRef myPah = CGPathCreateMutable();
    //CGPathGetCurrentPoint(myPah);
    // CGPathMoveToPoint(myPah, nil,kWidth/2, kHeight/2);
    CGPathMoveToPoint(myPah, nil,30, kHeight-250);//最后的点的位置
    CGPathAddLineToPoint(myPah, nil, kWidth/6, kHeight-100);
    CGPathAddLineToPoint(myPah, nil, kWidth/3, kHeight-200);
    CGPathAddLineToPoint(myPah, nil, kWidth/2, kHeight-100);
    CGPathAddLineToPoint(myPah, nil, kWidth/2, kHeight/2);
    // CGPathRelease(myPah);
    //CGPathCloseSubpath(myPah);
    
   [myTest1.layer addAnimation:[self keyframeAnimation:myPah durTimes:1.0f Rep:MAXFLOAT] forKey:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        myTest1.alpha = 0;
        [UIView animateWithDuration:0.3 animations:^{
            logoimageV.alpha = 1;
            
        } completion:^(BOOL finished) {
            
        }];
        
        [UIView animateWithDuration:0.8 animations:^{
            launchImageView.alpha = 0.0;
            logoimageV.alpha = 1;
            launchImageView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        } completion:^(BOOL finished) {
            [launchImageView removeFromSuperview];
        }];
    });
}

- (UIImage *)getLaunchImage
{
    UIImage *lauchImage = nil;
    NSString *viewOrientation = nil;
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight) {
        
        viewOrientation = @"Landscape";
        
    } else {
        
        viewOrientation = @"Portrait";
    }
    
    NSArray *imagesDictionary = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
//    NSLog([NSString alloc]initWithFormat:@"%ld",imagesDictionary.length);
    for (NSDictionary *dict in imagesDictionary) {
        
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            
            lauchImage = [UIImage imageNamed:dict[@"UILaunchImageName"]];
        }
    }
    return lauchImage;
}


-(void)addlat {
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.0];
    opacityAnimation.duration = 1.5f;
    opacityAnimation.autoreverses= NO;
    // opacityAnimation.delegate = self;
    opacityAnimation.repeatCount = 1;
    //    opacityAnimation.speed = 1.0f;
    
    CABasicAnimation * animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation2.fromValue = [NSNumber numberWithDouble:0.9];
    animation2.toValue = [NSNumber numberWithDouble:5];
    animation2.duration= 0.5;
    animation2.autoreverses= NO;
    animation2.repeatCount= 1;  //"forever"
    //    animation2.removedOnCompletion= YES;
    [myTest1.layer addAnimation:animation2 forKey:@"scale"];
    [myTest1.layer addAnimation:animation2 forKey:@"scale"];
    [myTest1.layer addAnimation:opacityAnimation forKey:nil];
    [myTest1.layer addAnimation:opacityAnimation forKey:nil];
    
}

#pragma mark =====路径动画-=============
-(CAKeyframeAnimation *)keyframeAnimation:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    ///animation.autoreverses = NO;//是否原路返回
    animation.duration = time;
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = 1;
    //CGPathCloseSubpath(path);
    // CGPathRelease(path);
    //CGPathCloseSubpath(path);
    return animation;
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    NSLog(@"动画结束了");
    // myTest1.alpha = 0;
    // myTest2.alpha = 1;
    [self addlat];
    
    
    
}
-(void)TMSLaunchView{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.view.backgroundColor = [UIColor redColor];
    PWLoginOSystemViewController *vc = [[PWLoginOSystemViewController alloc]init];
    self.window.rootViewController = vc;
//    self.window.rootViewController = vc;
    
    NSLog(@"33333");
    if ([MSLaunchView isFirstLaunch]) {//或者使用[MSLaunchView isFirstLaunch]判断是否是第一次进入
        NSLog(@"4444444");
        NSArray *imageNameArray = @[@"Untitled-4.gif",@"Untitled-6.gif",@"Untitled-7.gif"];
        CGRect rt = CGRectMake(MSScreenW*0.3, MSScreenH*0.8, MSScreenW*0.4, MSScreenH*0.08);
        
#pragma mark ---->>带立即体验按钮，项目是SB创建的 (此方法初始化，则guideBtnCustom：方法失效)
        //        MSLaunchView *launchView = [MSLaunchView launchWithImages:imageNameArray sbName:@"" guideFrame:rt gImage:[UIImage imageNamed:@""] isScrollOut:YES];
#pragma mark ---->>不带立即体验按钮 项目是SB创建的
        //        MSLaunchView *launchView = [MSLaunchView launchWithImages:imageNameArray sbName:@"" isScrollOut:NO];
#pragma mark ---->>不带立即按钮 代码创建项目
        //        MSLaunchView *launchView = [MSLaunchView launchWithImages:imageNameArray isScrollOut:YES];
#pragma mark ---->>带立即按钮 代码创建项目
        MSLaunchView *launchView = [MSLaunchView launchWithImages:imageNameArray guideFrame:rt gImage:[UIImage imageNamed:@""] isScrollOut:NO];
        
        
#pragma mark ---->>关于Video 没有立即进入按钮
        //        NSString *path  = [[NSBundle mainBundle]  pathForResource:@"测试" ofType:@"mp4"];
        //        NSURL *url = [NSURL fileURLWithPath:path];
        //        MSLaunchView *launchView = [MSLaunchView launchWithVideo:CGRectMake(0, 0, MSScreenW, MSScreenH) videoURL:url];
        //        launchView.videoGravity = AVLayerVideoGravityResize;
        //        launchView.isPalyEndOut = YES;//
        
        launchView.guideTitle = @"进入当前界面";
        launchView.guideTitleColor = [UIColor blackColor];
        launchView.guideTitleFont = [UIFont systemFontOfSize:17];
        
#pragma mark ---->>跳过按钮自定义属性
        launchView.skipTitle = @"跳过";
        launchView.skipTitleColor = [UIColor whiteColor];
        launchView.skipTitleFont = [UIFont systemFontOfSize:15];
        launchView.skipBackgroundColor = [UIColor redColor];
        launchView.skipBackgroundImage = [UIImage imageNamed:@""];
        
        
#pragma mark ---->>PageControl自定义属性
        
        //        launchView.showPageControl = NO;
        //pageControl的间距大小
        //        launchView.pageControlStyle = MSPageControlStyleNumber;
        
        //        launchView.pageControlBottomOffset += 25;
        launchView.pageDotColor = [UIColor redColor];
        launchView.currentPageDotColor = [UIColor yellowColor];
        launchView.textFont = [UIFont systemFontOfSize:9 weight:UIFontWeightBold];
        launchView.textColor = [UIColor blackColor];
        launchView.dotsIsSquare = NO;
        launchView.spacingBetweenDots = 15;
        
        launchView.dotBorderWidth = 2;
        launchView.dotBorderColor = [UIColor blueColor];
        launchView.currentDotBorderWidth = 2;
        launchView.currentDotBorderColor = [UIColor redColor];
        launchView.delegate = self;
        //设置了pageDotImage和currentPageDotImage图片 pageControlDotSize和currentWidthMultiple将失效
        launchView.pageControlDotSize = CGSizeMake(20, 20);
        launchView.currentWidthMultiple =  3;
        
        launchView.lastDotsIsHidden = YES;//最后一个页面时是否隐藏PageControl 默认为NO
        launchView.pageDotImage = [UIImage imageNamed:@"Ktv_ic_share_qq"];
        launchView.currentPageDotImage = [UIImage imageNamed:@"Ktv_ic_share_weixin"];
        launchView.loadFinishBlock = ^(MSLaunchView * _Nonnull launchView) {
            NSLog(@"广告加载完成了");
            PWLoginOSystemViewController *vc = [[PWLoginOSystemViewController alloc]init];
            self.window.rootViewController = vc;
        };
        
#pragma mark ---->>自定义立即体验按钮
        [launchView guideBtnCustom:^UIButton * _Nonnull{
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(60, 60, 130, 60);
            [btn setBackgroundColor:[UIColor redColor]];
            [btn setTitle:@"立即体验" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(hidde) forControlEvents:UIControlEventTouchUpInside];
            return btn;
        }];
        
#pragma mark ---->>自定义跳过按钮
        
        //        [launchView skipBtnCustom:^UIButton * _Nonnull{
        //            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //            btn.frame = CGRectMake(60, 200, 120, 120);
        //            [btn setBackgroundColor:[UIColor blueColor]];
        //            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //            [btn setTitle:@"跳过按钮" forState:UIControlStateNormal];
        //            [btn addTarget:self action:@selector(hidde) forControlEvents:UIControlEventTouchUpInside];
        //            return btn;
        //        }];
        
        _launchView = launchView;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
