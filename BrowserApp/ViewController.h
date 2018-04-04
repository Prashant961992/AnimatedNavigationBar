//
//  ViewController.h
//  BrowserApp
//
//  Created by Prashant Prajapati on 04/04/18.
//  Copyright © 2018 Prashant Prajapati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>{
    __weak IBOutlet UIWebView *webView;
}
@property (nonatomic,assign) CGFloat lastContentOffset;
@property IBOutlet UINavigationBar *navigationBar;
@property IBOutlet NSLayoutConstraint *navigationBarTop;

@end

