//
//  AppDelegate.m
//  TestModel
//
//  Created by dulj on 17/6/6.
//  Copyright © 2017年 Lenovo. All rights reserved.
//


#import "AppDelegate.h"
#import "CellItem.h"
#import "MJExtension.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    /*
     1.如果是普通的json转model只需一句话mj_objectWithKeyValues即可
     2.如果model中有数据，数组中又是model，则记得调mj_setupObjectClassInArray指定数组中model的类型。
     3.记得加上mj_setupNewValueFromOldValue，来处理数据有问题的情况。
     4.归解档只需在@implementation中 加入MJExtensionCodingImplementation即可，不过若属性是model的，该model记得也要加MJExtensionCodingImplementation。
     */
    
    
    
    //从bundle中读取
    NSError *error;
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
    
    NSData *jsonData = [NSData dataWithContentsOfFile:sourcePath options:NSDataReadingMappedIfSafe error:&error];
    NSMutableDictionary *adic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
//    CellItem *item = [CellItem modelWithJSON:adic];
    
    //json数据转model
    CellItem *item = [CellItem mj_objectWithKeyValues:adic];
    NSLog(@"%@",item);
    
    
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"document:%@",documentPath);
    NSString *file = [documentPath stringByAppendingPathComponent:@"test.data"];
    
    //归档
    [NSKeyedArchiver archiveRootObject:item toFile:file];
    
    //解档
    CellItem *newItem = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    NSLog(@"%@",newItem);
    
    return YES;
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
