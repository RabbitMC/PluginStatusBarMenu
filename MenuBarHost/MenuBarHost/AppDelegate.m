//
//  AppDelegate.m
//  MenuBarHost
//
//  Created by Miralem Cebic on 25.07.17.
//  Copyright © 2017 Miralem Cebic. All rights reserved.
//

#import "AppDelegate.h"
#import "PluginProtocol.h"

@interface AppDelegate ()

@property NSMenu *statusMenu;
@property NSStatusItem *statusItem;

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
    
    // Load Plugin(s)
    NSArray *pluginDir = [[ NSFileManager defaultManager ] contentsOfDirectoryAtPath:[@"~/Library/Application Support/MenuBarHost/Plugins" stringByExpandingTildeInPath] error:nil];
    [pluginDir enumerateObjectsUsingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *fullPath = [[@"~/Library/Application Support/MenuBarHost/Plugins" stringByExpandingTildeInPath] stringByAppendingPathComponent:obj];
        NSBundle *pluginBundle = [NSBundle bundleWithPath:fullPath];
        Class principalClass = [pluginBundle principalClass];
        
        if ([principalClass conformsToProtocol:@protocol(PluginProtocol)]) {
            [pluginBundle load];
            NSObject<PluginProtocol> *plugin = [[principalClass alloc] init];
            [self.statusMenu addItem:[plugin menuItem]];
        } else {
            NSLog(@"Plug In does not conform to PluginProtocol: %@", (NSString *)obj);
        }
    }];
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
