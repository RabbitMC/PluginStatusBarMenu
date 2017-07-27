//
//  PluginDelegate.m
//  MenuBarHostPlugin
//
//  Created by Miralem Cebic on 25.07.17.
//  Copyright © 2017 Miralem Cebic. All rights reserved.
//

#import "PluginDelegate.h"

@interface PluginDelegate()
@property NSWindowController *pluginWindowController;
@end

@implementation PluginDelegate

- (NSMenuItem *)menuItem {
    NSMenuItem *m = [[NSMenuItem alloc] initWithTitle:@"Open Plugin Window"
                                               action:@selector(openPluginWindow)
                                        keyEquivalent:@""];
    [m setTarget:self];
    m.enabled = YES;
    return m;
}

- (void)openPluginWindow {
//    // Show a Custom Window
//    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"PluginStoryboard" bundle:nil];
//    self.pluginWindowController = [sb instantiateControllerWithIdentifier:@"WindowController"];
//    [self.pluginWindowController showWindow:self];
    
    // Start a Application
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *app = [bundle pathForResource:@"MenuBarHostPluginApp" ofType:@"app"];
    [[NSWorkspace sharedWorkspace] launchApplication:app];

}

@end
