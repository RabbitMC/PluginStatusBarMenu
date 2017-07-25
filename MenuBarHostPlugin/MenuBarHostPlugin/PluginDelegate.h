//
//  PluginDelegate.h
//  MenuBarHostPlugin
//
//  Created by Miralem Cebic on 25.07.17.
//  Copyright © 2017 Miralem Cebic. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PluginProtocol.h"

@interface PluginDelegate : NSObject <PluginProtocol>

- (IBAction)openPluginWindow:(id)sender;

@end
