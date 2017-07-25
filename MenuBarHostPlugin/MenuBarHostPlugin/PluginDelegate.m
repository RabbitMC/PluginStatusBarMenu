//
//  PluginDelegate.m
//  MenuBarHostPlugin
//
//  Created by Miralem Cebic on 25.07.17.
//  Copyright © 2017 Miralem Cebic. All rights reserved.
//

#import "PluginDelegate.h"

@implementation PluginDelegate

- (NSMenuItem *)menuItem {
    NSMenuItem *m = [[NSMenuItem alloc] initWithTitle:@"Plugin Window..."
                                               action:@selector(openPluginWindow:)
                                        keyEquivalent:@""];
    [m setTarget:self];
    return m;
}

- (IBAction)openPluginWindow:(id)sender {
    
}

@end
