//
//  DDToolMacro.h
//  DingMVVM
//
//  Created by duodian on 2017/8/1.
//  Copyright © 2017年 丁远帅. All rights reserved.
//

#ifndef DDToolMacro_h
#define DDToolMacro_h

#define DDCOLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define BASE_COLOR DDCOLOR(243, 243, 246, 1.0)

#define BACK_COLOR DDCOLOR(240,240,240,1)


#define BASE_COLOR1 DDCOLOR(210, 210, 210, 1.0)

#define THEME_COLOR DDCOLOR(250, 98, 97, 1)

#define THEME_COLOR_ALPHA DDCOLOR(250, 98, 97, 0.99)

#define BLACK_COLOR DDCOLOR(50,50,50,1)

#define WORDS_COLOR [UIColor colorWithHex:0x5c5c5c] // 常规文字

#define LINKS_COLOR [UIColor colorWithHex:0x333333] // 链接 (深绿)

#define LINE_COLOR [UIColor colorWithHex:0xe9e9e9]  // 描线色

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

///读取用户数据完成
#define READ_USER_DATA_FINISH @"readUserDataFinish"

///------
/// NSLog
///------

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define WTKLog(fmt, ...) NSLog((@"\n[文件名:%s]\n""[函数名:%s]""[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define NSLog(...) {}
#define WTKLog(...);
#endif

#pragma mark - 宽高

#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kWidth [[UIScreen mainScreen] bounds].size.width
#define ZOOM_SCALL kWidth/375.0

#define IMG_URL @"http://www.jiuyunda.net:90"

///userDefaults

#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]

#define CURRENT_USER [WTKUser currentUser]

#define SHOPPING_MANAGER [WTKShoppingManager manager]

///SVP
#define SHOW_SVP(title) \
[SVProgressHUD showWithStatus:title];

#define SHOW_ERROE(title) \
[SVProgressHUD showErrorWithStatus:title];

#define SHOW_SUCCESS(title) \
[SVProgressHUD showSuccessWithStatus:title];

#define DISMISS_SVP(time) \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ \
[SVProgressHUD dismiss]; \
});



#endif /* DDToolMacro_h */
