#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

static void ShowName(int attempt)
{
    UIWindow *window = nil;
    for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
        if (![scene isKindOfClass:[UIWindowScene class]]) continue;
        for (UIWindow *w in ((UIWindowScene *)scene).windows) {
            if (w.isKeyWindow) { window = w; break; }
        }
        if (window) break;
    }

    if (!window) {
        if (attempt < 10) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{ ShowName(attempt + 1); });
        }
        return;
    }

    UILabel *label = [UILabel new];
    label.text = @"@RYUMAX1";
    label.font = [UIFont boldSystemFontOfSize:26.0];
    label.textColor = UIColor.blackColor;
    [label sizeToFit];
    label.frame = CGRectMake(0, 0, label.bounds.size.width, label.bounds.size.height);

    UIView *holder = [[UIView alloc] initWithFrame:CGRectMake(
        (window.bounds.size.width - label.bounds.size.width) / 2.0, 80,
        label.bounds.size.width, label.bounds.size.height)];
    holder.userInteractionEnabled = NO;

    CAGradientLayer *grad = [CAGradientLayer layer];
    grad.frame = holder.bounds;
    grad.colors = @[
        (id)[UIColor colorWithRed:0.00 green:0.80 blue:0.95 alpha:1].CGColor,
        (id)[UIColor colorWithRed:0.30 green:0.40 blue:1.00 alpha:1].CGColor,
        (id)[UIColor colorWithRed:0.95 green:0.20 blue:0.65 alpha:1].CGColor
    ];
    grad.startPoint = CGPointMake(0, 0.5);
    grad.endPoint = CGPointMake(1, 0.5
