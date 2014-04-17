#import "Unskeuminders.h"
#define EVIL_MODE YES

%group Good

%hook RemindersCardBackgroundView

-(void)useScrollingTexture:(BOOL)arg1 {
    %orig(YES);
}

%end

%hook RemindersScrollingBackgroundView

+ (id)kitPaperTextureImage {
    _UIResizableImage *original = %orig();
    CGRect rect = (CGRect){CGPointZero, original.size};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] setFill];
    CGContextFillRect(context, rect);
    UIImage *replacement = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return replacement;
}

%end

%end // %group Good

%ctor {
    if (!EVIL_MODE) {
        %init(Good);
    }

    // Don't have permissions, but it's a good idea in theory...
    else {
    	CGRect rect = (CGRect){CGPointZero, (CGSize){240.0, 240.0}};
    	UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    	CGContextRef context = UIGraphicsGetCurrentContext();
    	[[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:18.0] addClip];
    	[[UIColor whiteColor] setFill];
    	CGContextFillRect(context, rect);
    	UIImage *replacement = UIGraphicsGetImageFromCurrentImageContext();
    	UIGraphicsEndImageContext();

    	UIImageView *shadower = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 283.0, 283.0)];
    	shadower.image = replacement;
    	shadower.contentMode = UIViewContentModeCenter;
    	shadower.layer.shadowColor = [UIColor blackColor].CGColor;
    	shadower.layer.shadowOffset = CGSizeMake(0.0, -1.0);
    	shadower.layer.shadowOpacity = 0.5;

    	UIGraphicsBeginImageContextWithOptions(shadower.frame.size, NO, 0.0);
        [shadower.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *compound = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

        NSString *texturePath = @"/Applications/Reminders.app/RemindersCard@2x~iphone.png";
        NSError *error;
        BOOL success = [[NSFileManager defaultManager] removeItemAtPath:texturePath error:&error];

        [UIImagePNGRepresentation(compound) writeToFile:texturePath atomically:YES];
        NSLog(@"[Unskeuminders] Tried to write %@ to path %@, success: %@, error: %@", compound, texturePath, success ? @"YES" : @"NO", error);
    }
}
