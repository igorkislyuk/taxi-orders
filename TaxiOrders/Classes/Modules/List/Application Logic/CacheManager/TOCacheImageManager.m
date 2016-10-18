//
// Created by Igor on 18/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOCacheImageManager.h"
#import "TOCacheImageManagerOutput.h"
#import "TOTaxiOrder.h"
#import "TOVehicle.h"

NSString *const TOCacheImageManagerImageServerKey = @"http://careers.ekassir.com/test/images/";

@interface TOCacheImageManager ()

@property (nonatomic, strong) NSOperationQueue *downloadQueue;

@end

@implementation TOCacheImageManager {
    dispatch_queue_t _backgroundQueue;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _backgroundQueue = dispatch_queue_create("com.test-assignment.TaxiOrders", DISPATCH_QUEUE_SERIAL);
    }

    return self;
}

- (void)getImagesForOrders:(NSArray *)orders {

    for (TOTaxiOrder *taxiOrder in orders) {

        //check if it exists
        NSString *photoName = taxiOrder.vehicle.photoName;
        UIImage *image = [self readImageWith:photoName];

        if (image) {

            if (self.output) {
                [self.output image:image didLoadForOrderID:taxiOrder.id];
            }

        } else {
            __weak typeof(self) weakSelf = self;
            dispatch_async(_backgroundQueue, ^(){
                __strong typeof(self) strongSelf = weakSelf;
                if (!strongSelf) {
                    return;
                }
                
                //get image url name
                NSString *imageName = photoName;
                UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[strongSelf urlFromImageName:imageName]]];

                //save it
                [strongSelf writeImage:image with:imageName];

                [strongSelf setDateOfLastLoadedImage:imageName];


                if (strongSelf.output && image) {
                    [strongSelf.output image:image didLoadForOrderID:taxiOrder.id];
                }

            });
        }
    }
}

- (nullable UIImage*)readImageWith:(NSString *)name {
    NSString *path = [self imagePathWith:name];

    UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
    if ([self isImageOutdatedWithName:name]) {
        image = nil;
    }

    return image;
}

- (void)writeImage:(UIImage *)image with:(NSString *)name {
    NSString *path = [self imagePathWith:name];
    [UIImagePNGRepresentation(image) writeToFile:path atomically:YES];
}

#pragma mark - Helpers

- (NSString *)imagePathWith:(NSString *)name {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [NSString stringWithFormat:@"%@/%@", paths[0], name];
    return path;
}

- (NSURL *)urlFromImageName:(NSString *)name {
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", TOCacheImageManagerImageServerKey, name]];
}

- (void)setDateOfLastLoadedImage:(NSString *)imageName {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setValue:[NSDate date] forKey:imageName];
    [userDefaults synchronize];
}

- (BOOL)isImageOutdatedWithName:(NSString *)imageName {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    NSDate *date = [userDefaults valueForKey:imageName];

    if (!date) {
        return NO;
    }
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *components = [calendar components:NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:currentDate toDate:date options:0];
//    NSInteger diff = components.minute;
    NSInteger diff = components.second;
    return diff > 10;
}

@end