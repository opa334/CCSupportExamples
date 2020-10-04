#import <ControlCenterUIKit/CCUIToggleModule.h>
#import "CCSModuleProvider.h"
#import "ProvidedSmileyModule.h"

@interface SmileyProvider : NSObject <CCSModuleProvider>
{
  NSMutableDictionary* _moduleInstancesByIdentifier;
}


@end
