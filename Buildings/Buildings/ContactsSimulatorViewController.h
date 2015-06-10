//
//  ContactsSimulatorViewController.h
//  Buildings
//
//  Created by zhangbin on 6/10/15.
//  Copyright (c) 2015 zoombin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContactsSimulatorViewControllerDelegate <NSObject>

- (void)didSelectContactWithName:(NSString *)name phone:(NSString *)phone;

@end

@interface ContactsSimulatorViewController : UIViewController

@property (nonatomic, weak) id <ContactsSimulatorViewControllerDelegate> delegate;

@end
