#import <UIKit/UIKit.h>

@interface RemindersCardBackgroundView : UIView
+ (id)roundedTextureImage;
-(void)useScrollingTexture:(BOOL)arg1;
@end

@interface RemindersScrollingBackgroundView : UIView
+ (id)kitPaperTextureImage;
-(void)setTextureImage:(id)arg1;
@end

@interface _UIResizableImage : UIImage

+ (BOOL)supportsSecureCoding;

- (void)_configureFromImage:(id)arg1;
- (CGRect)_contentInsetsInPixels:(UIEdgeInsets)arg1 emptySizeFallback:(id)arg2;
- (CGRect)_contentRectInPixels;
- (CGRect)_contentStretchInPixels;
- (id)_initWithOtherImage:(id)arg1;
- (BOOL)_isResizable;
- (BOOL)_isSubimage;
- (BOOL)_isTiledWhenStretchedToSize:(CGSize)arg1;
- (id)_resizableImageWithCapMask:(int)arg1;
- (void)_setAlwaysStretches:(BOOL)arg1;
- (void)_setCapInsets:(UIEdgeInsets)arg1;
- (void)_setSubimageInsets:(UIEdgeInsets)arg1;
- (BOOL)_suppressesAccessibilityHairlineThickening;
- (UIEdgeInsets)capInsets;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;
- (id)initWithImage:(id)arg1 capInsets:(UIEdgeInsets)arg2;
- (int)resizingMode;
@end

// static BOOL unskeuShouldRoundCorners;

%hook RemindersCardBackgroundView

-(void)useScrollingTexture:(BOOL)arg1 {
//    unskeuShouldRoundCorners = YES;
    %orig(YES);
//    unskeuShouldRoundCorners = NO;
}

%end

%hook RemindersScrollingBackgroundView

+ (id)kitPaperTextureImage {
    _UIResizableImage *original = %orig();
    CGRect rect = (CGRect){CGPointZero, original.size};

/*    if (unskeuShouldRoundCorners) {
        //CGRect rect = (CGRect){CGPointZero, (CGSize){283.0, 283.0}};
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:4.0] addClip];
        [[UIColor whiteColor] setFill];
        CGContextFillRect(context, rect);
        CGContextSetShadowWithColor(context, (CGSize){0.0, -3.0}, 20.0, [UIColor blackColor].CGColor);
        replacement = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
*/

//    else {
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [[UIColor whiteColor] setFill];
        CGContextFillRect(context, rect);
        UIImage *replacement = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
//    }

    // _UIResizableImage *resizable = [[%c(_UIResizableImage) alloc] initWithImage:replacement capInsets:original.capInsets];
    // [resizable _setAlwaysStretches:YES];

    return replacement;
}

%end
