#import <ControlCenterUIKit/CCUIToggleModule.h>

@interface ProvidedSmileyModule : CCUIToggleModule
{
  BOOL _selected;
}
@property (nonatomic, retain) NSString* settingsIdentifier;

@end
