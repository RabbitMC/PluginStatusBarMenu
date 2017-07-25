//
//  AppDelegate.m
//  MenuBarHost
//
//  Created by Miralem Cebic on 25.07.17.
//  Copyright © 2017 Miralem Cebic. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property NSMenu *statusMenu;
@property NSStatusItem *statusItem;
@property NSMutableArray *plugins;

@property NSWindowController *mainWindowController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    [self setupMenu];
    [self setupMenuIcon];
    
    NSMenuItem *aboutMenuItem = [[NSMenuItem alloc] initWithTitle:@"About Menu"
                                                           action:@selector(showAboutWindow)
                                                    keyEquivalent:@""];
    
    [self.statusMenu addItem:aboutMenuItem];
    [self.statusMenu addItem:[NSMenuItem separatorItem]];
}

- (void)setupMenu {
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    self.statusMenu = [[NSMenu alloc] init];
}

- (void)setupMenuIcon {
    self.statusItem.menu = self.statusMenu;
    self.statusItem.image = [NSImage imageNamed:@"status-bar-icon"];
    self.statusItem.highlightMode = YES;
}

- (void)showAboutWindow {
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    self.mainWindowController = [sb instantiateControllerWithIdentifier:@"WindowController"];

    // Show
    [self.mainWindowController showWindow:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
