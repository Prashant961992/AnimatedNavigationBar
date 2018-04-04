//
//  ViewController.m
//  BrowserApp
//
//  Created by Prashant Prajapati on 04/04/18.
//  Copyright © 2018 Prashant Prajapati. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(100, 2, [[UIScreen mainScreen] bounds].size.width-100,40)];
//    [searchBar sizeToFit];

//    UISearchDisplayController *searchDisplayController= [[UISearchDisplayController alloc] initWithSearchBar:searchBar
//                                                                                          contentsController:self];
//    self.searchDisplayController.searchResultsDelegate = self;
//    self.searchDisplayController.searchResultsDataSource = self;
//    self.searchDisplayController.delegate = self;
//    self.navigationBar.topItem.titleView = searchBar;
    
    webView.scrollView.delegate = self;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.google.co.in/"]]];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat threshold = 20.0;
    CGFloat delta = fabs(self.lastContentOffset - scrollView.contentOffset.y);
    if (delta > threshold || scrollView.contentOffset.y <= 0) {
        if (self.lastContentOffset > scrollView.contentOffset.y && self.navigationBarTop.constant < 0 && (self.lastContentOffset < (scrollView.contentSize.height - scrollView.frame.size.height))) {
            [self showNavBar:true];
        } else if (self.lastContentOffset < scrollView.contentOffset.y && self.navigationBarTop.constant == 0 && (self.lastContentOffset > 0)) {
            [self showNavBar:false];
        }
    }
    self.lastContentOffset = scrollView.contentOffset.y;
}

- (void)showNavBar:(Boolean)isVisible {
    [UIView animateWithDuration:0.25 animations:^{
        self.navigationBarTop.constant = isVisible ? 0 : -(self.navigationBar.frame.size.height + UIApplication.sharedApplication.statusBarFrame.size.height);
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
    }];
}
@end
