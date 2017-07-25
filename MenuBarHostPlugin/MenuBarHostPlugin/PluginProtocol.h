//
//  PluginProtocol.h
//  MenuBarHostPlugin
//
//  Created by Miralem Cebic on 25.07.17.
//  Copyright © 2017 Miralem Cebic. All rights reserved.
//

#ifndef PluginProtocol_h
#define PluginProtocol_h

@protocol PluginProtocol <NSObject>
- (NSMenuItem *)menuItem;
@end

#endif /* PluginProtocol_h */
