#import "SmileyProvider.h"
#import "ProvidedSmileyModuleRootListController.h"

@implementation SmileyProvider

- (instancetype)init
{
  self = [super init];
  _moduleInstancesByIdentifier = [NSMutableDictionary new];
  return self;
}

- (NSUInteger)numberOfProvidedModules
{
  NSUInteger value = 1;

  NSString* numberOfProvidedModules = [[[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.opa334.smileyprovider"] objectForKey:@"ModuleNumber"];
  if(numberOfProvidedModules)
  {
    value = (NSUInteger)numberOfProvidedModules.integerValue;
  }

  return value;
}

- (NSString*)identifierForModuleAtIndex:(NSUInteger)index
{
  NSString* identifier = [NSString stringWithFormat:@"com.opa334.providedsmileymodule.%lu", (unsigned long)index];
  return identifier;
}

- (id)moduleInstanceForModuleIdentifier:(NSString*)identifier
{
  ProvidedSmileyModule* module = [[ProvidedSmileyModule alloc] init];
  module.settingsIdentifier = identifier;
  return module;
}

- (NSString*)displayNameForModuleIdentifier:(NSString*)identifier
{
  NSString* numString = [identifier stringByReplacingOccurrencesOfString:@"com.opa334.providedsmileymodule." withString:@""];
  NSString* displayName = [NSString stringWithFormat:@"Provided Smiley Module %i", [numString intValue]+1];
  return displayName;
}

- (BOOL)providesListControllerForModuleIdentifier:(NSString*)identifier
{
  return YES;
}

- (id)listControllerForModuleIdentifier:(NSString*)identifier
{
  ProvidedSmileyModuleRootListController* moduleListController = [[ProvidedSmileyModuleRootListController alloc] init];
  moduleListController.settingsIdentifier = identifier;
  moduleListController.displayName = [self displayNameForModuleIdentifier:identifier];
  return moduleListController;
}

- (UIImage*)settingsIconForModuleIdentifier:(NSString*)identifier
{
  return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

@end

void reloadSmileysNotificationReceived(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"smileyprovider/ReloadSmileys" object:nil];
}

__attribute__((constructor))
static void init(void)
{
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, reloadSmileysNotificationReceived, CFSTR("com.opa334.smileyprovider/ReloadSmileys"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}

