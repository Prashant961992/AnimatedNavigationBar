//
//  AppDelegate.h
//  BrowserApp
//
//  Created by Prashant Prajapati on 04/04/18.
//  Copyright © 2018 Prashant Prajapati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

